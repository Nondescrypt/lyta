# Canvas

PPM_COLUMNS = 70;   # we didn't write the rules

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
