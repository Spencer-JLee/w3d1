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
        self.my_each do |ele|
            if ele.is_a? Array
                arr.push(*ele.my_flatten)
            else
                arr.push(ele)
            end
        end
        arr
    end

    def my_zip(*arrs)
        arr = Array.new(self.length) { Array.new(arrs.length + 1, nil)}

        self.my_each { |ele| arr[self.index(ele)][0] = ele}
        (1...arrs.length + 1).each do |i|
            arrs[i].my_each {|ele| arr[arrs[i].index(ele)][i] = ele}
        end

        arr
    end

    def my_rotate(n = 1)
        arr = Array.new(self.length)
        (0...self.length).each { |i| arr[i] = self[(i + n) % self.length] }
        arr
    end

    def my_join(separator = "")
        str = self[0]
        (1...self.length).each { |i| str += separtor + self[i] }
        str
    end

    def my_reverse
        arr = []
        (0...self.length).each { |i| arr << self[-1 - i] }
        arr
    end

end

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]