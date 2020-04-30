(A <- matrix(4:7,2,2))
A%*%A - sum(diag(A)) * A + det(A) * diag(rep(1,2))
2.88*10^-15

(A <- matrix(1:9,3,3)+diag(rep(1,3)))
(b <- c(10,19,-3))
(x <- solve(A,b))
