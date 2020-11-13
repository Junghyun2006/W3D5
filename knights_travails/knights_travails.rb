require_relative './skeleton/lib/00_tree_node.rb'

class KnightPathFinder
    attr_reader :root_node
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        build_move_tree
        @considered_positions = [start_pos]
    end

    def build_move_tree
    end

    self.valid_moves(pos)
        valid_moves = [[pos+2,pos+1], [pos+2, pos-1], [pos-2, pos+1], [pos-2, pos-1],       
        [pos+1,pos+2], [pos-1, pos+2], [pos+1, pos-2], [pos-1 pos-2]]    
    end
        


end