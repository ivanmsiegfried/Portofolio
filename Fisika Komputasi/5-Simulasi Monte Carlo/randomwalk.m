% Memasukkan jumlah iterasi
n=input('Jumlah iterasi = ');
% Pengacakan nilai awal
x=rand;
y=x*exp(-2*x);
% Random walk dengan n iterasi
for iterasi=1:n
    x1=rand;
    y1=x1*exp(-2*x1);
    if y1>y
        x=x1;
        y=y1;
    end
end
% Hasil
fprintf('Iterasi %d : ',n);
fprintf('Nilai maksimum %1.3f ',y);
fprintf('terjadi di x = %1.3f\n',x);
