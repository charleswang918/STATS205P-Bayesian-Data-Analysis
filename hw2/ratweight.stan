//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

data {
  int<lower=0> J;
  int<lower=0> N;
  vector[N] y;
  int<lower=1, upper=J> rat[N];
}

parameters {
  real mu0;
  real<lower=0> tau0;
  vector[J] mu;
  vector<lower=0>[J] sigma;
}

model {
  mu0 ~ normal(0, 1000);
  tau0 ~ scaled_inv_chi_square(1, 0.05);
  mu ~ normal(mu0, tau0);
  sigma ~ scaled_inv_chi_square(1, 0.05);
  
  for (i in 1:N) {
    y[i] ~ normal(mu[rat[i]], sigma[rat[i]]);
  }
}

