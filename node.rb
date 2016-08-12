class Node
	attr_accessor :value
	def initialize(value)
		@value = value
		@edges = []
	end

	def add_edge(other_node)
		@edges << other_node
	end

	def nodes
		@edges
	end

	def exists?
		nodes_to_search = @edges
		if yield(self)
			return true
		end

		until nodes_to_search.empty?
			node = nodes_to_search.pop
			if yield(node)
				return true
			end
			nodes_to_search += node.nodes
		end
		false
	end
end
