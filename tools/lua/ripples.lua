local DENSITY = 12
local MAX_RADIUS = 1
local TIME_SCALE = 1

require "lua/hash-noise"


function calculateRipples(uv, time)
    --local uv = vec(x, y) * DENSITY
    local p0 = floor(uv);

    local circles = vec2(0.0)
    for j = -MAX_RADIUS, MAX_RADIUS do
        for i = -MAX_RADIUS, MAX_RADIUS do
            local pi = p0 + vec(i, j)

            local uvw = uv
            --uvw.x --

            --local hsh = pi
            local p = pi + hash22(pi % DENSITY)

            -- local dw = DENSITY
            -- p.x = p.x % dw;
            -- p.y = p.y % dw;

            local t = fract(time + hash12(pi % DENSITY))
            local v = p - uv
            local d = length(v) - (MAX_RADIUS + 1.0)*t

            local h = 1e-3
            local d1 = d - h
            local d2 = d + h
            local p1 = sin(31.0*d1) * smoothstep(-0.6, -0.3, d1) * smoothstep(0.0, -0.3, d1)
            local p2 = sin(31.0*d2) * smoothstep(-0.6, -0.3, d2) * smoothstep(0.0, -0.3, d2)
            circles = circles + 0.5 * normalize(v) * ((p2 - p1) / (2.0 * h) * (1.0 - t) * (1.0 - t))
        end
    end

    return circles / (MAX_RADIUS*2+1)^2

    --local intensity = mix(0.01, 0.15, smoothstep(0.1, 0.6, abs(fract(0.05*z + 0.5)*2.0-1.0)))
    --local n = vec(circles, sqrt(1.0 - dot(circles, circles)))
end

function processTexel(x, y, z)
    local uv = vec(x, y) * DENSITY
    local circles = calculateRipples(uv, z * TIME_SCALE)
    return circles * 0.5 + 0.5
end
