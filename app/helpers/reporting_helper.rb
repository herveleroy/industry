module ReportingHelper

  def dendogram()
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

  def sankey()

    def create_node(name)
      node =  @nodes.detect { |el| el["name" ] == name }
      if node.nil?
        node = {  "name" => name}
        @nodes << node
        index = @nodes.length - 1
      else
        index = @nodes.index(node)
      end
        return index
    end

    @nodes = []
    @links = []

    @chrysalis = Chrysali.all
    @chrysalis.each do |chrysali|
      target_chrysali = create_node(chrysali.title)
      @caterpillars = chrysali.caterpillars

      @caterpillars.each do |caterpillar|
        target_caterpillar = create_node(caterpillar.title)
        @ideas = caterpillar.ideas
        @ideas.each do |idea|
          source_idea = create_node(idea.title)
          link = {"source" => source_idea, "target" => target_caterpillar, "value" =>1}
          @links << link
        end
        link = {"source" => target_caterpillar, "target" => target_chrysali, "value" =>1}
        @links << link
      end
    end

    @sankey =  {"nodes" => @nodes, "links" => @links}

  end

end


