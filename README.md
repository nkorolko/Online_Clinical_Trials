# Covariate-adaptive optimization in online clinical trials 

State-of-the-art methods for covariate-adaptive randomization

Pharmaceutical companies spend tens of billions of dollars each year to operate multi-year clinical
trials needed for the approval of new drugs. We present a novel covariate-adaptive optimization
algorithm for online allocation in clinical trials that leverages robust mixed-integer optimization.
Our approach allocates groups with on average 3-4 times lower discrepancy in means (or 1.4
times, in the case of multiple controlled covariates) than those produced by covariate-adaptive
randomization methods. In simulated experiments involving both single (and multiple) covariates,
our method achieves a desired level of statistical power at a sample size that is on average
35% smaller (14% smaller, respectively) relative to state-of-the-art covariate-adaptive randomization
approaches. Correspondingly, we expect that our approach could substantially reduce both
the duration and operating costs of a clinical trial. This computationally tractable assignment
mechanism is an effcient alternative to existing covariate-adaptive randomization methods.

This paper is submitted to Biostatistics journal. 

In this repository we present only codes in Julia for state-of-the-art covariate-adaptive randomization methods:

1) Antognini 
2) Pocock
3) Atkinson.

All of them are to some extent special versions of Efron`s biased coin designs.

[1] Antognini, A. Baldi and Zagoraiou, Maroussa. (2011). The covariate-adaptive biased
coin design for balancing clinical trials in the presence of prognostic factors. Biometrika 98(3),
519-535.

[2] Pocock, S. J. and Simon, R. (1975). Sequential treatment assignment with balancing for
prognostic factors in the controlled clinical trial. Biometrics 31(1), 103-115.

[3] Atkinson, A. C. (1982). Optimum biased coin designs for sequential clinical trials with prognostic
factors. Biometrika 69(1), 61-67.

[4] http://julialang.org/
