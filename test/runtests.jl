using Lyta
using Test

println("Running tests for package Lyta...");

p = Lyta.point(1,2,3);
v = Lyta.vector(1,2,3);
d = Lyta.vector(4,5,6);
r = Lyta.ray(p,d,Lyta.Color(1,1,1,1));

# silly tests
@testset "constructors" begin
    @test p.w == 1.0;
    @test v.w == 0.0;
    @test p != v;
end

@testset "arithmetic" begin
    v1 = Lyta.vector(-1, -2, -3);
    @test p + v1 == Lyta.point(0,0,0);      # point plus vector is a point
    @test v + v1 == Lyta.vector(0,0,0);     # vector plus vector is a vector
    @test p - v == Lyta.point(0,0,0);       
    @test v - v1 == Lyta.vector(2,4,6);
    @test p - p ==Lyta.vector(0,0,0);       # point minus point is a vector
    @test -v + v == Lyta.vector(0,0,0);     # unary negation
    @test -2 * v1 == Lyta.vector(2, 4, 6);  # multiplication by a scalar
end

@testset "measures" begin
    v = Lyta.vector(-1, -2, -3);
    @test Lyta.magnitude(v) == sqrt(14);
    @test Lyta.magnitude(Lyta.vector(0,0,0)) == 0;
    @test Lyta.magnitude(Lyta.normalize(v)) == 1;
    @test Lyta.magnitude(v) * Lyta.normalize(v) == v;
end

@testset "dots and crosses" begin
    vx = Lyta.vector(1,0,0);
    vy = Lyta.vector(0,1,0);
    vz = Lyta.vector(0,0,1);
    v = Lyta.vector(-1, -2, -3);
    @test Lyta.dot(v,v) == Lyta.magnitude(v)^2;
    @test Lyta.dot(v, Lyta.vector(0,0,0)) == 0;
    @test Lyta.dot(v, vx) == v.x;
    @test Lyta.dot(v, vy) == v.y;
    @test Lyta.dot(v, vz) == v.z;
    @test Lyta.cross(vx,vx) == Lyta.vector(0,0,0);
    @test Lyta.cross(vy,vy) == Lyta.vector(0,0,0);
    @test Lyta.cross(vz,vz) == Lyta.vector(0,0,0);
    @test Lyta.cross(vx,vy) == vz;
    @test Lyta.cross(vy,vz) == vx;
    @test Lyta.cross(vz,vx) == vy;
    @test Lyta.cross(vz,vy) + vx == Lyta.vector(0,0,0); # playing fast and loose with floating point is going to bite us eventually
end

@testset "rays" begin
    @test r.origin == p;
    @test r.direction == d;
    @test r.color == Lyta.Color(1,1,1,1);
    p2 = Lyta.point(2,3,4); d2 = Lyta.vector(1,0,0);
    r2 = Lyta.ray(p2, d2, Lyta.Color(1,1,1,1));
    @test Lyta.position(r2, 0) == p2;
    @test Lyta.position(r2, 1) == p2 + d2;
    @test Lyta.position(r2, 2.5) == p2 + 2.5*d2;
end

# Color tests
@testset "colors" begin
    purple = Lyta.color(1, 0, 1, 1);
    yellow = Lyta.color(1, 1, 0, 0.5);
    @test Lyta.hadamard_product(purple, yellow) == Lyta.color(1,0,0, 0.5);
end

# Canvas tests
@testset "canvas" begin
    w = 640; h = 480;
    c = Lyta.canvas(w, h, Lyta.Color(0,0,0,1));
    for i in 1:w
        for j in 1:480
            c.pixel[i,j]=Lyta.Color(i/640.0, j/480.0, 1, 1);
        end
    end
    Lyta.canvas_to_ppm(c, 255, "gradients_cartesian.ppm");
    
    for i in 1:w
        for j in 1:480
            x = (i-w/2.0)/w; y = (j-h/2)/h;
            θ = atan(y,x)
            c.pixel[i,j]=Lyta.Color(cos(θ)^2, 2*(x^2 + y^2), sin(θ)^2, 1);
        end
    end
    Lyta.canvas_to_ppm(c, 255, "gradients_polar.ppm");
    
end
