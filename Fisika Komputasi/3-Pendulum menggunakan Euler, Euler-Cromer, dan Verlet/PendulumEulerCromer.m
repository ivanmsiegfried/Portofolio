clear 
clf
ptali=1.5; % panjang tali (meter)
g=9.8; %percepatan gravitasi (m/s^2)
n=300; %banyaknya pias
h=0.04; %lebar pias
b=n*h; %waktu akhir (sekon)
teta(1)=0; %simpangan sudut
omega(1)=0.3; %kevecepatan sudut
 
x(1)=0; %domain waktu
 
for i=1:n+1
    omega(i+1)=omega(i)-((g/ptali)*teta(i)*h); %perhitungan numerik menggunakan euler cromer
    teta(i+1)=teta(i)+omega(i+1)*h;
    x(i+1)=x(i)+h;
end
 
t=0:h:b; %domain waktu
yanalitik=0.1*sin(sqrt(g/ptali)*t); %perhitungan simpangan menggunakan fungsi analitik
 
plot(x,teta,'b',t,yanalitik,'r')
title('Grafik simpangan terhadap waktu');
xlabel('waktu (sekon)');
ylabel('simpangan (meter)');
