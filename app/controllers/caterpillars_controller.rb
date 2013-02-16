# encoding: utf-8
class CaterpillarsController < ApplicationController

  autocomplete :tag, :name

  before_filter :set_title

  def set_title
    @page_title = "Chenilles"
  end

  # GET /caterpillars
  # GET /caterpillars.json
  def index

    with = {}
    conditions = {}
    sort_mode = params[:sorting].blank? ? "@relevance DESC" : "#{params[:sorting]} DESC"
    search_string = params[:search].blank? ? "" : params[:search]
    with[:tags] = params[:tags] if params[:tags]
    conditions[:object_state] = params[:state] if !params[:state].blank?

    if conditions.blank?
      @caterpillars = Caterpillar.search search_string, :with => with,  :page => params[:page], :per_page => 42, :order => sort_mode
    else
       @caterpillars = Caterpillar.search search_string, :with => with, :conditions => conditions, :page => params[:page], :per_page => 42, :order => sort_mode, :match_mode => :any
    end
    @facets = Caterpillar.facets search_string, :with => with
    @tags = @facets[:tags].map{|t| t[0] unless t[0] == 0 }.compact.uniq
    @selected_tags = params[:tags] || []
    @count = @caterpillars.count
    @sort_mode  = case params[:sorting]
      when "@relevance"  then "pertinence"
      when "created_at"  then "date de création"
      when "cached_votes_score"  then "score"
      else  ""
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caterpillars }
    end
  end

  # GET /caterpillars/1
  # GET /caterpillars/1.json
  def show
    @page_title = "Chenille"
    @caterpillar = Caterpillar.find(params[:id])
    @all_comments = @caterpillar.root_comments
    search_string = @caterpillar.tag_list.join(" ")
    @similar_caterpillars = Caterpillar.search( search_string, :match_mode => :all)
    @knowledges = @caterpillar.knowledges
    @comments_count = @all_comments.size
    @knowledges.each do |k|
      @documents = @documents.nil? ? k.documents : @documents << k.documents
    end
    @ideas = @caterpillar.ideas
    @tasks = @caterpillar.tasks
    @task = Task.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caterpillar }
    end
  end

  # GET /caterpillars/new
  # GET /caterpillars/new.json
  def new
    @caterpillar = Caterpillar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caterpillar }
    end
  end

  # GET /caterpillars/1/edit
  def edit
    @caterpillar = Caterpillar.find(params[:id])
  end

  # POST /caterpillars
  # POST /caterpillars.json
  def create
    @caterpillar = Caterpillar.new(params[:caterpillar])
    @caterpillar.author_id = current_user.id

    respond_to do |format|
      if @caterpillar.save
        format.html { redirect_to @caterpillar, notice: 'Caterpillar was successfully created.' }
        format.json { render json: @caterpillar, status: :created, location: @caterpillar }
      else
        format.html { render action: "new" }
        format.json { render json: @caterpillar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caterpillars/1
  # PUT /caterpillars/1.json
  def update
    @caterpillar = Caterpillar.find(params[:id])

    respond_to do |format|
      if @caterpillar.update_attributes(params[:caterpillar])
        format.html { redirect_to @caterpillar, notice: 'Caterpillar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caterpillar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caterpillars/1
  # DELETE /caterpillars/1.json
  def destroy
    @caterpillar = Caterpillar.find(params[:id])
    @caterpillar.destroy

    respond_to do |format|
      format.html { redirect_to caterpillars_url }
      format.json { head :no_content }
    end
  end

  def like
    @caterpillar = Caterpillar.find(params[:id])
    if current_user.voted_up_on? @caterpillar
      current_user.dislikes @caterpillar
      @like = false
    else
      current_user.likes @caterpillar
      @like = true
    end
    @count = @caterpillar.likes.size
  end

  def search
    search_string = params[:search]
    @caterpillars = Caterpillar.search(search_string, :match_mode => :all).to_json.html_safe
  end

  def add_knowledges
    @caterpillar = Caterpillar.find(params[:id])
    @caterpillar.knowledges<< Knowledge.find(params[:knowledge_id])
  end

  def add_ideas
    @caterpillar = Caterpillar.find(params[:id])
    @caterpillar.ideas<< Idea.find(params[:idea_id])
  end

  def event
    @caterpillar = Caterpillar.find(params[:id])
    event = params[:event]
    case event
      when "reject"
        @caterpillar.do_reject
      when "select"
        @caterpillar.do_select
      when "validate"
        @caterpillar.do_validate
      when "pause"
        @caterpillar.do_pause
    end
    @event = @caterpillar.state

  end
end
