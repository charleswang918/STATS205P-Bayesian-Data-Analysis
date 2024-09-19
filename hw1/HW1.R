# Q3(a)

theta_values <- seq(0, 3, length.out = 1000)

prior_density <- dgamma(theta_values, shape = 16, rate = 10)

plot(theta_values, prior_density, type = 'l', col = 'blue', lwd = 2,
     main = 'Prior Distribution of Theta (Gamma(16, 10))',
     xlab = 'Theta', ylab = 'Density')
legend("topright", legend = sprintf("Prior", 16, 10), 
       col = 'blue', lty = 1, lwd = 2)
grid()

#Q3(b)
posterior_density <- dgamma(theta_values, shape = 25, rate = 14)

plot(theta_values, posterior_density, type = 'l', col = 'red', lwd = 2,
     main = 'Posterior Distribution of Theta (Gamma(25, 14))',
     xlab = 'Theta', ylab = 'Density')
legend("topright", legend = sprintf("Posterior", 25, 14), 
       col = 'red', lty = 1, lwd = 2)
grid()


