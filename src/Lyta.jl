module Lyta

    greet() = print("Lyta en la casa!")

    @enum TripleType t_vector=0 t_point=1

    struct Triple
        x::Float64
        y::Float64
        z::Float64
        t::TripleType
    end;

    function vector(x, y, z)
        Triple(x, y, z, t_vector);
    end

    function point(x, y, z)
        Triple(x, y, z, t_point);
    end

end # module Lyta
