module MyEnumerable
  refine Enumerable do
    def my_each
      for i in self 
        yield(i) if block_given?
      end
    end

    def my_map
      ms = []
      for i in self 
        ms << yield(i) if block_given?
      end
      ms
    end
  
    def my_select 
      ms = []
      for i in self 
        if block_given? && yield(i) == true
          ms << i 
        end
      end
      ms
    end
  end
end

using MyEnumerable

ms = [1,2,3,4,5,6,7]

puts ms.my_each { |item| item }
puts ms.my_map { |item| item+10 }
puts ms.my_select { |item| item > 4 }
