local VALUE_SEED = 13.49
local VALUE_OCTAVES = 1
local VALUE_SCALE = vec(9, 9, 4)

local VALUE_OCTAVES_2 = 1
local VALUE_SCALE_2 = vec(16, 9, 6)

local WORLEY_SEED = 76.16
local WORLEY_OCTAVES = 1
local WORLEY_SCALE = vec(18, 24, 9)

require "lua/noise/hash"
require "lua/noise/value"
require "lua/noise/worley"


function ValueNoiseFBM(coord, scale, octave_count)
    local amplitude = 0.5
    
    local value = 0.0;
    for i = 1, octave_count do
        value = value + amplitude * ValueNoise3D(coord * scale, scale, VALUE_SEED+i)
        amplitude = amplitude * 0.5
        scale = scale * 2.0
    end

    local max = 1.0 - rcp(2^octave_count)
    return value / max
end

function WorleyNoiseFBM(coord, scale, octave_count)
    local amplitude = 0.5
    
    local value = 0.0;
    for i = 1, octave_count do
        value = value + amplitude * WorleyNoise3D(coord * scale, scale, WORLEY_SEED+i)
        amplitude = amplitude * 0.5
        scale = scale * 2.0
    end

    local max = 1.0 - rcp(2^octave_count)
    return value / max
end

function processTexel(x, y, z)
    local pos = vec(x, y, z)

    local value_noise = ValueNoiseFBM(pos, VALUE_SCALE, VALUE_OCTAVES)
    local value_noise_2 = ValueNoiseFBM(pos, VALUE_SCALE_2, VALUE_OCTAVES_2)
    local worley_noise = WorleyNoiseFBM(pos, WORLEY_SCALE, WORLEY_OCTAVES)

    --return 1.0 - value_noise_2 * worley_noise
    return (1.0 - value_noise^2) * (1.0 - worley_noise*value_noise_2)
end
