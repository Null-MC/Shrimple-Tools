local VALUE_OCTAVES = 3
local VALUE_SEED = 13.49
local VALUE_SCALE = vec3(16.0)

require "lua/hash-noise"
require "lua/value-noise"


function ValueNoiseFBM(coord, scale, octave_count)
    local amplitude = 0.5
    
    local value = 0.0;
    for i = 1, octave_count do
        value = value + amplitude * ValueNoise3D(coord * scale, scale, VALUE_SEED)
        amplitude = amplitude * 0.5
        scale = scale * 2.0
    end

    local max = 1.0 - rcp(2^octave_count)
    return value / max
end

function processTexel(x, y, z)
    local pos = vec(x, y, z)

    return ValueNoiseFBM(pos, VALUE_SCALE, VALUE_OCTAVES)
end
