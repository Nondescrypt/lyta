# Colors
struct Color
    red::Float64
    green::Float64
    blue::Float64
    α::Float64
end
function color(r::Real, g::Real, b::Real, α::Real)
    Lyta.Color(r,g,b,α);
end
struct RGBColor
    red::Int
    green::Int
    blue::Int
end
function rgbcolor(r::Int, g::Int, b::Int)
    Lyta.RGBColor(r,g,b);
end
function rgbcolor(c::Color, saturated::Int)
    r = min(saturated, max(0, floor(Int, c.red * saturated)));
    g = min(saturated, max(0, floor(Int, c.green * saturated)));
    b = min(saturated, max(0, floor(Int, c.blue * saturated)));
    Lyta.RGBColor(r,g,b);
end
 
function hadamard_product(c1::Color, c2::Color)
    Lyta.color(c1.red*c2.red, c1.green*c2.green, c1.blue*c2.blue, c1.α*c2.α);
end