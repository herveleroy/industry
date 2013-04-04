class TagsController < ApplicationController
  autocomplete :tag, :name, :full => true
  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.paginate(:page => params[:page]).order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  def normalized_skill
    @tag = Tag.find(params[:id])
    @success = TargetTag.find_or_create_by_name_and_category(:name => @tag.name, :category => "skill")
  end
  def normalized_sector
    @tag = Tag.find(params[:id])
    @success = TargetTag.find_or_create_by_name_and_category(:name => @tag.name, :category => "sector")
  end

  def slice
  end

  def slice_tag
    @old_id = params[:old_id]
    if  @old_id != "Id"
      @tag_name = params[:tag]
      array_tags = params[:group_id].split(",")
      @array_id = []
      array_tags.each do |tag|
        @array_id << Tag.find_or_create_by_name(:name => tag.strip).id
      end
      if not @array_id.empty?
        @slice_tag = @array_id.to_s
        DuplicateTag.create(:old_tag_id => @old_id, :slice_tag => @array_id, :action => "slice")
        @success = true
      end
    end
  end

end
