class Node
attr_accessor :value, :left_link, :right_link

	def initialize(value = nil,left_link = nil, right_link = nil)
		@value = value
		@left_link = left_link
		@right_link = right_link
	end
end
	def build_tree(array)
		size = array.length
		mid_point = size/2
		root_node = Node.new(array[mid_point])
		
		for i in 0..(mid_point-1)
			value = array[i]
			leaf = Node.new(value)
			check = root_node

			loop do
				if leaf.value <= check.value && check.left_link == nil
					check.left_link = leaf
					break
				elsif leaf.value <= check.value && check.left_link != nil
					check = check.left_link
				elsif leaf.value > check.value && check.right_link == nil
					check.right_link = leaf
					break
				elsif leaf.value > check.value && check.right_link != nil
					check = check.right_link
				
				end
			end	
		end	
		for i in (mid_point+1)..(size-1)
			value = array[i]
			leaf = Node.new(value)
			check = root_node

			loop do
				if leaf.value <= check.value && check.left_link == nil
					check.left_link = leaf
					break
				elsif leaf.value <= check.value && check.left_link != nil
					check = check.left_link
				elsif leaf.value > check.value && check.right_link == nil
					check.right_link = leaf
					break
				elsif leaf.value > check.value && check.right_link != nil
					check = check.right_link
				
				end
			end	
		end
		return root_node
	end
	
	def breadth_first_search(value, tree)
		queue = []
			if tree.value == value
				return tree
			else
				queue.push(tree.left_link)
				queue.push(tree.right_link)
				while(queue != [])
					if queue[0].value == value
						return queue[0]
						break
					else
						if queue[0].left_link != nil
							queue.push(queue[0].left_link)
						end
						if queue[0].right_link != nil	
							queue.push(queue[0].right_link)
						end
						queue.shift
					end
				end
			end			
	end
	
	def depth_first_search(value, tree)
		stack = []
		check = tree
		check2 = tree
		while (stack != [])
			if check.left_link != nil
				stack.push(check.left_link)
				check2 = check
				check = check.left_link
			elsif check.left_link == nil && check.right_link != nil
					stack.push(check.right_link)
					
				
	
	
	
	
	
array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = build_tree(array)
node =  breadth_first_search(324, tree)
print node




