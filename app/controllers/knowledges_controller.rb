# encoding: utf-8
class KnowledgesController < ApplicationController

  before_filter :set_title

  def set_title
    @page_title = "Savoirs"
  end
  # GET /knowledges
  # GET /knowledges.json
  def index
    with = {}
    sort_mode = params[:sorting].blank? ? "@relevance DESC" : "#{params[:sorting]} DESC"
    search_string = params[:search].blank? ? "" : params[:search]
    with[:tags] = params[:tags] if params[:tags]
    @knowledges = Knowledge.search search_string, :with => with, :page => params[:page], :per_page => 42, :order => sort_mode
    @facets = Knowledge.facets search_string, :with => with
    @tags = @facets[:tags].map{|t| t[0] unless t[0] == 0 }.compact.uniq
    @selected_tags = params[:tags] || []
    @count = @knowledges.count
    @sort_mode  = case params[:sorting]
      when "@relevance"  then "pertinence"
      when "created_at"  then "date de création"
      when "cached_votes_score"  then "score"
      else  ""
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @knowledges }
    end
  end

  # GET /knowledges/1
  # GET /knowledges/1.json
  def show
    @knowledge = Knowledge.find(params[:id])
    @documents = @knowledge.documents

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @knowledge }
    end
  end

  # GET /knowledges/new
  # GET /knowledges/new.json
  def new
    @knowledge = Knowledge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @knowledge }
    end
  end

  # GET /knowledges/1/edit
  def edit
    @knowledge = Knowledge.find(params[:id])
  end

  # POST /knowledges
  # POST /knowledges.json
  def create
    @knowledge = Knowledge.new(params[:knowledge])

    respond_to do |format|
      if @knowledge.save
        format.html { redirect_to @knowledge, notice: 'Knowledge was successfully created.' }
        format.json { render json: @knowledge, status: :created, location: @knowledge }
      else
        format.html { render action: "new" }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /knowledges/1
  # PUT /knowledges/1.json
  def update
    @knowledge = Knowledge.find(params[:id])

    respond_to do |format|
      if @knowledge.update_attributes(params[:knowledge])
        format.html { redirect_to @knowledge, notice: 'Knowledge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledges/1
  # DELETE /knowledges/1.json
  def destroy
    @knowledge = Knowledge.find(params[:id])
    @knowledge.destroy

    respond_to do |format|
      format.html { redirect_to knowledges_url }
      format.json { head :no_content }
    end
  end

  def search
    search_string = params[:search]
    @knowledges = Knowledge.search(search_string, :match_mode => :all).to_json.html_safe
  end
end
