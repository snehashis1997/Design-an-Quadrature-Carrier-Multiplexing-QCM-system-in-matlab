fs=2000;
fm=4;
tiv=1/fs;
t=0:tiv:1;
fmc=50;

A=2;
m1=A*cos(2*pi*fm*t);
% m1=awgn(m1,.30);%adding awgn in messege signal 1
m2=A*cos(2*pi*5*t);

c1=A*cos(2*pi*fmc*t);
c2=-A*sin(2*pi*fmc*t);
mod1=m1.*c1;
mod2=m2.*c2;
op=mod1+mod2;

l1=2*A*cos(2*pi*fmc*t).*op;
l2=2*A*sin(2*pi*fmc*t).*op;

[num,den]=butter(5,4*fm/fs);

fil1=filter(num,den,l1);
fil2=filter(num,den,l2);

n=length(op);
f=fs*[-n/2+1:n/2]/n;
fou=fftshift(fft(op,n));
mod1=fftshift(fft(mod1,n));
mod2=fftshift(fft(mod2,n));
l1=fftshift(fft(l1,n));
l2=fftshift(fft(l2,n));



subplot(3,3,1);
plot(t,m1);
title('messege signal 1');
grid on;

subplot(3,3,2);
plot(t,m2);title('messege signal 2');
grid on;

subplot(3,3,3);
plot(t,c1);title('carrier signal 1');
grid on;

subplot(3,3,4);
plot(t,c2);title('carrier signal 2');
grid on;

subplot(3,3,5);
plot(t,op);title('output signal');
grid on;

subplot(3,3,6);
plot(t,fil1);title('filter1 output');
grid on;

subplot(3,3,7);
plot(t,fil2);title('filter2 output');
grid on;

figure;
subplot(2,2,1);
plot(f,abs(fou));title('output of qcm');grid on;
subplot(2,2,2);
plot(f,abs(l1));title('signal before lpf1');grid on;
subplot(2,2,3);
plot(f,abs(l2));title('signal before lpf2');grid on;




















