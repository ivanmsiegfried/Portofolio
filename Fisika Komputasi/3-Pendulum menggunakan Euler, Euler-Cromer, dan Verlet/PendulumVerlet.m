clear 
clf
h=0.04;              %lebar pias
l=1.5;           %panjang tali
m=1.2;               %massa tali
v(1)=2;             %kecepatan awal
g=9.8;              %percepatan gravitasi
t0=0;             %waktu awal diketahui
x(1)=2;            %nilai simpangan awal
x(2)=x(1)+v(1)*h;    %nilai untuk waktu sama dengan h   
t=t0:h:50;  
n=length(t); %banyaknya pias
for i=3:n
   %iterasi menggunakan perumusan verlet
    x(i)=2.0*x(i-1)-x(i-2)+h*h*(-1*g/l)*x(i-1);
    v(i-1)=(x(i)-x(i-2))/(2*h);
end
x_an=x(1)*cos(sqrt(g/l)*t);   %kecepatan akhir
t2=t0:h:50; 
plot(t,x,'b',t2,x_an,'r')  ;          %plot grafik
title('Grafik simpangan terhadap waktu');
xlabel('waktu (sekon)');
ylabel('simpangan (meter)');
