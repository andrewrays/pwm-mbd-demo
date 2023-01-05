%%
N = [4 6 8];
Interval = N./Data.PWM_FREQ;

switch counterType
    case 'UP'
        u = uint8(zeros(2^Data.SIZE,3));
        t = zeros(2^Data.SIZE,3);
        dc = cell(1,3);

        for i = 1:3
            u(:,i) = uint8(0:2^Data.SIZE-1);
            t(:,i) = 0:Interval(i):(length(u)-1)*(Interval(i));
            dc{i} = timeseries(u(:,i),t(:,i));
        end

        Tsim = 0.006;
    case 'REVERSE'
        Pause = 3*Interval(1);

        u = uint8(zeros(2*(2^Data.SIZE),3));
        t = zeros(2*(2^Data.SIZE),3);
        dc = cell(1,3);
        HalfLengthT = length(t)/2;

        for i = 1:3
            u(:,i) = uint8([0:2^Data.SIZE-1 2^Data.SIZE-1:-1:0]);
            t(1:HalfLengthT,i) = 0:Interval(i):(length(u)/2-1)*(Interval(i));
            t(1+HalfLengthT,i) = t(HalfLengthT,i)+Pause;
            t(:,i) = [t(1:(1+HalfLengthT),i); ...
                transpose(t(1+HalfLengthT,i)+Interval(i):Interval(i):(t((1+HalfLengthT),i)+(length(u)/2-1)*(Interval(i))))];
            dc{i} = timeseries(u(:,i),t(:,i));
        end

        Tsim = 0.011;
end
