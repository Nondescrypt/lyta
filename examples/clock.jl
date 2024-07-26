using Lyta;

W=256; H=256; 
darkblue = Lyta.Color(0.1, 0.1, 0.2, 1.0); orange = Lyta.Color(1, .5, 0, 1);
myCanvas = Lyta.canvas(W, H, darkblue);

function draw_mark(canvas::Lyta.Canvas, x::Int, y::Int, size::Int)
    for i in -size:size
        for j in -(size-abs(i)):(size-abs(i));  # diamond shape
            canvas.pixel[x+i, y+j] = orange;
        end
    end
end

r = W * 0.8 / 2.0;
for hour in 0: 11
    Θ = hour * 2π / 12;
    x = floor(Int, r * sin(Θ) + W / 2.0);
    y = floor(Int, H / 2.0 - r * cos(Θ));
    println("$hour : [ $x , $y ]");
    draw_mark(myCanvas, x, y, 5);
end

Lyta.canvas_to_ppm(myCanvas, 255, "clock.ppm");
