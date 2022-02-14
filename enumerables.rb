class Array
    def my_each(&prc)
        # (0...self.length).each {|i| prc.call(self[i])}
        # self

        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each() {|ele| arr << ele if prc.call(ele) }
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each() {|ele| arr << ele if !prc.call(ele) }
        arr
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }
        true
    end

    def my_flatten
        return [self] if self.is_a? Array
        
    end

end