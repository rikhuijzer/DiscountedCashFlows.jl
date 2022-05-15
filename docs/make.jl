using Documenter:
    DocMeta,
    HTML,
    asset,
    deploydocs,
    makedocs
using DiscountedCashFlows

DocMeta.setdocmeta!(
    DiscountedCashFlows,
    :DocTestSetup,
    :(using DiscountedCashFlows);
    recursive=true
)

sitename = "DiscountedCashFlows.jl"
pages = [
    "DiscountedCashFlows" => "index.md"
]

prettyurls = get(ENV, "CI", nothing) == "true"
format = HTML(; prettyurls)
modules = [DiscountedCashFlows]
strict = true
checkdocs = :none
makedocs(; sitename, pages, format, modules, strict, checkdocs)

deploydocs(;
    branch="docs",
    devbranch="main",
    repo="github.com/rikhuijzer/DiscountedCashFlows.jl.git",
    push_preview=false
)
