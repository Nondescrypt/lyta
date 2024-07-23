using Lyta;

mutable struct Projectile 
    position::Lyta.Point 
    velocity::Lyta.Vector
    dragCoef::Real
end

mutable struct Environment
    gravity::Lyta.Vector    # an acceleration
    windage::Lyta.Vector    # a velocity
end

env = Environment(Lyta.vector(0, -0.1, 0), Lyta.vector(-7, 0, 0));
pro = Projectile(Lyta.point(0, 1, 0), Lyta.normalize(Lyta.vector(1, 1, 0)), 0.01);

function tick!(p::Projectile, e::Environment, dt::Real)
    p.position += p.velocity * dt;
    p.velocity += (e.gravity + (e.windage-p.velocity)*p.dragCoef) * dt;
end;

# example: max_iterations=10000, Δt=0.01

function fire!(p::Projectile, e::Environment, max_iterations::Integer, Δt::Real)
    println("initial position: ", p.position);
    println("initial velocity: ", p.velocity);

    iteration = 0;

    while(p.position.y > 0 && iteration < max_iterations)
        iteration += 1;
        tick!(p, e, Δt);
    end

    println("iterations: ", iteration);
    println("final position: ", p.position);
    println("final velocity: ", p.velocity);
end;
