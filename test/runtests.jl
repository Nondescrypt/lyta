using Lyta
using Test

println("Running tests for package Lyta...")

p = Lyta.point(1,2,3);
v = Lyta.vector(-1,-2,-3);

# silly tests
@test p.t == Lyta.t_point
@test v.t == Lyta.t_vector;

