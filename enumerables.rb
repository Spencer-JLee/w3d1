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
        self.my_each() {|ele| arr << ele if prc.call(ele)}
        return arr
    end
end