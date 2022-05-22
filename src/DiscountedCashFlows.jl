module DiscountedCashFlows

import Base: show

using Formatting: format
using PrettyTables: pretty_table

export dcf

_with_commas(x::Real) = format(x; commas=true)

"""
    cash_flows(initial_cash_flow::Real, cash_flow_growth::Real, n::Int)

Return a vector of `n` cash flows starting from the initial cash flow with an annual cash flow growth.
"""
function cash_flows(initial_cash_flow::Real, cash_flow_growth::Real, n::Int)
    if cash_flow_growth < 1
        error("""
            Cash flow growth is assumed to be above 1.
              For example, for an annual growth of 5%, pass 1.05.
            """)
    end
    return [initial_cash_flow * cash_flow_growth^i for i in 1:n]
end

function _dcf(cash_flows::AbstractVector{<:Real}, discount_rate::Real)
    out = 0.0
    for (year, cash_flow) in enumerate(cash_flows)
        denom = (1 + discount_rate)^year
        discounted = cash_flow / denom
        out += discounted
    end
    return round(out; digits=1)
end

struct DiscountedCashFlow
    initial_cash_flow::Real
    discount_rate::Real
    n::Int
    growth_rate::Real
    discounted::Real
end

function show(io::IO, ::MIME"text/plain", d::DiscountedCashFlow)
    header = ["Initial", "Discount Rate", "Number of Years", "Growth Rate", "Discounted"]
    discounted = round(Int, d.discounted)
    values = [_with_commas(d.initial_cash_flow), d.discount_rate, d.n, d.growth_rate, _with_commas(discounted)]
    data = hcat(values...)
    pretty_table(io, data, header)
end

"""
    dcf(initial::Real, discount_rate::Real, n::Int, growth_rate::Real)

Return the discounted cash flow.

- `initial`: The cash flow in year 1.
- `discount_rate`: The discount rate.
    For a 10% annual discount rate, pass 0.10.
- `n`: Number of years for which to calculate the annual cash flow.
- `growth_rate`: The estimated annual cash flow growth.
    For a 10% annual growth, pass 1.10.

# Example
```jldoctest
julia> using DiscountedCashFlows

julia> initial = 10_000;

julia> discount_rate = 0.10;

julia> n = 15;

julia> growth_rate = 1.07;

julia> dcf(initial, discount_rate, n, growth_rate)
┌─────────┬───────────────┬─────────────────┬─────────────┬────────────┐
│ Initial │ Discount Rate │ Number of Years │ Growth Rate │ Discounted │
├─────────┼───────────────┼─────────────────┼─────────────┼────────────┤
│  10,000 │           0.1 │              15 │        1.07 │    121,092 │
└─────────┴───────────────┴─────────────────┴─────────────┴────────────┘
```
"""
function dcf(initial::Real, discount_rate::Real, n::Int, growth_rate::Real)
    flows = cash_flows(initial, growth_rate, n)
    discounted = _dcf(flows, discount_rate)
    return DiscountedCashFlow(initial, discount_rate, n, growth_rate, discounted)
end

include("precompile.jl")

end # module
