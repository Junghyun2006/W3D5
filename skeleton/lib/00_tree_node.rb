class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        @parent = parent 
        if !parent.children.include?(self) 
            parent.children << self
        end
        
    end

end

