class TaxonRulesController < ApplicationController
  # GET /taxon_rules
  # GET /taxon_rules.json
  def index
    @taxon_rules = TaxonRule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taxon_rules }
    end
  end

  # GET /taxon_rules/1
  # GET /taxon_rules/1.json
  def show
    @taxon_rule = TaxonRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxon_rule }
    end
  end

  # GET /taxon_rules/new
  # GET /taxon_rules/new.json
  def new
    @taxon_rule = TaxonRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taxon_rule }
    end
  end

  # GET /taxon_rules/1/edit
  def edit
    @taxon_rule = TaxonRule.find(params[:id])
  end

  # POST /taxon_rules
  # POST /taxon_rules.json
  def create
    @taxon_rule = TaxonRule.new(params[:taxon_rule])

    respond_to do |format|
      if @taxon_rule.save
        format.html { redirect_to @taxon_rule, notice: 'Taxon rule was successfully created.' }
        format.json { render json: @taxon_rule, status: :created, location: @taxon_rule }
      else
        format.html { render action: "new" }
        format.json { render json: @taxon_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taxon_rules/1
  # PUT /taxon_rules/1.json
  def update
    @taxon_rule = TaxonRule.find(params[:id])

    respond_to do |format|
      if @taxon_rule.update_attributes(params[:taxon_rule])
        format.html { redirect_to @taxon_rule, notice: 'Taxon rule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @taxon_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxon_rules/1
  # DELETE /taxon_rules/1.json
  def destroy
    @taxon_rule = TaxonRule.find(params[:id])
    @taxon_rule.destroy

    respond_to do |format|
      format.html { redirect_to taxon_rules_url }
      format.json { head :no_content }
    end
  end
end
