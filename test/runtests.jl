using Lyta
using Test

println("Running tests for package Lyta...")

p = Lyta.point(1,2,3);
v = Lyta.vector(1,2,3);

# silly tests
@testset "constructors" begin
    @test p.t == Lyta.t_point;
    @test v.t == Lyta.t_vector;
    @test p != v;
end

@testset "arithmetic" begin
    v1 = Lyta.vector(-1, -2, -3);
    @test p + v1 == Lyta.point(0,0,0);      # point plus vector is a point
    @test v + v1 == Lyta.vector(0,0,0);     # vector plus vector is a vector
    @test p - v == Lyta.point(0,0,0);       
    @test v - v1 == Lyta.vector(2,4,6);
    @test -v + v == Lyta.vector(0,0,0);     # unary negation
    @test -2 * v1 == Lyta.vector(2, 4, 6);  # multiplication by a scalar
end
