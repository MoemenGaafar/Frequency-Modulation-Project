clear; clc;

%% Generate and Plot the Message Signal
N = 40000;
t = linspace(0,2,N);
m = sawtooth(2*pi*(-t+0.5));
figure('Name','Information Signal m(t)');
plot(t, m)
xlabel('Time (msec)')
ylabel('m(t)')

%% Generate the Phase Deviation Signal
kf = 1000;
m_integrated = zeros(1,N);
for i = 1:N
    m_integrated(i) = trapz(m(1:i));
end
theta = 2 * pi * kf * m_integrated;

%% Generate the FM Signal
fc = 10000;
carrier = cos(2*pi*400*t);
modulated_carrier = cos(2*pi*fc*t + theta);
figure('Name','FM Signal');
plot(t, modulated_carrier)
xlabel('Time (msec)')
ylabel('Frequency Modulated m(t)')
title('kf = 1000');
ylim([-2,2])

%% Repeat for kf = 3000
kf_2 = 3000;
theta_2 = 2 * pi * kf_2 * m_integrated;
modulated_carrier_2 = cos(2*pi*fc*t + theta_2);
figure('Name','FM Signal');
plot(t, modulated_carrier_2)
xlabel('Time (msec)')
ylabel('Frequency Modulated m(t)')
title('kf = 3000');
ylim([-2,2])

%% Repeat for kf = 5000
kf_3 = 5000;
theta_3 = 2 * pi * kf_3 * m_integrated;
modulated_carrier_3 = cos(2*pi*fc*t + theta_3);
figure('Name','FM Signal');
plot(t, modulated_carrier_3)
xlabel('Time (msec)')
ylabel('Frequency Modulated m(t)')
title('kf = 5000');
ylim([-2,2])
