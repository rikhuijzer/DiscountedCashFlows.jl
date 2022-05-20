# DiscountedCashFlows

This package can calculate discounted cash flows via the `dcf` function.

To install this package, use
```julia
julia> ]

pkg> add https://github.com/rikhuijzer/DiscountedCashFlows.jl
```

Next, you can use the `dcf` function:

```@docs
dcf
```

For example, this package can be used to reproduce the Costco discounted cash flow calculation reported in the Nomad letters.
The Nomad Investement Partnership is known for an annual return for over 20% for 20 years.
One of their best decisions was to invest in Costco.
In the Nomad letters on page 53, they expect a normalized growth of 13%.
According to their calculations published at the year end of 2004:

- **7%** growth gives a discounted share price of **\$43**.
- **10%** growth gives a discounted share price of **\$62**.
- **15%** growth gives a discounted share price of **\$85**.

Then, they say that they expect it takes 5 years for other investors to realize that the growth is 10% per year instead of the 5% which is the current valuation.
Let's try to recreate this calculation.

In 2004, Costco had 457.479 million outstanding shares and a cash flow of 2.098.783.000 dollars.
This gives a cash flow per share of

```@example costco
cash_flow_per_share = round(2_098_783_000 / 457_479_000; digits=2)
```

This gives,

```@example costco
using DiscountedCashFlows

growth_rates = [1.07, 1.10, 1.15]
# Discount rate taken on page 53.
discount_rate = 0.10
n = 16
margin_of_safety = 0.80
initial_cash_flow = round(margin_of_safety * cash_flow_per_share; digits=2)
```

```@example costco
flows = [growth_rate => dcf(initial_cash_flow, growth_rate, n, discount_rate) for growth_rate in growth_rates]
```

Which is very close to the numbers calculated by Nick Sleep and Qais Zakaria.
The difference is likely caused by me arriving at slightly different numbers the number of years to look ahead, the margin of safety and for the initial cash flow.

Note that Nick and Qais bought the shares for an average price of \$39 which only discounted a modest growth of 5 to 6% per year according to them.
So, they argued that buying Costco at that time was a very good deal which turned out to be true.

