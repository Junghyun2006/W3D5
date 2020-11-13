class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=
        node2 << node1 @childen 
        node2.parent = node1
        node3.parent = node1
    end

end