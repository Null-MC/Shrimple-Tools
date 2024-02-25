local VALUE_OCTAVE_COUNT = 2
local VALUE_SCALE = vec(3, 6)
local WORLEY_SCALE = vec(9, 18)
local DOMAIN_RANGE = vec(0.16, 0.08)
local VALUE_SEED = vec(216.197, 438.736)
local TIME_OCTAVE_COUNT = 2
local TIME_SEED = 137.761
local TIME_SCALE = 8

require "lua/rgb"
require "lua/hash-noise"
require "lua/value-noise"


function WorleyNoise2D(coord, size, seed)
    local fractCoord = fract(coord)
    local floorCoord = mod(coord - fractCoord, size)
    local ceilCoord = mod(floorCoord + 1, size)
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

function ValueNoiseFBM(coord, scale, octave_count, seed)
    local amplitude = 0.5
    
    local value = 0.0;
    for i = 1, octave_count do
        value = value + amplitude * ValueNoise2D(coord * scale, scale, seed)
        amplitude = amplitude * 0.5
        scale = scale * 2.0
    end

    return value
end

function processTexel(x, y, z)
    local uv = vec(x, y)
    local uv_domain = uv * VALUE_SCALE

    local time = z * TIME_SCALE
    local time_mix = fract(time)
    local time_min = floor(time)
    local time_max = mod(time_min + 1, TIME_SCALE)

    local time_offset_min = ValueNoiseFBM(uv_domain, VALUE_SCALE, TIME_OCTAVE_COUNT, TIME_SEED + time_min)
    local time_offset_max = ValueNoiseFBM(uv_domain, VALUE_SCALE, TIME_OCTAVE_COUNT, TIME_SEED + time_max)
    local time_offset = mix(time_offset_min, time_offset_max, time_mix)

    time = time + time_offset * TIME_SCALE
    time_mix = fract(time)
    --time_mix = smoothstep(0.0, 1.0, time_mix)
    time_min = mod(time - time_mix, TIME_SCALE)
    time_max = mod(time_min + 1, TIME_SCALE)

    local domain_min = vec(
        ValueNoiseFBM(uv_domain, VALUE_SCALE, VALUE_OCTAVE_COUNT, VALUE_SEED.x + time_min),
        ValueNoiseFBM(uv_domain, VALUE_SCALE, VALUE_OCTAVE_COUNT, VALUE_SEED.y + time_min)
    )

    local domain_max = vec(
        ValueNoiseFBM(uv_domain, VALUE_SCALE, VALUE_OCTAVE_COUNT, VALUE_SEED.x + time_max),
        ValueNoiseFBM(uv_domain, VALUE_SCALE, VALUE_OCTAVE_COUNT, VALUE_SEED.y + time_max)
    )

    local domain_offset = mix(domain_min, domain_max, time_mix)
    --domain_offset = smoothstep(0.0, 1.0, domain_offset)
    domain_offset = domain_offset * 2.0 - 1.0

    uv = uv + DOMAIN_RANGE * domain_offset

    local worley_noise = WorleyNoise2D(uv * WORLEY_SCALE, WORLEY_SCALE, 0.4378)

    return linear_to_rgb(worley_noise)
end
