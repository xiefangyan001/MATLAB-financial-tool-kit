function [dur] = duration_func(pay_option, APR, r)
% pay_option: 1-->Equal payment 
%             2-->Equal Amortization
% APR: interest rate
% r: discount rate
    syms rv; 
    % rv is a symbol, later we substitute it to APR
    P = 20000;
    periods = 120;
    payments = 0;
    if pay_option == 1
        for i = 1 : periods
            payments = payments + P * (rv / 12) * (1 + (rv / 12)) ^ (periods) / ((1 + (rv / 12)) ^ periods - 1) / ((1 + r / 12) ^ i);
        end
    else
        for i = 1 : periods
            payments = payments + (P / periods + (P - P / periods * (i - 1)) * (rv / 12)) / ((1 + r / 12) ^ i);
        end
    end
    NPV_function = P - payments;
    first_deri = diff(NPV_function, 1);
    deri_value = vpa(subs(first_deri, rv, APR)); 
    NPV_value = vpa(subs(NPV_function, rv, APR));
    dur = - (1 + APR) / NPV_value * deri_value;
end