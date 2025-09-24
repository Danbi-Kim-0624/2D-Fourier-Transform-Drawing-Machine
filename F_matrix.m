%% Approximate Function F(t) by Fourier Transform
function result = F_matrix(t, coeff, N)
    result = zeros(N+1, 1);
    result(1) = coeff(N+1);
    for k=2:N+1
        result(k) = result(k-1) + coeff(N-k+2)*exp(2*pi*1i*(-k+1)*t) + coeff(N+k)*exp(2*pi*1i*(k-1)*t);
    end
end