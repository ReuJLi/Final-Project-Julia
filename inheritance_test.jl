# Inheritance and Method Dispatch Test in Julia
# Translated from Lecture 32, Examples 3 and 5

# ====Example 3: Variable Inheritance Test====
println("====Example 3: Variable Inheritance Test====")

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
setx2(o::C2, v) = setx1(o.base, v)  # x is inherited from C1
sety2(o::C2, v) = (o.y = v)          # C2's own y
getx2(o::C2) = getx1(o.base)         # x inherited from C1
gety2(o::C2) = o.y                   # C2's own y
sety1(o::C2, v) = sety1(o.base, v)   # sets C1's y
gety1(o::C2) = gety1(o.base)         # gets C1's y

o2 = C2()
setx2(o2, 101)
sety1(o2, 102)  # sets C1's y
sety2(o2, 999)  # sets C2's own y

println("getx1: ", getx2(o2))   # 101 - shared x from C1
println("gety1: ", gety1(o2))   # 102 - C1's y
println("getx2: ", getx2(o2))   # 101 - same x
println("gety2: ", gety2(o2))   # 999 - C2's own y

# Conclusion: Julia uses STATIC variable inheritance
# Each struct has its own fields; C2 has its own y separate from C1's y


# ====Example 5: Method Dispatch Test====
println("\n====Example 5: Method Dispatch Test====")

abstract type Base end

mutable struct AC1 <: Base end
mutable struct AC2 <: Base end
mutable struct AC3 <: Base end

# C1 methods
m2(o::AC1) = 13
m1(o::AC1) = m2(o)  # calls m2 on self

# C2 methods - overrides m1 and m2
m1(o::AC2) = 22
m2(o::AC2) = 23
m3(o::AC2) = m1(AC1())  # super m1() - calls C1's m1

# C3 methods - overrides m1 and m2
m1(o::AC3) = 32
m2(o::AC3) = 33
m3(o::AC3) = m3(AC2())  # calls C2's m3

o3 = AC3()
result = m3(o3)
println("Result of send o3 m3(): ", result)

# Conclusion: Julia uses DYNAMIC method dispatch via multiple dispatch
# The correct method is selected at runtime based on the actual type