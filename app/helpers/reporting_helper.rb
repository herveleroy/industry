module ReportingHelper

  def dendogram()
    @dendogram = {}
    @ideas = []
    @caterpillars = []
    @chrysalis = []
    @butterflies = []

    def create_idea(name, id , size)
      idea =  @ideas.detect { |el| el["id" ] == id }
      if idea.nil?
        idea = {  "name" => name, "id" => id, "size" => size}
        @ideas << idea
      end
        return idea
    end

    def create_caterpillar(name, id, size)
      caterpillar =  @caterpillars.detect { |el| el["id" ] == id }
      if caterpillar.nil?
         @caterpillar_children = []
          # collect all ideas for this caterpillar
          @cat_ideas = Caterpillar.find(id).ideas
          @cat_ideas.each do |cat_idea|
            size = cat_idea.likes.size.to_i + 1
            child = create_idea(cat_idea.title, cat_idea.id, size)
            @caterpillar_children << child
          end
          caterpillar = {  "name" => name, "id" => id,  "size" => size, :children => @caterpillar_children}
          @caterpillars << caterpillar
      end
        return caterpillar
    end

    def create_chrysali(name, id, size)
      chrysali =  @chrysalis.detect { |el| el["id" ] == id }
      if chrysali.nil?
         @chrysali_children = []
          # collect all caterpillars for this chrysali
          @chrys_caterpillars = Chrysali.find(id).caterpillars
          @chrys_caterpillars.each do |chrys_caterpillar|
            size = chrys_caterpillar.likes.size.to_i + 1
            child = create_caterpillar(chrys_caterpillar.title, chrys_caterpillar.id, size)
            @chrysali_children << child
          end
          chrysali = {  "name" => name, "id" => id,  "size" => size, :children => @chrysali_children}
          @chrysalis << chrysali
      end
        return chrysali
    end

    def create_butterfly(name, id, size)
      butterfly =  @butterflies.detect { |el| el["id" ] == id }
      if butterfly.nil?
         @butterfly_children = []
          # collect all caterpillars for this chrysali
          @butt_chrysalis = Butterfly.find(id).chrysalis
          @butt_chrysalis.each do |butt_chrysali|
            size = butt_chrysali.likes.size.to_i + 1
            child = create_chrysali(butt_chrysali.title, butt_chrysali.id, size)
            @butterfly_children << child
          end
          butterfly = {  "name" => name, "id" => id,  "size" => size, :children => @butterfly_children}
          @butterflies << butterfly
      end
        return butterfly
    end


    butterflies = Butterfly.where(:challenge => @challenge.id)
    @root_children =[]
    butterflies.each do |butterfly|
      size = butterfly.likes.size.to_i + 1
      child = create_butterfly(butterfly.title, butterfly.id, size)
      @root_children << child
    end


    @dendogram = {  "name" => "root",  "id" => 0 , "children" => @root_children}

  end

  def sankey()

    def create_node(name, size)
      node =  @nodes.detect { |el| el["name" ] == name }
      if node.nil?
        node = {  "name" => name, "size" => size}
        @nodes << node
        index = @nodes.length - 1
      else
        index = @nodes.index(node)
      end
        return index
    end

    @nodes = []
    @links = []

    @butterflies = Butterfly.where(:challenge => @challenge.id)
    @butterflies.each do |butterfly|
      size = butterfly.likes.size
      target_butterfly = create_node(butterfly.title, size)

      @chrysalis = butterfly.chrysalis
      @chrysalis.each do |chrysali|
        size = chrysali.likes.size
        target_chrysali = create_node(chrysali.title, size)
        @caterpillars = chrysali.caterpillars

        @caterpillars.each do |caterpillar|
          size = caterpillar.likes.size
          target_caterpillar = create_node(caterpillar.title, size)
          @ideas = caterpillar.ideas
          @ideas.each do |idea|
            size = idea.likes.size
            source_idea = create_node(idea.title, size)
            link = {"source" => source_idea, "target" => target_caterpillar, "value" =>1}
            @links << link
          end
          link = {"source" => target_caterpillar, "target" => target_chrysali, "value" =>1}
          @links << link
        end
        link = {"source" => target_chrysali, "target" => target_butterfly, "value" =>1}
        @links << link
      end
    end


    @sankey =  {"nodes" => @nodes, "links" => @links}

  end

end


