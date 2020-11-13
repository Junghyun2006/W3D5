

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

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        # raise "node is not a child" if !self.children.include?(child_node)
        # child_node.parent = nil
        self.children.include?(child_node) ? (child_node.parent = nil) : (raise "node is not a child") 
    end

    def dfs(target_value)
        return nil if children.empty?
        return self if value == target_value

        children.each_with_index do [child,i]
            # return dfs(children[i]) if children[i]
            child.dfs(target_value)
        end
    end

end

