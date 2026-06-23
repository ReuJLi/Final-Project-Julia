# Simple Calculator + Stats Calculator in Julia
# Phase 1 Source: https://github.com/logankilpatrick/Julia-Projects-for-Beginners/blob/main/calculator.jl
# Phase 2: Extended with statistics features using AI assistance

function calculator()
    println("----Welcome to the Calculator & Stats App written in Julia----")
    while true
        # Print calculator app menu
        println("====Menu====")
        println("1. Addition +")
        println("2. Subtraction -")
        println("3. Multiplication *")
        println("4. Division /")
        println("5. Statistics Calculator")
        println("6. Exit")
        operation = parse(Int64, readline())

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
            if num2 == 0
                println("Error: Cannot divide by zero!")
            else
                println("Output: $(num1 / num2)")
            end
        elseif operation == 5
            println("Enter how many numbers you want to analyze: ")
            n = parse(Int64, readline())
            numbers = Float64[]
            for i in 1:n
                println("Enter number $i: ")
                push!(numbers, parse(Float64, readline()))
            end

            # Calculate statistics
            mean_val = sum(numbers) / length(numbers)
            sorted = sort(numbers)
            n_len = length(sorted)
            if n_len % 2 == 0
                median_val = (sorted[n_len÷2] + sorted[n_len÷2+1]) / 2
            else
                median_val = sorted[n_len÷2+1]
            end
            std_val = sqrt(sum((x - mean_val)^2 for x in numbers) / length(numbers))

            println("\n====Statistics Results====")
            println("Numbers: $numbers")
            println("Mean: $mean_val")
            println("Median: $median_val")
            println("Std Deviation: $std_val")
            println("Min: $(minimum(numbers))")
            println("Max: $(maximum(numbers))")
            println("Range: $(maximum(numbers) - minimum(numbers))")
        elseif operation == 6
            println("Exiting the calculator app.")
            break
        else
            println("Invalid input. Please try again.")
        end
    end
end

calculator()