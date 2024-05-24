local U = vec(0.1031, 0.1030, 0.0973, 0.1099)


function hash12(p2)
    local p3 = fract(p2.xyx * U.x)
    p3 = p3 + dot(p3, p3.yzx + 33.33)
    return fract((p3.x + p3.y) * p3.z)
end

function hash13(p3)
    p3 = fract(p3 * U.x)
    p3 = p3 + dot(p3, p3.zyx + 33.33)
    return fract((p3.x + p3.y) * p3.z)
end

function hash14(p4)
    p4 = fract(p4  * U);
    p4 = p4 + dot(p4, p4.wzxy + 33.33);
    return fract((p4.x + p4.y) * (p4.z + p4.w));
end

function hash22(p2)
    local p3 = fract(vec(p2.xyx) * U.xyz)
    p3 = p3 + dot(p3, p3.yzx + 33.33)
    return fract((p3.xx + p3.yz) * p3.zy)
end

function hash23(p3)
    p3 = fract(p3 * U.xyz)
    p3 = p3 + dot(p3, p3.yzx + 33.33)
    return fract((p3.xx + p3.yz) * p3.zy)
end

function hash24(p4)
    p4 = fract(p4 * U)
    p4 = p4 + dot(p4, p4.wzxy + 33.33)
    return fract((p4.x + p4.y) * (p4.z + p4.w));
end
