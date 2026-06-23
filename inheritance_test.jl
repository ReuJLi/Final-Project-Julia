# Inheritance and Method Dispatch Test in Julia
# Translated from Lecture 32, Examples 3 and 5
# Extended with formatted output using AI assistance

# Color codes
const RESET = "\033[0m"
const BOLD = "\033[1m"
const CYAN = "\033[36m"
const GREEN = "\033[32m"
const YELLOW = "\033[33m"
const RED = "\033[31m"
const MAGENTA = "\033[35m"

function print_header(title)
    println(CYAN * BOLD * "\n╔══════════════════════════════════════════╗" * RESET)
    println(CYAN * BOLD * "║  $title" * RESET)
    println(CYAN * BOLD * "╚══════════════════════════════════════════╝" * RESET)
end

function print_result(label, value, conclusion="")
    println(GREEN * "  ✓ $label: $value" * RESET)
    if conclusion != ""
        println(YELLOW * "    → $conclusion" * RESET)
    end
end

function print_conclusion(text)
    println(MAGENTA * BOLD * "\n╔══════════════════════════════════════════╗" * RESET)
    println(MAGENTA * BOLD * "║  Conclusion                               ║" * RESET)
    println(MAGENTA * BOLD * "╠══════════════════════════════════════════╣" * RESET)
    println(MAGENTA * "║  $text" * RESET)
    println(MAGENTA * BOLD * "╚══════════════════════════════════════════╝" * RESET)
end

# ====Example 3: Variable Inheritance Test====
print_header("Example 3: Variable Inheritance Test      ")

mutable struct C1
    x::Any
    y::Any
    C1() = new(nothing, nothing)
end

mutable struct C2
    base::C1
    y::Any  # C2 has its own y field
    C2() = new(C1(), nothing)
end

# Methods for C1
setx1(o::C1, v) = (o.x = v)
sety1(o::C1, v) = (o.y = v)
getx1(o::C1) = o.x
gety1(o::C1) = o.y

# Methods for C2
setx2(o::C2, v) = setx1(o.base, v)
sety2(o::C2, v) = (o.y = v)
getx2(o::C2) = getx1(o.base)
gety2(o::C2) = o.y
sety1(o::C2, v) = sety1(o.base, v)
gety1(o::C2) = gety1(o.base)

o2 = C2()
setx2(o2, 101)
sety1(o2, 102)
sety2(o2, 999)

println(YELLOW * BOLD * "\n  Results:" * RESET)
print_result("getx1 (shared x from C1)", getx2(o2), "x is shared between C1 and C2")
print_result("gety1 (C1's y)", gety1(o2), "C1's y = 102, set independently")
print_result("getx2 (same x)", getx2(o2), "confirms x is inherited")
print_result("gety2 (C2's own y)", gety2(o2), "C2's y = 999, completely separate from C1's y")

print_conclusion("STATIC variable inheritance — each struct  ")
println(MAGENTA * "║  has its own independent fields.          " * RESET)
println(MAGENTA * "║  C2's y and C1's y are separate.          " * RESET)
println(MAGENTA * BOLD * "╚══════════════════════════════════════════╝" * RESET)

# ====Example 5: Method Dispatch Test====
print_header("Example 5: Method Dispatch Test           ")

abstract type Base end

mutable struct AC1 <: Base end
mutable struct AC2 <: Base end
mutable struct AC3 <: Base end

# C1 methods
m2(o::AC1) = 13
m1(o::AC1) = m2(o)

# C2 methods
m1(o::AC2) = 22
m2(o::AC2) = 23
m3(o::AC2) = m1(AC1())

# C3 methods
m1(o::AC3) = 32
m2(o::AC3) = 33
m3(o::AC3) = m3(AC2())

o3 = AC3()
result = m3(o3)

println(YELLOW * BOLD * "\n  Results:" * RESET)
print_result("send o3 m3()", result, "dispatched through AC3 → AC2 → AC1")

print_conclusion("DYNAMIC method dispatch — Julia uses       ")
println(MAGENTA * "║  multiple dispatch. The correct method    " * RESET)
println(MAGENTA * "║  is selected at runtime based on the      " * RESET)
println(MAGENTA * "║  actual type of the object.               " * RESET)
println(MAGENTA * BOLD * "╚══════════════════════════════════════════╝" * RESET)