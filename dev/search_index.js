var documenterSearchIndex = {"docs":
[{"location":"#DiscountedCashFlows","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"","category":"section"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"This package can calculate discounted cash flows via the dcf function.","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"To install this package, use","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"julia> ]\n\npkg> add https://github.com/rikhuijzer/DiscountedCashFlows.jl","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"Next, you can use the dcf function:","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"dcf","category":"page"},{"location":"#DiscountedCashFlows.dcf","page":"DiscountedCashFlows","title":"DiscountedCashFlows.dcf","text":"dcf(initial_cash_flow::Real, cash_flow_growth::Real, n::Int, discount_rate::Real)\n\nReturn the discounted cash flow.\n\ninitial_cash_flow: The cash flow in year 1.\ncash_flow_growth: The estimated annual cash flow growth.   For a 10% annual growth, pass 1.10.\nn: Number of years for which to calculate the annual cash flow.\ndiscount_rate: The discount rate.   For a 10% annual discount rate, pass 0.10.\n\nExample\n\njulia> using DiscountedCashFlows\n\njulia> initial_cash_flow = 10_000;\n\njulia> growth_rate = 1.07;\n\njulia> discount_rate = 0.10;\n\njulia> n = 15;\n\njulia> dcf(initial_cash_flow, growth_rate, n, discount_rate)\n121091.8\n\njulia> print_underscores(ans)\n121_091.8\n\n\n\n\n\n","category":"function"}]
}
