require "lua/hash-noise"
require "lua/value-noise"


actionMap = {}
for y = 1,4 do
    actionMap[y] = {}
end

function buildDirt(tex)
    return vec4(1.0)
end

function buildGrass(tex)
    local scale = 24
    local seed = 2853

    local height = ValueNoise2D(tex/64.0 * scale, scale, seed)
    local heightX = ValueNoise2D((tex+vec(1.0,0.0))/64.0 * scale, scale, seed)
    local heightY = ValueNoise2D((tex+vec(0.0,1.0))/64.0 * scale, scale, seed)

    local dX = vec(1.0, 0.0, heightX - height)
    local dY = vec(0.0, 1.0, heightY - height)
    local normal = normalize(cross(dX, dY))

    return vec(normal*0.5+0.5, 1.0)
end

function buildSand(tex)
    return vec4(1.0)
end

actionMap[1][1] = buildDirt
actionMap[2][1] = buildGrass
actionMap[3][1] = buildSand

function processPixel(x, y)
    local tex = vec(x, y)
    local cell = floor(tex / 64)
    local localTex = tex - cell * 64

    local result = vec(0.5, 0.5, 1.0, 1.0)
    local action = actionMap[cell.x+1][cell.y+1]
    if action then
        result = action(localTex)
    end

    return result
end
