% Calculate the present value of a certain cash flow start from period 1

% The input is a row vector
function [pv] = discount_func(payments, rate)

    len = length(payments);

    discount = 1 / (1 + rate) * ones(1, len);

    discount = discount .^ ([1:1:len]);

    pv = discount * payments';

end


