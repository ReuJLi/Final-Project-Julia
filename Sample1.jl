#Simple Calculator in Julia
#Source: https://github.com/logankilpatrick/Julia-Projects-for-Beginners/blob/main/calculator.jl 

function calculator()
    println("----Welcome to the Calculator App written in Julia----")
    while true 
        #Print calculator app menu 
        println("====Menu====")
        println("1. Addition +")
        println("2. Subtraction -")
        println("3. Multiplication *")
        println("4. Division /")
        println("5. Exit")
       operation = parse(Float64, readline())
       #Convert string value input to a float

       #Depending on users choice, peform corresponding operation
       if operation == 1
        println("Enter first number: ")
        num1 = parse(Float64, readline())
        println("Enter second number: ")
        num2 = parse(Float64, readline())
        println("Output: $(num1 + num2)")
       elseif operation == 2
        println("Enter first number: ")
        num1 = parse(Float64, readline())
        println("Enter second number: ")
        num2 = parse(Float64, readline())
        println("Output: $(num1 - num2)")
       elseif operation == 3
        println("Enter first number: ")
        num1 = parse(Float64, readline())
        println("Enter second number: ")
        num2 = parse(Float64, readline())
        println("Output: $(num1 * num2)")
       elseif operation == 4
        println("Enter first number: ")
        num1 = parse(Float64, readline())
        println("Enter second number: ")
        num2 = parse(Float64, readline())
        println("Output: $(num1 / num2)")
       elseif operation == 5 
        println("Exiting the calculator app.") 
        break #Stop he while loop if the user decides to exit 
       else
            #If the user enters another number, then ask to try again 
        println("Invalid input. Please try again.")
       end
    end
end

calculator() #Call the calculator function to run the app 
    
