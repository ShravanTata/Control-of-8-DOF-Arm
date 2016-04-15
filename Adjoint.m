% Copyright (c), Gabriel Lopes, Delft University of Technology, 2015
function m=Adjoint(H)

m=[H(1:3,1:3) zeros(3) ; skew3(H(1:3,4))*H(1:3,1:3) H(1:3,1:3)];