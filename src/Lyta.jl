module Lyta

import Base.+;
import Base.-;
import Base.*;

    greet() = print("Lyta en la casa!")

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

    function magnitude(a::Vector)
        sqrt(a.x^2 + a.y^2 + a.z^2)
    end

    function normalize(a::Vector)
        1.0 / magnitude(a) * a;
    end

    function dot(a::Vector, b::Vector)
        a.x * b.x + a.y * b.y + a.z * b.z;
    end

end # module Lyta
