require 'graph'

describe Graph do

  context 'when just initialized' do
    context 'without number of nodes passed' do
      it 'has 15 nodes' do
        expect(Graph.new.nodes.length).to eq(15)
      end
    end

    context 'with passed number of nodes' do
      it 'has exactly that number of nodes' do
        expect(Graph.new(5).nodes.length).to eq(5)
      end
    end
  end

end

