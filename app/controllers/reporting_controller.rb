class ReportingController < ApplicationController

  dimension_sym = []
    @dimensions = Taxinomy.all.group_by(&:dimension)
    @dimensions.each do |dim, rule|
      dimension_sym << dim.to_sym
    end
  DataRow = Struct.new(:id, :title, *dimension_sym)




  def dendogram
     @challenge = Challenge.find(current_user.current_challenge)
  end

  def sankey
     @challenge = Challenge.find(current_user.current_challenge)
  end

  def dynamic_tree
     @challenge = Challenge.find(current_user.current_challenge)
  end

  def pack_hierarchy
     @challenge = Challenge.find(current_user.current_challenge)
  end

  def afm
    dimension = []
    @dimensions = Taxinomy.all.group_by(&:dimension)
    @dimensions.each do |dim, rule|
      dimension << dim
    end
    @structs = []
    @ideas = Idea.all
    @ideas.each do |idea|
      logger.debug "--------------------------------- #{idea.title}"
      object = DataRow.new
      logger.debug "--------------------------------- #{object.to_a}"
      object.id = idea.id
      object.title = idea.title
      dimension.each do |d|
        object.send("#{d}=", "NA")
      end
      idea.taxon_list.each do |taxon|
        tag = Tag.find_by_name(taxon)
        dim = tag.taxinomy.dimension
        object.send("#{dim}=", taxon)
      end
    @structs << object
    end

  end


end
