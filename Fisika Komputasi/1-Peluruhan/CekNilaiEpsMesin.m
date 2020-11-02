clear
epsi=epsilonmesin(1); %mengambil nilai epsilon mesin dari fungsi
n=20; %membagi perhitungan menjadi 20 pias
lpias(1)=100; %mengisi array lpias pertama dengan nilai 100
h=0.1 %mengisikan pengali sebesar 0.1
for step=1:n
err(step+1)=(epsi/lpias(step))+lpias(step); %perhitungan iterasi untuk pencarian error
lpias(step+1)=lpias(step)*h; %memperbesar lebar pias
end
loglog(lpias,err,'b') %plotting data secara logaritmik
title('Grafik Error terhadap Lebar pias')
xlabel('lebar pias')
ylabel('besar error')