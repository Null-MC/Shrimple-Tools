local VALUE_SEED = 761.438
local VALUE_OCTAVES = 6
local VALUE_SCALE = vec(32, 8, 32)

local WORLEY_SEED = 137.836
local WORLEY_OCTAVES = 2
local WORLEY_SCALE = vec(16, 8, 16)

require "lua/noise/hash"
require "lua/noise/value"
require "lua/noise/worley"


function ValueNoiseFBM(coord, scale, octave_count)
    local amplitude = 1.0
    local value = 0.0
    local max = 0.0
    
    for i = 1, octave_count do
        value = value + amplitude * ValueNoise3D(coord * scale, scale, VALUE_SEED+i)

        max = max + amplitude
        amplitude = amplitude * 0.5
        scale = scale * 2.0
    end

    return value / max
end

function WorleyNoiseFBM(coord, scale, octave_count)
    local amplitude = 1.0
    local value = 0.0
    local max = 0.0

    for i = 1, octave_count do
        value = value + amplitude * WorleyNoise3D(coord * scale, scale, WORLEY_SEED+i)

        max = max + amplitude
        amplitude = amplitude * 0.5
        scale = scale * 2.0
    end

    return value / max
end

function remap(value, fromMin, fromMax, toMin, toMax)
    local norm = (value - fromMin) / (fromMax - fromMin)
    return toMin + norm * (toMax - toMin)
end

function processTexel(x, y, z)
    local pos = vec(x, y, z)
    local perlin = ValueNoiseFBM(pos, VALUE_SCALE, VALUE_OCTAVES)
    local worley = WorleyNoiseFBM(pos, WORLEY_SCALE, WORLEY_OCTAVES)
    return remap(perlin, 1.0 - worley, 1.0, 0.0, 1.0)
end
