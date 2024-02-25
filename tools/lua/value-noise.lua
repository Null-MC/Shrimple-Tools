function ValueNoise2D(coord, size, seed)
    local fractCoord  = fract(coord)
    local floorCoord  = mod(coord - fractCoord, size)
    local ceilCoord   = mod(floorCoord + 1.0, size)
    local smoothCoord = smoothstep(0.0, 1.0, fractCoord)
    
    return mix(
        mix(
            hash13(vec(floorCoord.x, floorCoord.y, seed)),
            hash13(vec(floorCoord.x,  ceilCoord.y, seed)),
            smoothCoord.y
        ),
        mix(
            hash13(vec( ceilCoord.x, floorCoord.y, seed)),
            hash13(vec( ceilCoord.x,  ceilCoord.y, seed)),
            smoothCoord.y
        ),
        smoothCoord.x
    )
end

function ValueNoise3D(coord, size, seed)
    local f = fract(coord)
    local min = mod(coord - f, size)
    local max = mod(min + 1.0, size)

    f = f*f*(3.0-2.0*f)
    
    return mix(
        mix(
            mix(
                hash14(vec(min.x, min.y, min.z, seed)),
                hash14(vec(max.x, min.y, min.z, seed)),
                f.x
            ),
            mix(
                hash14(vec(min.x, max.y, min.z, seed)),
                hash14(vec(max.x, max.y, min.z, seed)),
                f.x
            ),
            f.y
        ),
        mix(
            mix(
                hash14(vec(min.x, min.y, max.z, seed)),
                hash14(vec(max.x, min.y, max.z, seed)),
                f.x
            ),
            mix(
                hash14(vec(min.x, max.y, max.z, seed)),
                hash14(vec(max.x, max.y, max.z, seed)),
                f.x
            ),
            f.y
        ),
        f.z
    )
end
