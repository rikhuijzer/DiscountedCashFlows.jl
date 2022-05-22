using DiscountedCashFlows
using Test

rint(x) = round(Int, x)

const _dcf = DiscountedCashFlows._dcf

@test rint(_dcf([4e5], 0.05)) == 380_952
@test rint(_dcf([4e5, 4e5], 0.05) - _dcf([4e5], 0.05)) == 362_812
@test rint(_dcf([4e5, 4e5, 4e5, 4e5, 6e6], 0.05)) == 6_119_537

@test DiscountedCashFlows.cash_flows(10, 1.1, 2) == [10 * 1.1, 10 * 1.1^2]

initial = 4
discount_rate = 0.10
n = 15
growth_rate = 1.07
@test dcf(initial, discount_rate, n, growth_rate).discounted == 48.4
