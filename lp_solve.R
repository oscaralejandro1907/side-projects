# Title     : Production Planning Using LpSolve package
# Objective : TODO
# Created by: oscarhernandezlopez
# Created on: 13/12/20

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(15, 25, 15, 63, 45, 50, 10, 45)

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(1, 1, 0, 0, 0, 0, 0, 0,     # demand product 1 upper bound
                  1, 1, 0, 0, 0, 0, 0, 0,     # demand product 1 lower bound
                  0, 0, 1, 1, 0, 0, 0, 0,     # demand product 2
                  0, 0, 0, 0, 1, 1, 0, 0,     # demand product 3
                  0, 0, 0, 0, 0, 0, 1, 1,     # demand product 4
                  3, 0, 5, 0, 4, 0, 4, 0,     # manual fabrication
                  8, 0, 12, 0, 10, 0, 9, 0,   # manual assembly
                  2, 0, 3, 0, 5, 0, 2, 0,     # manual test
                  0, 5, 0, 6, 0, 7, 0, 4,     # automatic fabrication
                  0, 4, 0, 5, 0, 8, 0, 5),    # automatic assembly/test
                nrow = 10, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=", ">=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=")

# Set right hand side coefficients
f.rhs <- c(3000, 1500, 2500, 2000, 3200, 16000, 30000, 15000, 24000, 20000)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, all.int = TRUE)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, all.int = TRUE)$solution

