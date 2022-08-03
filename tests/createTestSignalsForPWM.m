Size = 3;
Frequency = 10000;
N = [4 6 8];
Interval = N./Frequency;

%% UP
u = uint8(zeros(2^Size,3));
t = zeros(2^Size,3);
ds = cell(1,3);
for i = 1:3
    u(:,i) = uint8(0:2^Size-1);
    t(:,i) = 0:Interval(i):(length(u)-1)*(Interval(i));
    ds{i} = timeseries(u(:,i),t(:,i));
end

%% UP & DOWN
Pause = 3*Interval(1);

u = uint8(zeros(2*(2^Size),3));
t = zeros(2*(2^Size),3);
ds = cell(1,3);

% u(:,1) = uint8([0:2^Size-1 2^Size-1:-1:0]);
% t(1:8,1) = 0:Interval(1):(length(u)/2-1)*(Interval(1));
% t(9,1) = t(8,1)+Pause;
% t(:,1) = [t(1:9,1); ...
%     transpose(t(9,1)+Interval(1):Interval(1):(t(9,1)+(length(u)/2-1)*(Interval(1))))];
% ds{1} = timeseries(u(:,1),t(:,1));

HalfLengthT = length(t)/2;

for i = 1:3
    u(:,i) = uint8([0:2^Size-1 2^Size-1:-1:0]);
    t(1:HalfLengthT,i) = 0:Interval(i):(length(u)/2-1)*(Interval(i));
    t(1+HalfLengthT,i) = t(HalfLengthT,i)+Pause;
    t(:,i) = [t(1:(1+HalfLengthT),i); ...
        transpose(t(1+HalfLengthT,i)+Interval(i):Interval(i):(t((1+HalfLengthT),i)+(length(u)/2-1)*(Interval(i))))];
    ds{i} = timeseries(u(:,i),t(:,i));
end