# encoding: utf-8
class ButterfliesController < ApplicationController
   autocomplete :tag, :name

  before_filter :set_title

  def set_title
    @page_title = "Papillons"
  end
  # GET /butterflies
  # GET /butterflies.json
  def index
    with = {}
    conditions = {}
    sort_mode = params[:sorting].blank? ? "@relevance DESC" : "#{params[:sorting]} DESC"
    search_string = params[:search].blank? ? "" : params[:search]
    with[:tags] = params[:tags] if params[:tags]
    conditions[:object_state] = params[:state] if !params[:state].blank?

    if conditions.blank?
      @butterflies = Butterfly.search search_string, :with => with,  :page => params[:page], :per_page => 42, :order => sort_mode
    else
       @butterflies = Butterfly.search search_string, :with => with, :conditions => conditions, :page => params[:page], :per_page => 42, :order => sort_mode, :match_mode => :any
    end
    @facets = Butterfly.facets search_string, :with => with
    @tags = @facets[:tags].map{|t| t[0] unless t[0] == 0 }.compact.uniq
    @selected_tags = params[:tags] || []
    @count = @butterflies.count
    @sort_mode  = case params[:sorting]
      when "@relevance"  then "pertinence"
      when "created_at"  then "date de création"
      when "cached_votes_score"  then "score"
      else  ""
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @butterflies }
    end
  end

  # GET /butterflies/1
  # GET /butterflies/1.json
  def show
    @page_title = "Papillons"
    @butterfly = Butterfly.find(params[:id])
    @all_comments = @butterfly.root_comments
    search_string = @butterfly.tag_list.join(" ")
    @similar_butterflies = Butterfly.search( search_string, :match_mode => :all)
    @knowledges = @butterfly.knowledges
    @comments_count = @all_comments.size
    @knowledges.each do |k|
      @documents = @documents.nil? ? k.documents : @documents << k.documents
    end
    @chrysalis = @butterfly.chrysalis
    @tasks = @butterfly.tasks
    @task = Task.new


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @butterfly }
    end
  end

  # GET /butterflies/new
  # GET /butterflies/new.json
  def new
    @butterfly = Butterfly.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @butterfly }
    end
  end

  # GET /butterflies/1/edit
  def edit
    @butterfly = Butterfly.find(params[:id])
  end

  # POST /butterflies
  # POST /butterflies.json
  def create
    @butterfly = Butterfly.new(params[:butterfly])
    @butterfly.author_id = current_user.id

    respond_to do |format|
      if @butterfly.save
        format.html { redirect_to @butterfly, notice: 'Butterfly was successfully created.' }
        format.json { render json: @butterfly, status: :created, location: @butterfly }
      else
        format.html { render action: "new" }
        format.json { render json: @butterfly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /butterflies/1
  # PUT /butterflies/1.json
  def update
    @butterfly = Butterfly.find(params[:id])

    respond_to do |format|
      if @butterfly.update_attributes(params[:butterfly])
        format.html { redirect_to @butterfly, notice: 'Butterfly was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @butterfly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /butterflies/1
  # DELETE /butterflies/1.json
  def destroy
    @butterfly = Butterfly.find(params[:id])
    @butterfly.destroy

    respond_to do |format|
      format.html { redirect_to butterflies_url }
      format.json { head :no_content }
    end
  end

  def like
    @butterfly = Butterfly.find(params[:id])
    if current_user.voted_up_on? @butterfly
      current_user.dislikes @butterfly
      @like = false
    else
      current_user.likes @butterfly
      @like = true
    end
    @count = @butterfly.likes.size
  end

  def search
    search_string = params[:search]
    @butterfly = Butterfly.search(search_string, :match_mode => :all).to_json.html_safe
  end

  def add_knowledges
    @butterfly = Butterfly.find(params[:id])
    @butterfly.knowledges<< Knowledge.find(params[:knowledge_id])
  end

  def add_chrysalis
    @butterfly = Butterfly.find(params[:id])
    @butterfly.chrysalis<< Chrysali.find(params[:chrysali_id])
  end

  def event
    @butterfly = Butterfly.find(params[:id])
    event = params[:event]
    case event
      when "reject"
        @butterfly.do_reject
      when "select"
        @butterfly.do_select
      when "validate"
        @butterfly.do_validate
      when "pause"
        @butterfly.do_pause
    end
    @event = @butterfly.state
  end

  def add_tags
    newtag = params[:tags].split(",")
    @butterflies = Butterfly.find(params[:new_tag_id].split(","))
    @butterflies.each do |butterfly|
      butterfly.tag_list.add(newtag)
      butterfly.save
    end
  end

end
