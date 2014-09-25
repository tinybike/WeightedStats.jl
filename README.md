## WeightedStats

[![Build Status](https://travis-ci.org/tensorjack/WeightedStats.jl.svg?branch=master)](https://travis-ci.org/tensorjack/WeightedStats.jl) [![Coverage Status](https://coveralls.io/repos/tensorjack/WeightedStats.jl/badge.png)](https://coveralls.io/r/tensorjack/WeightedStats.jl)

A tiny Julia package which calculates weighted medians and means.  Yep, that's it!

### Usage

Installation:

    julia> Pkg.clone("git://github.com/tensorjack/WeightedStats.jl.git")

Use:

    julia> using WeightedStats

    julia> data = [2, 0.6, 1.3, 0.3, 0.3, 1.7, 0.7, 1.7, 0.4];

    julia> weights = [2, 2, 0, 1, 2, 2, 1, 6, 0];

    julia> println(weighted_median(data, weights))
    1.7

    julia> println(weighted_mean(data, weights))
    1.275

Boom!

### Tests

    $ julia test/runtests.jl
