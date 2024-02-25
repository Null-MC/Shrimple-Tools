local VALUE_OCTAVES = 6
local VALUE_SEED = 394.731
local VALUE_SCALE = vec2(32.0)

local WORLEY_SCALE = vec2(48.0)
local WORLEY_SEED = 0.27694

require "lua/hash-noise"
require "lua/value-noise"


function WorleyNoise2D(coord, size, seed)
    local fractCoord = fract(coord)
    local floorCoord = mod(coord - fractCoord, size)
    local ceilCoord = mod(floorCoord + 1.0, size)
    local min_dist = 1.0

    for y = -1, 1
    do
        for x = -1, 1
        do
            local neighbor = vec(x, y)
            local neighbor_wrapped = mod(floorCoord + neighbor, size)
            local point = hash23(vec(neighbor_wrapped, seed))
            local diff = neighbor + point - fractCoord
            local dist = length(diff)

            min_dist = min(min_dist, dist)
        end
    end

    return min_dist
end

function ValueNoiseFBM(coord, scale, octave_count)
    local amplitude = 0.5
    
    local value = 0.0;
    for i = 1, octave_count do
        value = value + amplitude * ValueNoise2D(coord * scale, scale, VALUE_SEED)
        amplitude = amplitude * 0.5
        scale = scale * 2.0
    end

    return value
end

function processTexel(x, y)
    local pos = vec(x, y)

    local value_fbm = ValueNoiseFBM(pos, VALUE_SCALE, VALUE_OCTAVES)
    local worley_noise = WorleyNoise2D(pos * WORLEY_SCALE, WORLEY_SCALE, WORLEY_SEED)

    return vec(value_fbm, worley_noise)
end
