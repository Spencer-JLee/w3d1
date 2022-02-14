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
        arr = []
        return [self] if !self.is_a? Array
        self.my_each {|ele| arr.push(*self.my_flatten)}
        arr
    end

    def my_zip(*arrs)
        arr = Array.new(self.length) { Array.new(arrs.length + 1, nil)}

        self.my_each {|ele| arr[self.index(ele)][0] = ele}
        (1...arrs.length + 1).each do |i|
            arrs[i].my_each {|ele| arr[arrs[i].index(ele)][i] = ele}
        end

        arr
    end

    
end