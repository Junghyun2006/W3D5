require_relative '../skeleton/lib/00_tree_node.rb'
require 'byebug'

class KnightPathFinder
    attr_reader :root_node
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree
    end
        
    def self.valid_moves(pos)       # pos = [0, 1]
        row, col = pos
        @possible_moves = [
            [row+2, col+1],
            [row+2, col-1],
            [row+1, col+2],
            [row+1, col-2],
            [row-2, col+1],
            [row-2, col-1],
            [row-1, col+2],
            [row-1, col-2]
        ]

        @possible_moves.reject { |moves| moves[0] < 0 && moves[0] > 7 || moves[1] < 0 && moves[1] > 7}
    end

    def new_move_positions(pos)
        debugger
        # return an array of new_positions that are not in @considered_positions
        new_positions = KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }

        # adding all new positions to @considered positions
        new_positions.each { |move| @considered_positions << move }
        new_positions
    end

    def build_move_tree
        # create node instances for each move in new_move_positions
        # move_tree = array of all node instances that are 1 move away
        
        queue = [@root_node]

        # iterating through the queue until it is empty
        until queue.empty?
            pos = queue.shift
            # create a move tree for each child
            new_move_positions(pos.value).each do |move| 
                new_node = PolyTreeNode.new(move)
                pos.add_child(new_node)
                queue << new_node
            end
        end
    end

    # using bfs to search for end_pos
    def find_path(end_pos) #end_pode is an array
        end_node = bfs(end_pos)                         # return the node instance with the vaue = end_pos
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)                       # end_node.vale = [7, 6]
        trace_arr = [end_node.value]                    # queue = [[7, 6]] 
        until trace_arr.first == @root_node.value       
            current_pos = trace_arr.first               # current_pos = [7, 6]      
            trace_arr.unshift(current_pos.parent.value)
        end
        trace_arr
    end
end


kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]