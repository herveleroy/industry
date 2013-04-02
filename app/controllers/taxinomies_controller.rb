class TaxinomiesController < ApplicationController
  # GET /taxinomies
  # GET /taxinomies.json
  def index
    @taxinomies = Taxinomy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taxinomies }
    end
  end

  # GET /taxinomies/1
  # GET /taxinomies/1.json
  def show
    @taxinomy = Taxinomy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxinomy }
    end
  end

  # GET /taxinomies/new
  # GET /taxinomies/new.json
  def new
    @taxinomy = Taxinomy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taxinomy }
    end
  end

  # GET /taxinomies/1/edit
  def edit
    @taxinomy = Taxinomy.find(params[:id])
  end

  # POST /taxinomies
  # POST /taxinomies.json
  def create
    @taxinomy = Taxinomy.new(params[:taxinomy])

    respond_to do |format|
      if @taxinomy.save
        format.html { redirect_to @taxinomy, notice: 'Taxinomy was successfully created.' }
        format.json { render json: @taxinomy, status: :created, location: @taxinomy }
      else
        format.html { render action: "new" }
        format.json { render json: @taxinomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taxinomies/1
  # PUT /taxinomies/1.json
  def update
    @taxinomy = Taxinomy.find(params[:id])

    respond_to do |format|
      if @taxinomy.update_attributes(params[:taxinomy])
        format.html { redirect_to @taxinomy, notice: 'Taxinomy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @taxinomy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxinomies/1
  # DELETE /taxinomies/1.json
  def destroy
    @taxinomy = Taxinomy.find(params[:id])
    @taxinomy.destroy

    respond_to do |format|
      format.html { redirect_to taxinomies_url }
      format.json { head :no_content }
    end
  end

  # =========

  def arrange
    @taxinomies = Taxinomy.all.group_by(&:dimension)
    @taxons = Tag.includes(:taxinomy).where("tags.taxon = 1  AND taxinomies.tag_id is NULL")
  end

  def add_tag_to_dimension
    tag_id = params[:tag_id]
    @tag = Tag.find(tag_id)
    dimension = params[:dimension]

    respond_to do |format|
      if Taxinomy.create(:dimension => dimension, :tag_id=> tag_id, :weight => 1, :position => 0)
        format.json { render :json => {:tag => @tag, :dimension => dimension }}
      else
        format.js
      end
    end
  end

  def remove_tag_from_dimension
    tag_id = params[:tag_id]
    @tag = Tag.find(tag_id)
    @taxinomy = @tag.taxinomy

    respond_to do |format|
      if @taxinomy.destroy
        format.json { render :json => {:tag => @tag }}
      else
        format.js
      end
    end
  end
end
