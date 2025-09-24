%% Calculate the coefficient of each epicycles
function sum = coeff_cal(k, N, Black_Point)
    func = @(t) exp(-2*pi*1i*(k-N-1)*t)*draw_obj(t, Black_Point);
    h = 0.001;
    t = 0:h:1;

    n = length(t);
    sum = 0;
    for i = 2:1:n
        I_trap = (h/2)*(func(t(i-1)) + func(t(i)));
        sum = sum + I_trap;
    end
end