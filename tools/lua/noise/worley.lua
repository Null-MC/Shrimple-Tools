function WorleyNoise3D(coord, size, seed)
    local fractCoord = fract(coord)
    local floorCoord = mod(coord - fractCoord, size)
    local ceilCoord = mod(floorCoord + 1.0, size)
    local min_dist = 1.0

    for z = -1, 1
    do
        for y = -1, 1
        do
            for x = -1, 1
            do
                local neighbor = vec(x, y, z)
                local neighbor_wrapped = mod(floorCoord + neighbor, size)
                local point = hash24(vec(neighbor_wrapped, seed))
                local diff = neighbor + point - fractCoord
                local dist = length(diff)

                min_dist = min(min_dist, dist)
            end
        end
    end

    return min_dist
end
