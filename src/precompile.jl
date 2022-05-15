# A small workload which runs during the precompilation phase.
# Thanks to this, answers are produced quicker when loading the package.
if ccall(:jl_generating_output, Cint, ()) == 1
    dcf(10_000, 1.1, 10, 0.1)
    dcf(10_000.0, 1.1, 10, 0.1)
end
