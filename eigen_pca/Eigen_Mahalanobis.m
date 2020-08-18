function d=Eigen_Mahalanobis(F1, F2, e_val)

x = F1 - F2;
x = (x.^2)./e_val;
x = sum(x);
d = sqrt(x);

return;