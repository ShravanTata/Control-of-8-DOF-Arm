% Copyright (c), Gabriel Lopes, Delft University of Technology, 2015
function m=dAdjoint(H,Hd)

m=[Hd(1:3,1:3) zeros(3) ; (skew3(Hd(1:3,4))*H(1:3,1:3)+skew3(H(1:3,4))*Hd(1:3,1:3)) Hd(1:3,1:3)];