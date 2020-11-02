clear %membersihkan layar
clf %membersihkan gambar
a=0; %waktu awal (sekon)
b=100; %waktu akhir (batas waktu akhir)
lp=2; %luas permukaan cross section (m^2)
n=3000; %membagi iterasi menjadi 3000 pias
h=(b-a)/n %nilai interval pias
c=0.5; %koefisien drag
m=75; %massa manusia+sepeda (kg)
t(1)=0;%waktu awal (sekon)
p=400; %daya(watt)
rho=1.2; %(kg/m^3)
y(1)=3; %kecepatan awal (m/s)
x(1)=0; %waktu awal
for step=1:n
y(step+1)=y(step)+h*((p/(m*y(step)))-(c*rho*lp*y(step)*y(step)/m)); %persamaan euler untuk menyelesaikan PDB
x(step+1)=x(step)+h; %menambah step waktu
end
plot(x,y,'r'); %plotting data
grid on
xlabel('waktu (sekon)');
ylabel('kecepatan(m/s)');
title('Grafik kecepatan terhadap waktu');