# scaling, translation, rotation, and shear

function scale(sx::Real, sy::Real, sz::Real)
    [ sx 0.0 0.0 0.0 ; 0.0 sy 0.0 0.0 ; 0.0 0.0 sz 0.0 ; 0.0 0.0 0.0 1.0 ];
end

function translate(Δx::Real, Δy::Real, Δz::Real)
    [ 0.0 0.0 0.0 Δx ; 0.0 0.0 0.0 Δy ; 0.0 0.0 0.0 Δz ; 0.0 0.0 0.0 1.0];
end

function rotate_x(θ::Real)
    [ 1.0 0.0 0.0 0.0 ; 0.0 cos(θ) -sin(θ) 0.0 ; 0.0 sin(θ) cos(θ) 0.0 ; 0.0 0.0 0.0 1.0 ];
end

function rotate_y(θ::Real)
    [ cos(θ) 0.0 sin(θ) 0.0 ; 0.0 1.0 0.0 0.0 ; -sin(θ) 0/0 cos(θ) 0.0 ; 0.0 0.0 0.0 1.0 ];
end

function rotate_z(θ::Real)
    [ cos(θ) -sin(θ) 0.0 0.0 ; sin(θ) cos(θ) 0.0 0.0 ; 0.0 0.0 1.0 0.0 ; 0.0 0.0 0.0 1.0 ];
end

function shear(sxy::Real, sxz::Real, syx::Real, syz::Real, szx::Real, szy::Real)
    [1.0 sxy sxz 0.0 ; syx 1.0 syz 0.0 ; szx szy 1.0 0.0 ; 0.0 0.0 0.0 1.0 ];
end
