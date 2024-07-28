# test ray-object intersections

# !! calculation assumes unit sphere regardless of Sphere.radius

function test_sphere(s::Sphere, r::Ray)
    offset = r.origin - s.origin
    a = Lyta.dot(r.direction, r.direction);
    b = 2 * dot(r.direction, offset);
    c = dot(offset, offset) - 1;
    d = b^2 -4 * a * c;
    if d<0
        [];  # array of Intersections
    else
        t1 = -b - sqrt(d) / (2*a);
        t2 = -b + sqrt(d) / (2*a);
        [Lyta.Intersection(s.objectId, t1), Lyta.Intersection(s.objectId, t2)];
    end    
end
