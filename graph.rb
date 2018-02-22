class Graph
  attr_reader :nodes

  def initialize(num_of_nodes = 15)
    generate_nodes(num_of_nodes)
  end

  private

  def generate_nodes(num_of_nodes)
    @nodes = []
    (1..num_of_nodes).each do |ordinal|
      @nodes << [ordinal, set_coordinates]
    end
  end

  #assume a node's coordinates can be within -100..100 range
  def set_coordinates
    [rand(-100..100), rand(-100..100)]
  end
end

