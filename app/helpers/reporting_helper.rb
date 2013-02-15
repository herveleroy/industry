module ReportingHelper

  def D3()
    @dendogram = {}
    @ideas = []
    @caterpillars = []

    def create_idea(name, id )
      idea =  @ideas.detect { |el| el["id" ] == id }
      if idea.nil?
        idea = {  "name" => name, "id" => id}
        @ideas << idea
      end
        return idea
    end

    def create_caterpillar(name, id )
      caterpillar =  @caterpillars.detect { |el| el["id" ] == id }
      if caterpillar.nil?
         @children = []
          # collect all ideas for this caterpillar
          @cat_ideas = Caterpillar.find(id).ideas
          @cat_ideas.each do |cat_idea|
            child = create_idea(cat_idea.title, cat_idea.id)
            @children << child
          end
          caterpillar = {  "name" => name, "id" => id, :children => @children}
          @caterpillars << caterpillar
      end
        return caterpillar
    end

    caterpillars= Caterpillar.all
    @root_children =[]
    caterpillars.each do |caterpillar|
      child = create_caterpillar(caterpillar.title, caterpillar.id)
      @root_children << child
    end

    @dendogram = {  "name" => "root",  "id" => 0 , "children" => @root_children}

  end

end


