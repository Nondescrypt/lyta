module Lyta

import Base.+;
import Base.-;
import Base.*;

    greet() = print("Lyta en la casa!")


    # Points and Vectors
    @enum TripleType t_vector=0 t_point=1

    struct Vector
        x::Float64
        y::Float64
        z::Float64
        t::TripleType
    end;

    struct Point
        x::Float64
        y::Float64
        z::Float64
        t::TripleType
    end;

    function vector(x::Real, y::Real, z::Real)
        Vector(x, y, z, t_vector);
    end

    function point(x::Real, y::Real, z::Real)
        Point(x, y, z, t_point);
    end

    # arithmetic operations
    (+)(a::Vector, b::Vector) = vector(a.x + b.x, a.y + b.y, a.z + b.z);
    (+)(a::Point, b::Vector) = point(a.x + b.x, a.y + b.y, a.z + b.z);

    (-)(a::Vector, b::Vector) = vector(a.x - b.x, a.y - b.y, a.z - b.z);
    (-)(a::Point, b::Vector) = point(a.x - b.x, a.y - b.y, a.z - b.z);
    (-)(a::Point, b::Point) = vector(a.x - b.x, a.y - b.y, a.z - b.z);
    (-)(a::Vector) = vector(-a.x, -a.y, -a.z);                              # unary negation

    (*)(a::Number, b::Vector) = vector(a * b.x, a * b.y, a * b.z );
    (*)(b::Vector, a::Number) = vector(a * b.x, a * b.y, a * b.z );         # commutes

    # measure operations
    function magnitude(a::Vector)
        sqrt(a.x^2 + a.y^2 + a.z^2)
    end

    function normalize(a::Vector)
        1.0 / magnitude(a) * a;
    end

    # vector operations
    function dot(a::Vector, b::Vector)
        a.x * b.x + a.y * b.y + a.z * b.z;
    end

    function cross(a::Vector, b::Vector)
        vector( 
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
        );
    end

    # Colors and Canvas
    struct Color
        red::Float64
        green::Float64
        blue::Float64
        α::Float64
    end

    function color(r::Real, g::Real, b::Real, α::Real)
        Lyta.Color(r,g,b,α);
    end

    function hadamard_product(c1::Color, c2::Color)
        Lyta.color(c1.red*c2.red, c1.green*c2.green, c1.blue*c2.blue, c1.α*c2.α);
    end

    struct Canvas
        pixel::Matrix{Lyta.Color}
    end

    function canvas(width::Int, height::Int, init::Lyta.Color)
        c = Lyta.Canvas(Matrix{Lyta.Color}(undef, width, height));
        for i in 1:width
            for j in 1:height
                c.pixel[i,j] = init;
            end
        end
        return c;
    end

end # module Lyta
