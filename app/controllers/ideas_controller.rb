class IdeasController < ApplicationController

  autocomplete :tag, :name

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.paginate(:page => params[:page]).order('created_at DESC')

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
    @comments_count = @all_comments.size



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

  def add_knowledges
    @idea = Idea.find(params[:id])
    @idea.knowledges<< Knowledge.find(params[:knowledge_id])
  end

end
