# Simple Calculator + Stats Calculator in Julia
# Phase 1 Source: https://github.com/logankilpatrick/Julia-Projects-for-Beginners/blob/main/calculator.jl
# Phase 2: Extended with statistics features and formatted output using AI assistance

# Color codes
const RESET = "\033[0m"
const BOLD = "\033[1m"
const CYAN = "\033[36m"
const GREEN = "\033[32m"
const YELLOW = "\033[33m"
const RED = "\033[31m"
const MAGENTA = "\033[35m"

function print_header()
    println(CYAN * BOLD * "╔══════════════════════════════════════════╗" * RESET)
    println(CYAN * BOLD * "║   Julia Calculator & Stats App  📊        ║" * RESET)
    println(CYAN * BOLD * "╚══════════════════════════════════════════╝" * RESET)
end

function print_menu()
    println(YELLOW * BOLD * "\n====== MENU ======" * RESET)
    println(GREEN * "  1. Addition       +" * RESET)
    println(GREEN * "  2. Subtraction    -" * RESET)
    println(GREEN * "  3. Multiplication *" * RESET)
    println(GREEN * "  4. Division       /" * RESET)
    println(MAGENTA * "  5. Statistics Calculator 📈" * RESET)
    println(RED * "  6. Exit" * RESET)
    println(YELLOW * BOLD * "==================" * RESET)
    print(BOLD * "Enter choice: " * RESET)
end

function get_two_numbers()
    print(BOLD * "Enter first number: " * RESET)
    num1 = parse(Float64, readline())
    print(BOLD * "Enter second number: " * RESET)
    num2 = parse(Float64, readline())
    return num1, num2
end

function print_result(result)
    println(GREEN * BOLD * "\n  ✓ Output: $result" * RESET)
end

function calculator()
    print_header()
    while true
        print_menu()
        operation = parse(Int64, readline())

        if operation == 1
            num1, num2 = get_two_numbers()
            print_result(num1 + num2)
        elseif operation == 2
            num1, num2 = get_two_numbers()
            print_result(num1 - num2)
        elseif operation == 3
            num1, num2 = get_two_numbers()
            print_result(num1 * num2)
        elseif operation == 4
            num1, num2 = get_two_numbers()
            if num2 == 0
                println(RED * "\n  ✗ Error: Cannot divide by zero!" * RESET)
            else
                print_result(num1 / num2)
            end
        elseif operation == 5
            print(BOLD * "\nHow many numbers to analyze? " * RESET)
            n = parse(Int64, readline())
            numbers = Float64[]
            for i in 1:n
                print(BOLD * "  Enter number $i: " * RESET)
                push!(numbers, parse(Float64, readline()))
            end

            mean_val = sum(numbers) / length(numbers)
            sorted = sort(numbers)
            n_len = length(sorted)
            if n_len % 2 == 0
                median_val = (sorted[n_len÷2] + sorted[n_len÷2+1]) / 2
            else
                median_val = sorted[n_len÷2+1]
            end
            std_val = sqrt(sum((x - mean_val)^2 for x in numbers) / length(numbers))

            println(MAGENTA * BOLD * "\n╔══════════════════════════════════════════╗" * RESET)
            println(MAGENTA * BOLD * "║         Statistics Results 📊             ║" * RESET)
            println(MAGENTA * BOLD * "╠══════════════════════════════════════════╣" * RESET)
            println(MAGENTA * "║  Numbers:    $numbers" * RESET)
            println(MAGENTA * "║  Mean:       $mean_val" * RESET)
            println(MAGENTA * "║  Median:     $median_val" * RESET)
            println(MAGENTA * "║  Std Dev:    $std_val" * RESET)
            println(MAGENTA * "║  Min:        $(minimum(numbers))" * RESET)
            println(MAGENTA * "║  Max:        $(maximum(numbers))" * RESET)
            println(MAGENTA * "║  Range:      $(maximum(numbers) - minimum(numbers))" * RESET)
            println(MAGENTA * BOLD * "╚══════════════════════════════════════════╝" * RESET)
        elseif operation == 6
            println(RED * BOLD * "\n  Exiting the calculator app. Goodbye! 👋" * RESET)
            break
        else
            println(RED * "\n  ✗ Invalid input. Please try again." * RESET)
        end
    end
end

calculator()