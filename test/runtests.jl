using DiscountedCashFlows
using Test

rint(x) = round(Int, x)

@test rint(dcf([4e5], 0.05)) == 380_952
@test rint(dcf([4e5, 4e5], 0.05) - dcf([4e5], 0.05)) == 362_812
@test rint(dcf([4e5, 4e5, 4e5, 4e5, 6e6], 0.05)) == 6_119_537

@test DiscountedCashFlows.cash_flows(10, 1.1, 2) == [10 * 1.1, 10 * 1.1^2]

growth_rate = 1.07
discount_rate = 0.10
nyears = 15
@test dcf(4, growth_rate, nyears, discount_rate) == 48.4
