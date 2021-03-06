data = (
    [7, 1, 2, 4, 10],
    [7, 1, 2, 4, 10],
    [7, 1, 2, 4, 10, 15],
    [1, 2, 4, 7, 10, 15],
    [0, 10, 20, 30],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [30, 40, 50, 60, 35],
    [2, 0.6, 1.3, 0.3, 0.3, 1.7, 0.7, 1.7, 0.4],
    [3.7, 3.3, 3.5, 2.8],
    [100, 125, 123, 60, 45, 56, 66],
    [2, 2, 2, 2, 2, 2],
    [2.3],
    [-2, -3, 1, 2, -10],
    [1, 2, 3, 4, 5],
)
weights = (
    [1, 1/3, 1/3, 1/3, 1],
    [1, 1, 1, 1, 1],
    [1, 1/3, 1/3, 1/3, 1, 1],
    [1/3, 1/3, 1/3, 1, 1, 1],
    [30, 191, 9, 0],
    [10, 1, 1, 1, 9],
    [10, 1, 1, 1, 900],
    [1, 3, 5, 4, 2],
    [2, 2, 0, 1, 2, 2, 1, 6, 0],
    [5, 5, 4, 1],
    [30, 56, 144, 24, 55, 43, 67],
    [0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
    [12],
    [7, 1, 1, 1, 6],
    [1, 0, 0, 0, 2],
)
median_answers = (7.0,   4.0,  8.5,
                  8.5,  10.0,  2.5,
                  5.0,  50.0,  1.7,
                  3.5, 100.0,  2.0,
                  2.3,  -2.0,  5.0)
mean_answers = (6.444444,  4.800000, 8.583333,
                8.583333,  9.086956, 2.909091,
                4.949617, 47.333333, 1.275000,
                3.453333, 91.782816, 2.000000,
                2.300000, -4.625000, 3.666667)

num_tests = length(data)

# Weighted mean tests
@test_throws MethodError weighted_mean(data[1])
@test_throws MethodError weighted_mean("string", "input")
for i = 1:num_tests
    @test_approx_eq_eps weighted_mean(data[i], weights[i]) mean_answers[i] 1e-6
end
@test isnan(weighted_mean([4, 3, 2, 1], [0, 0, 0, 0]))

# Weighted median tests
@test_throws MethodError weighted_median(data[1])
@test_throws MethodError weighted_median("string", "input")
for i = 1:num_tests
    @test weighted_median(data[i], weights[i]) == median_answers[i]
end
@test_throws ErrorException weighted_median([4, 3, 2, 1], [0, 0, 0, 0])
@test_throws ErrorException weighted_median((Float64)[], (Float64)[])
v = [4, 3, 2, 1]
wt = [1, 2, 3, 4, 5]
@test_throws ErrorException weighted_median(v, wt)
@test_throws MethodError weighted_median([4 3 2 1 0], wt)
@test_throws MethodError weighted_median([[1 2];[4 5];[7 8];[10 11];[13 14]], wt)
v = [1, 3, 2, NaN, 2]
@test isnan(weighted_median(v, wt))
wt = [1, 2, NaN, 4, 5]
@test isnan(weighted_median(v, wt))
v = [5, 4, 3, 2, 1]
wt = [1, 2, -3, 4, -5]
@test weighted_median(v, wt) == 2.0
v = [-10, 1, 1, -10, -10]
wt = [-1, -1, -1, -1, -1]
@test weighted_median(v, wt) == -10
