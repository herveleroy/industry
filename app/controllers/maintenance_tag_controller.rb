class MaintenanceTagController < ApplicationController
  def index

  end

  def search_tag
    @keyword = params[:tag]
    @similar_tags = Tag.search @keyword, :match_mode => :any
    @result = ""
    @similar_tags.each do |tag|
      @result = @result + "<li><a href='#' id='" + tag.id.to_s + "'>" + tag.name + "</a></li>"
    end
  end

  def add_taxon_rule
    @tags = params[:group_id].split(",")
    @taxon= params[:target_id]
    @taxon_name = @taxon.empty? ? "" : Tag.find(@taxon).name
    @tags_list = @tags.empty? ? "" : Tag.find(@tags).map{|t| t.name}
    @result = false
    if @tags.any? && !@taxon.empty?
      @taxon_rule = TaxonRule.new
      @taxon_rule.tags = @tags
      @taxon_rule.taxon= @taxon
      @result = @taxon_rule.save
    end
  end



end
