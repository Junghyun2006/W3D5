

class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        @value.inspect
    end

    def parent=(parent)
        self.parent.children.delete(self) if self.parent != nil 
        @parent = parent
      
        if  parent && !parent.children.include?(self) 
            parent.children << self
        end
    end

end

