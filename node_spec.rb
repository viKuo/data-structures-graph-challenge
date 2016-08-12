require_relative 'node'

describe Node do
	let!(:node) { Node.new("Matt") }
	before(:each) do
		mike = Node.new("Mike")
		duke = Node.new("Duke")
		maurice = Node.new("Maurice")
		alyssa = Node.new("Alyssa")
		casey = Node.new("Casey")
		jones = Node.new("Jones")
		node.add_edge(mike)
		node.add_edge(maurice)
		mike.add_edge(duke)
		mike.add_edge(maurice)
		mike.add_edge(casey)
		duke.add_edge(alyssa)
		jones.add_edge(casey)
	end

	it "can find Alyssa downstream from Matt" do
		expect(node.exists?{ |node| node.value == "Alyssa" }).to eq true
	end

	it "cannot find Jones downstream from Matt" do
		expect(node.exists?{ |node| node.value == "Jones" }).to eq false
	end
end
