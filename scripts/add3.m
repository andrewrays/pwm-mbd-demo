function sum = add3(a, b, c)
    arguments
        a (1,1) {mustBeNumeric} = 0;
        b (1,1) {mustBeNumeric} = 0;
        c (1,1) {mustBeNumeric} = 0;
    end

    sum = a + b + c;

end