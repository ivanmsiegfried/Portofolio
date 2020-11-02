clear;
ke=50;
%Posisi Gelombang Sumber
ks=ke/2;
%nilai time step maksimum
nsteps=200;
%Parameter dan juga lebar pias domain ruang dan waktu
c0=3.e8;
dx=0.01;
dt=dx/(2.*c0);
%penyederhanaan konstanta
cc=c0*dt/dx;
%inisialisasi vektor awal
ex=zeros(1,ke);
hy=zeros(1,ke);
%parameter pulsa gaussian
t0=20;
spread=8;
%memulai loop untuk domain waktu
M=moviein(nsteps);
for t=1:nsteps
% looping untuk governing equation medan E
for k=2:ke-1
ex(k)=ex(k)+cc*(hy(k-1)-hy(k));
end
%gelombang EM sumber
ex(ks)=exp(-.5*((t-t0)/spread)^2);
% looping untuk governing equation medan H
for k=1:ke-1
hy(k)=hy(k)+cc*(ex(k)-ex(k+1));
end
%Plotting gelombang Ex atau Hy
plot(ex);axis([1 ke -2 2]); %Plotting Ex
M(:,t) = getframe ;
end
