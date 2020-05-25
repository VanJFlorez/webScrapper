def filterEven(nums)
    evens = []
    nums.each do |a|
        if (a - a.to_i == 0 && a % 2 == 0)
            evens.push(a)
        end
    end
    return evens
end

nums = [3.3, 3.8, 3, 2.9, 7.88, 4, 9.31, 8, 12.994, 2.91]
puts filterEven(nums)