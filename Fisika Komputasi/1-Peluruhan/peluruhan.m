clear %membersihkan data
clf %menghilangkan grafik
b=double(1000);%perhitungan batas akhir
h=0.01 %perhitungan interval waktu antar pias
n=b/h; %banyaknya iterasi
y(1)=1000; %nilai awal
x(1)=0; %waktu awal
tau=22.31; %nilai tau per tahun
for step=1:n
y(step+1)=y(step)-h*(y(step)/tau); %penyelesaian numerik peluruhan uranium menggunakan euler
x(step+1)=x(step)+h; %penambahan interval waktu.
end
t=0:h:b;
yanalitik=y(1)*exp(-t/tau); %perhitungan secara analitik
plot(x,y,'r',t,yanalitik,'b'); %plotting data hasil analitik dan numerik
grid on
xlabel('waktu (tahun)');
ylabel('Jumlah atom uranium 235 (jumlah atom)');
title('Grafik Peluruhan Uranium 235 terhadap waktu');