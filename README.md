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

## Setup and Usage

R packages:

- `copula` - for Gaussian copula simulations.
- `lifecontingencies` - for financial calculations like present value.

Install the required packages in R:

```R
install.packages(c("copula", "lifecontingencies"))
```

Run the Script. The script will:

- Define yield curves and bond parameters.
- Simulate bond rating transitions using a Gaussian copula.
- Calculate bond prices and portfolio returns.
- Output key statistics (mean, standard deviation, VaR) and optionally generate plots.

## Key Features

- **Bond Pricing**: Uses spot and forward rates $\delta$ derived from instantaneous forward yield curves.
  $$
  \delta_{AAA}=0.04-0.01\exp(-0.2t)\\
  \delta_{AA}=0.05=0.01\exp(-0.2t)\\
  \delta_{A}=0.06-0.01\exp(-0.2t)
  $$

- **Transition Matrix**: Models rating changes (e.g., 85% chance AAA stays AAA, 20% chance A defaults).

- **Copula Simulation**: Applies a Gaussian copula to introduce correlation between bonds.

- **Interest Rate Risk**: Optional adjustment using a normal distribution $N(1, 0.2^2)$.

- **Portfolio Analysis**: Computes mean return, standard deviation, and 99.5% Value at Risk (VaR).

## Example Output

For the default portfolio with low correlation:

- Mean portfolio return: ~2.57%
- Standard deviation: ~3.95%
- 99.5% VaR: ~-8.85% (or ~-9.47% with interest rate risk)

For a highly correlated portfolio (Exercise 15.3):

- Mean portfolio return: ~2.57%
- Standard deviation: ~5.51%
- 99.5% VaR: ~-17.85%

## Limitations

- Simplified rating system (only 3 ratings vs. real-world granularity).
- Static yield curves (except for optional interest rate adjustment).
- Assumes a 20% loss on default, which may not reflect real-world variability.

## Future Improvements

- Expand the rating system to include more categories (e.g., Moody’s full scale).
- Incorporate dynamic yield curve models (e.g., Vasicek or Hull-White).
- Add sensitivity analysis for transition matrix parameters.
