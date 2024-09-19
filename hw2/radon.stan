data {
  int<lower=0> N;                  // total number of observations
  int<lower=0> N_states;           // number of states
  int<lower=1, upper=N_states> state[N];  // state index for each observation
  vector[N] radon;                 // radon measurements
}

parameters {
  real mu0;                        
  real<lower=0> tau0;
  vector[N_states] state_mu; 
  vector<lower=0>[N_states] sigma;  
}

model {
  // Priors
  mu0 ~ normal(0, 1000);
  tau0 ~ scaled_inv_chi_square(1, 0.05);
  sigma ~ scaled_inv_chi_square(1, 0.05);
  state_mu ~ normal(mu0, tau0);
  
  // Model
  for (i in 1:N) {
    radon[i] ~ normal(state_mu[state[i]], sigma[state[i]]);
  }
}

