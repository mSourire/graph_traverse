require 'graph'

describe Graph do

  context 'when just initialized' do

    let(:default_number_of_nodes) { Graph::DEFAULT_NODES_AMOUNT }
    let(:default_graph) { Graph.new }
    let(:user_graph) { Graph.new(5) }

    context 'without number of nodes passed' do
      it 'has 15 nodes' do
        expect(default_graph.nodes.length).to eq(default_number_of_nodes)
      end

      it 'has connections between nodes' do
        expect(default_graph.nodes.collect { |n| n[2] }.include?(0)).to eq(false)
      end
    end

    context 'with passed number of nodes' do
      it 'has exactly that number of nodes' do
        expect(user_graph.nodes.length).to eq(5)
      end
    end
  end

end

