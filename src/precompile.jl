# A small workload to force some precompilation.
if ccall(:jl_generating_output, Cint, ()) == 1
    dcf(10_000, 0.1, 10, 1.1)
    dcf(10_000.0, 0.1, 10, 1.1)
end
