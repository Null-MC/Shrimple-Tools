local GAMMA = 2.2


function rgb_to_linear(rgb)
    return pow(rgb, GAMMA)
end

function linear_to_rgb(rgb)
    return pow(rgb, 1.0/GAMMA)
end
