class Graph
  attr_reader :nodes, :connections

  DEFAULT_NODES_AMOUNT = 15
  MAX_CONNECTIONS_PER_NODE = 4
  INITIAL_CONNECTIONS_NUMBER = 0

  def initialize(num_of_nodes = DEFAULT_NODES_AMOUNT)
    @num_of_nodes = num_of_nodes
    generate_nodes
    generate_connections
  end

  private

  def generate_nodes
    @nodes = []
    (1..@num_of_nodes).each do |ordinal|
      @nodes << [ordinal, set_coordinates, INITIAL_CONNECTIONS_NUMBER]
    end
  end

  # assume a node's coordinates can be within -100..100 range
  def set_coordinates
    [rand(-100..100), rand(-100..100)]
  end

  def generate_connections
    @connections = []
    @nodes.each do |node|
      next if node[2] == MAX_CONNECTIONS_PER_NODE
      connections_to_reach = rand((node[2] == 0 ? 1 : node[2])..MAX_CONNECTIONS_PER_NODE)
      next if connections_to_reach == node[2]

      available_nodes = @nodes - [node]
      available_nodes_length = available_nodes.length
      available_nodes_length.times do
        destination_node = available_nodes.sample
        available_nodes.delete(destination_node)
        if possible_to_connect?(node, destination_node)
          @connections << [node[0], destination_node[0]]
          node[2] += 1
          @nodes.select { |n| n[0] == destination_node[0] }.first[2] += 1
          break if node[2] == connections_to_reach
        else
          puts "Not #{node[0]} --> #{destination_node[0]}"
          next
        end
      end
    end
    @nodes.each do |node|
      puts "Node #{node[0]}. Num of cons: #{node[2]}. Connections: #{@connections.select { |c| c[0] == node[0] || c[1] == node[0]}}"
    end
  end

  def node_connections node
    node_ordinal = node[0]
    all_directions = @connections.find_all { |c| c.include?(node_ordinal) }
    all_directions.map { |c| c[0] == node_ordinal ? c : c.reverse }.uniq
  end

  def possible_to_connect? node1, node2
    node2_connections = node_connections(node2)
    connection = [node1[0], node2[0]]
    node2_connections.length < MAX_CONNECTIONS_PER_NODE &&
    !([connection, connection.reverse].any? { |c| node2_connections.include?(c) })
  end


end

