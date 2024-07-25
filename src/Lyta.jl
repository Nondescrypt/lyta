module Lyta

import Base.+;
import Base.-;
import Base.*;

    greet() = print("Lyta en la casa!")

    PPM_COLUMNS = 70;   # we didn't write the rules

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

    struct Canvas
        pixel::Matrix{Lyta.Color}
    end

    function canvas(width::Int, height::Int, init::Lyta.Color)
        c = Lyta.Canvas(Matrix{Lyta.Color}(undef, width, height));
        for i in 1:height
            for j in 1:width
                c.pixel[j,i] = init;
            end
        end
        return c;
    end

    # overkill. It's easier and clearer to use the accessor directly.
    function setpixel(canvas::Canvas, i::Int, j::Int, color::Color)
        canvas.pixel[i,j] = color;
    end

    function getpixel(canvas::Canvas, i::Int, j::Int)
        canvas.pixel[i,j];
    end

    function canvas_to_ppm(canvas::Canvas, maxval::Int, filename::String)
        w = size(canvas.pixel)[1];
        h = size(canvas.pixel)[2];
        os = open(filename, "w");
        header = string("P3", "\n", w, "\n", h, "\n", maxval, "\n");
        write(os, header)
        columns = 0;
        for i in 1:h
            for j in 1:w
                rgb = rgbcolor(canvas.pixel[j,i], maxval);
                x = "$(rgb.red) $(rgb.green) $(rgb.blue) "; # note space at end
                if (columns + length(x) > PPM_COLUMNS) 
                    write(os, "\n"); columns = 0;
                end
                write(os, x);
                columns += length(x);
            end            
        end
        write(os, "\n"); ## PPM specifies a terminal newline
        close(os);
    end

end # module Lyta
