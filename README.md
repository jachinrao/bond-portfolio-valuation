# Bond Portfolio Valuation

This repository contains an implementation of a bond portfolio valuation model with a focus on credit risk. The model uses a Gaussian copula to simulate correlated bond rating transitions and calculate portfolio returns, incorporating simplified yield curves and an optional interest rate risk adjustment.

## Overview

The project simulates the future value distribution of a bond portfolio, accounting for credit risk through bond rating transitions. It features:

- A simplified bond rating system (AAA, AA, A, and default).
- Yield curves for pricing bonds based on ratings.
- A transition matrix derived from historical data to model rating changes.
- Gaussian copula for introducing correlation between bond transitions.
- Portfolio return calculations with an optional interest rate risk adjustment.

The example portfolio consists of five corporate bonds with terms of 5, 10, 15, 20, and 25 years, where four are rated AAA and one is rated A. The model calculates current bond prices, potential prices after one year, and portfolio returns under various scenarios.

## Setup

R packages:

- `copula` - for Gaussian copula simulations.
- `lifecontingencies` - for financial calculations like present value.

Install the required packages in R:

```R
install.packages(c("copula", "lifecontingencies"))
```

