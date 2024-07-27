# Points and Vectors and Rays
    
# These will get extended
import Base.+;
import Base.-;
import Base.*;

struct Vector
    x::Float64
    y::Float64
    z::Float64
    w::Float64
end;

struct Point
    x::Float64
    y::Float64
    z::Float64
    w::Float64
end;

struct Ray
    origin::Point
    direction::Vector
    color::Lyta.Color
end;

function vector(x::Real, y::Real, z::Real)
    Vector(x, y, z, 0.0);
end

function point(x::Real, y::Real, z::Real)
    Point(x, y, z, 1.0);
end

function ray(origin::Point, direction::Vector, color::Lyta.Color)
    Ray(origin, direction, color);
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

# ray operations
function position(r::Ray, t::Real)
    r.origin + t * r.direction;
end