module DiscountedCashFlows

using Formatting: format

export dcf, print_underscores

function print_underscores(x::Real)
    with_underscores = replace(format(x; commas=true), ',' => '_')
    println(with_underscores)
    return nothing
end

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

function dcf(cash_flows::AbstractVector{<:Real}, discount_rate::Real)
    out = 0.0
    for (year, cash_flow) in enumerate(cash_flows)
        denom = (1 + discount_rate)^year
        discounted = cash_flow / denom
        out += discounted
    end
    return round(out; digits=1)
end

"""
    dcf(initial_cash_flow::Real, cash_flow_growth::Real, n::Int, discount_rate::Real)

Return the discounted cash flow.

- `initial_cash_flow`: The cash flow in year 1.
- `cash_flow_growth`: The estimated annual cash flow growth.
    For a 10% annual growth, pass 1.10.
- `n`: Number of years for which to calculate the annual cash flow.
- `discount_rate`: The discount rate.
    For a 10% annual discount rate, pass 0.10.

# Example
```jldoctest
julia> using DiscountedCashFlows

julia> initial_cash_flow = 10_000;

julia> growth_rate = 1.07;

julia> discount_rate = 0.10;

julia> n = 15;

julia> dcf(initial_cash_flow, growth_rate, n, discount_rate)
121091.8

julia> print_underscores(ans)
121_091.8
```
"""
function dcf(initial_cash_flow::Real, cash_flow_growth::Real, n::Int, discount_rate::Real)
    flows = cash_flows(initial_cash_flow, cash_flow_growth, n)
    return dcf(flows, discount_rate)
end

include("precompile.jl")

end # module
