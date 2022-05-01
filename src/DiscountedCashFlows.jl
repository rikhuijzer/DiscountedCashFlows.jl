module DiscountedCashFlows

export dcf, cash_flows

function dcf(cash_flows::AbstractVector{<:Real}, discount_rate::Real)
    out = 0.0
    for (year, cash_flow) in enumerate(cash_flows)
        denom = (1 + discount_rate)^year
        discounted = cash_flow / denom
        out += discounted
    end
    return round(out; digits=1)
end;

function cash_flows(current_cash_flow::Real, cash_flow_growth::Real, nyears::Int)
    @assert 1 < cash_flow_growth "Cash flow growth is assumed to be above 1. For example, for an annual growth of 5%, pass 1.05."
    return [current_cash_flow * cash_flow_growth^i for i in 1:nyears]
end

function dcf(current_cash_flow::Real, cash_flow_growth::Real, nyears::Int, discount_rate::Real)
    flows = cash_flows(current_cash_flow, cash_flow_growth, nyears)
    return dcf(flows, discount_rate)
end;

end # module
