function local_x(element::FDMelement; unit = true)
    vec = element.pEnd.position - element.pStart.position

    unit ? normalize(vec) : vec
end

Base.length(element::FDMelement) = norm(local_x(element; unit = false))

function force(element::FDMelement)
    return length(element) * element.q
end

function Base.getindex(elements::Vector{FDMelement}, i::Symbol)
    return [element for element in elements if element.id == i]
end

function Base.findall(elements::Vector{FDMelement}, i::Symbol)
    return findall([x.id == i for x in elements])
end