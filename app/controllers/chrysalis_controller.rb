# encoding: utf-8
class ChrysalisController < ApplicationController

  autocomplete :tag, :name

  before_filter :set_title

  def set_title
    @page_title = "Chrysalides"
  end

  # GET /chrysalis
  # GET /chrysalis.json
  def index
    with = {}
    conditions = {}
    sort_mode = params[:sorting].blank? ? "@relevance DESC" : "#{params[:sorting]} DESC"
    search_string = params[:search].blank? ? "" : params[:search]
    with[:tags] = params[:tags] if params[:tags]
    conditions[:object_state] = params[:state] if !params[:state].blank?

    if conditions.blank?
      @chrysalis = Chrysali.search search_string, :with => with,  :page => params[:page], :per_page => 42, :order => sort_mode
    else
       @chrysalis = Chrysali.search search_string, :with => with, :conditions => conditions, :page => params[:page], :per_page => 42, :order => sort_mode, :match_mode => :any
    end
    @facets = Chrysali.facets search_string, :with => with
    @tags = @facets[:tags].map{|t| t[0] unless t[0] == 0 }.compact.uniq
    @selected_tags = params[:tags] || []
    @count = @chrysalis.count
    @sort_mode  = case params[:sorting]
      when "@relevance"  then "pertinence"
      when "created_at"  then "date de création"
      when "cached_votes_score"  then "score"
      else  ""
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chrysalis }
    end
  end

  # GET /chrysalis/1
  # GET /chrysalis/1.json
  def show
    @page_title = "Chrysalide"
    @chrysali = Chrysali.find(params[:id])
    @all_comments = @chrysali.root_comments
    search_string = @chrysali.tag_list.join(" ")
    @similar_chrysalis = Chrysali.search( search_string, :match_mode => :all)
    @knowledges = @chrysali.knowledges
    @comments_count = @all_comments.size
    @knowledges.each do |k|
      @documents = @documents.nil? ? k.documents : @documents << k.documents
    end
    @caterpillars = @chrysali.caterpillars
    @tasks = @chrysali.tasks
    @task = Task.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chrysali }
    end
  end

  # GET /chrysalis/new
  # GET /chrysalis/new.json
  def new
    @chrysali = Chrysali.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chrysali }
    end
  end

  # GET /chrysalis/1/edit
  def edit
    @chrysali = Chrysali.find(params[:id])
  end

  # POST /chrysalis
  # POST /chrysalis.json
  def create
    @chrysali = Chrysali.new(params[:chrysali])
    @chrysali.author_id = current_user.id

    respond_to do |format|
      if @chrysali.save
        format.html { redirect_to @chrysali, notice: 'Chrysali was successfully created.' }
        format.json { render json: @chrysali, status: :created, location: @chrysali }
      else
        format.html { render action: "new" }
        format.json { render json: @chrysali.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chrysalis/1
  # PUT /chrysalis/1.json
  def update
    @chrysali = Chrysali.find(params[:id])

    respond_to do |format|
      if @chrysali.update_attributes(params[:chrysali])
        format.html { redirect_to @chrysali, notice: 'Chrysali was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chrysali.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chrysalis/1
  # DELETE /chrysalis/1.json
  def destroy
    @chrysali = Chrysali.find(params[:id])
    @chrysali.destroy

    respond_to do |format|
      format.html { redirect_to chrysalis_url }
      format.json { head :no_content }
    end
  end

  def like
    @chrysali = Chrysali.find(params[:id])
    if current_user.voted_up_on? @chrysali
      current_user.dislikes @chrysali
      @like = false
    else
      current_user.likes @chrysali
      @like = true
    end
    @count = @chrysali.likes.size
  end

  def search
    search_string = params[:search]
    @chrysalis = Chrysali.search(search_string, :match_mode => :all).to_json.html_safe
  end

  def add_knowledges
    @chrysali = Chrysali.find(params[:id])
    @chrysali.knowledges<< Knowledge.find(params[:knowledge_id])
  end

  def add_caterpillars
    @chrysali = Chrysali.find(params[:id])
    @chrysali.caterpillars<< Caterpillar.find(params[:caterpillar_id])
  end

  def event
    @chrysali = Chrysali.find(params[:id])
    event = params[:event]
    case event
      when "reject"
        @chrysali.do_reject
      when "select"
        @chrysali.do_select
      when "validate"
        @chrysali.do_validate
      when "pause"
        @chrysali.do_pause
    end
    @event = @chrysali.state
  end

  def add_tags
    newtag = params[:tags].split(",")
    @chrysalis = Chrysali.find(params[:new_tag_id].split(","))
    @chrysalis.each do |chrysali|
      chrysali.tag_list.add(newtag)
      chrysali.save
    end
  end

end
