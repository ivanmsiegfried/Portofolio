function epsi=epsilonmesin(a)
epsi=double(1); %mengisikan nilai satu bertipe data double ke dalam variabel epsi
while epsi+1>1 %ketika nilai epsi+1 lebih besar dari satu, maka iterasi akan terus berjalan
epsi=epsi/2; %membagi nilai epsi terus menerus hingga nilai terkecil yang bisa dikandung
end
epsi=epsi*2 %mengalikan nilai epsi dikali dua untuk dihasilkan nilai terkecil.