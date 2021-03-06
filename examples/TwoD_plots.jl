using Plots
Plots.GRBackend()

function flood(f::Array;shift=(0.,0.),cfill=:RdBu_11,clims=(),kv...)
    if length(clims)==2
        @assert clims[1]<clims[2]
        @. f=min(clims[2],max(clims[1],f))
    else
        clims = (minimum(f),maximum(f))
    end
    Plots.contour(axes(f,1).+shift[1],axes(f,2).+shift[2],f',
        linewidth=0,linecolor=:black,
        fill = (true,palette(cfill)),
        clims = clims, aspect_ratio=:equal; kv...)
end

addbody(x,y;c=:black) = Plots.plot!(Shape(x,y), c=c, legend=false)
