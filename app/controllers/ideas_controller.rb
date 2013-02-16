# encoding: utf-8
class IdeasController < ApplicationController

  autocomplete :tag, :name

   before_filter :set_title

  def set_title
    @page_title = "Oeufs"
  end

  # GET /ideas
  # GET /ideas.json
  def index
    with = {}
    sort_mode = params[:sorting].blank? ? "@relevance DESC" : "#{params[:sorting]} DESC"
    search_string = params[:search].blank? ? "" : params[:search]
    with[:tags] = params[:tags] if params[:tags]
    @ideas = Idea.search search_string, :with => with, :page => params[:page], :per_page => 42, :order => sort_mode
    @facets = Idea.facets search_string, :with => with
    @tags = @facets[:tags].map{|t| t[0] unless t[0] == 0 }.compact.uniq
    @selected_tags = params[:tags] || []
    @count = @ideas.count
    @sort_mode  = case params[:sorting]
      when "@relevance"  then "pertinence"
      when "created_at"  then "date de création"
      when "cached_votes_score"  then "score"
      else  ""
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])
    @all_comments = @idea.root_comments
    search_string = @idea.tag_list.join(" ")
    @similar_ideas = Idea.search( search_string, :match_mode => :all)
    @knowledges = @idea.knowledges
    @caterpillars = @idea.caterpillars
    @comments_count = @all_comments.size
    @knowledges.each do |k|
      @documents = @documents.nil? ? k.documents : @documents << k.documents
    end



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])
    @idea.author_id = current_user.id

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  def like
    @idea = Idea.find(params[:id])
    if current_user.voted_up_on? @idea
      current_user.dislikes @idea
      @like = false
    else
      current_user.likes @idea
      @like = true
    end
    @count = @idea.likes.size
  end

  def search
    search_string = params[:search]
    @ideas = Idea.search(search_string, :match_mode => :all).to_json.html_safe
  end

  def add_knowledges
    @idea = Idea.find(params[:id])
    @idea.knowledges << Knowledge.find(params[:knowledge_id])
  end

  def add_caterpillars
    @idea = Idea.find(params[:id])
    @idea.caterpillars << Caterpillar.find(params[:caterpillar_id])
  end

  def add_tags
    newtag = params[:tags].split(",")
    @ideas = Idea.find(params[:new_tag_id].split(","))
    @ideas.each do |idea|
      idea.tag_list.add(newtag)
      idea.save
    end
  end

end
