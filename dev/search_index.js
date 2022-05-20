var documenterSearchIndex = {"docs":
[{"location":"#DiscountedCashFlows","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"","category":"section"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"This package can calculate discounted cash flows via the dcf function.","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"To install this package, use","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"julia> ]\n\npkg> add https://github.com/rikhuijzer/DiscountedCashFlows.jl","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"Next, you can use the dcf function:","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"dcf","category":"page"},{"location":"#DiscountedCashFlows.dcf","page":"DiscountedCashFlows","title":"DiscountedCashFlows.dcf","text":"dcf(initial_cash_flow::Real, cash_flow_growth::Real, n::Int, discount_rate::Real)\n\nReturn the discounted cash flow.\n\ninitial_cash_flow: The cash flow in year 1.\ncash_flow_growth: The estimated annual cash flow growth.   For a 10% annual growth, pass 1.10.\nn: Number of years for which to calculate the annual cash flow.\ndiscount_rate: The discount rate.   For a 10% annual discount rate, pass 0.10.\n\nExample\n\njulia> using DiscountedCashFlows\n\njulia> initial_cash_flow = 10_000;\n\njulia> growth_rate = 1.07;\n\njulia> n = 15;\n\njulia> discount_rate = 0.10;\n\njulia> dcf(initial_cash_flow, growth_rate, n, discount_rate)\n121091.8\n\njulia> print_underscores(ans)\n121_091.8\n\n\n\n\n\n","category":"function"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"For example, this package can be used to reproduce the Costco discounted cash flow calculation reported in the Nomad letters. The Nomad Investement Partnership is known for an annual return for over 20% for 20 years. One of their best decisions was to invest in Costco. In the Nomad letters on page 53, they expect a normalized growth of 13%. According to their calculations published at the year end of 2004:","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"7% growth gives a discounted share price of $43.\n10% growth gives a discounted share price of $62.\n15% growth gives a discounted share price of $85.","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"Then, they say that they expect it takes 5 years for other investors to realize that the growth is 10% per year instead of the 5% which is the current valuation. Let's try to recreate this calculation.","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"In 2004, Costco had 457.479 million outstanding shares and a cash flow of 2.098.783.000 dollars. This gives a cash flow per share of","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"cash_flow_per_share = round(2_098_783_000 / 457_479_000; digits=2)","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"This gives,","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"using DiscountedCashFlows\n\ngrowth_rates = [1.07, 1.10, 1.15]\n# Discount rate taken on page 53.\ndiscount_rate = 0.10\nn = 16\nmargin_of_safety = 0.80\ninitial_cash_flow = round(margin_of_safety * cash_flow_per_share; digits=2)","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"flows = [r => dcf(initial_cash_flow, r, n, discount_rate) for r in growth_rates]","category":"page"},{"location":"","page":"DiscountedCashFlows","title":"DiscountedCashFlows","text":"Which is very close to the numbers reported above. The difference is caused by me now knowing the estimates for the number of years to look ahead, the margin of safety and for the initial cash flow.","category":"page"}]
}