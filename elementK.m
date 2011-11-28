function k = elementK(A,E,L,I)

kbeam = E*I/L^3;

k = zeros(4,4);

k(1,1) = 12;
k(3,3) = 12;
k(1,3) = -12;
k(3,1) = -12;

k(1,[2 4]) = 6*L;
k([2 4],1) = 6*L;
k([2 4],3) = -6*L;
k(3,[2 4]) = -6*L;

k(2,2) = 4*L^2;
k(4,4) = 4*L^2;

k(2,4) = 2*L^2;
k(4,2) = 2*L^2;

k = k*kbeam;

return;
