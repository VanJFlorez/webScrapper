1. How do you calculate the power of a number?   
   With power operator '**' e.g.
    ~~~ruby
    irb(main):001:0> 3**3
    => 27
    ~~~

2. Write a ruby method that returns the even numbers from an array of float numbers. (Do not use the even ruby method)
    ~~~ruby
    def filterEven(nums)
        evens = []
        nums.each do |a|
            if (a - a.to_i == 0 && a % 2 == 0)
                evens.push(a)
            end
        end
        return evens
    end 
    ~~~

In your own words explain:   

3. What are collection and member routes?   
    ~~~text
    Both are paths to access REST resources.
    Collection route has this form: 
        /photos/search
    Member route has this form:
        /photos/1/preview

    The former access the full collection and the other only one member of that collection.
    ~~~
4. What is polymorphism?
    ~~~
    The ability of one type to behave as another type given a common interface 
    among both types.
    ~~~

5. What is the purpose of object private methods?
    ~~~
    To achieve one of the Object Oriented Programming core concepts: Encapsulation.
    Each object (i.e. type) must be an isolated entity that will not expose its 
    inner mechanisms and implementation details.
    ~~~