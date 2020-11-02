% Memasukkan jumlah titik yang diacak
n=input('Jumlah titik acak = ');
% Mengacak n buah titik
x=rand(1,n);
y=rand(1,n);
% Menghitung jumlah titik 
% yang masuk daerah lingkaran
p=(y<(1-x.^2).^0.5);
m=sum(p);
% Menghitung dan menampilkan nilai pi
mpi=4*m/n;
fprintf('pi = %1.5f\n',mpi);
