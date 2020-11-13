

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




    def dfs(target_value) #node.dfs(target_value)
        return self if value == target_value
       
        children.each do |child|
            search = child.dfs(target_value)
            return search unless search == nil
        end
        return nil if children.empty?
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty? 
            first = queue.shift
            return first if first.value == target_value
            queue += first.children
        end
    end

end

