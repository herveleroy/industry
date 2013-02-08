class CaterpillarsController < ApplicationController

  autocomplete :tag, :name

  # GET /caterpillars
  # GET /caterpillars.json
  def index
    @caterpillars = Caterpillar.paginate(:page => params[:page]).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caterpillars }
    end
  end

  # GET /caterpillars/1
  # GET /caterpillars/1.json
  def show
    @caterpillar = Caterpillar.find(params[:id])
    @all_comments = @caterpillar.root_comments
    search_string = @caterpillar.tag_list.join(" ")
    @similar_caterpillars = Caterpillar.search( search_string, :match_mode => :all)
    @knowledges = @caterpillar.knowledges

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
    @caterpillars = Caterpillar.search(search_string, :match_mode => :any).to_json.html_safe
  end

  def add_knowledges
    @caterpillar = Caterpillar.find(params[:id])
    @caterpillar.knowledges<< Knowledge.find(params[:knowledge_id])
  end
end
