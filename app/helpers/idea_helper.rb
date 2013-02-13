module IdeaHelper
  def all_tags_data
    Tag.all.map{|t| t.name}
  end
end
