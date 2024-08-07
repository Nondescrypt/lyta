# Lyta types

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

struct Color
    red::Float64
    green::Float64
    blue::Float64
    α::Float64
end

struct RGBColor
    red::Int
    green::Int
    blue::Int
end

struct Ray
    origin::Point
    direction::Vector
    color::Lyta.Color
end;

struct Canvas
    pixel::Matrix{Lyta.Color}
end

struct Intersection
    objectId::Int
    range:: Real
end

struct Sphere
    objectId::Int
    origin::Point
    radius::Real
end

