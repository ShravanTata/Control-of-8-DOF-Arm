% Copyright (c), Gabriel Lopes, Delft University of Technology, 2015
function m=inverseHomogeneous(H)

m=[ H(1:3,1:3)'   -H(1:3,1:3)'*H(1:3,4); 0 0 0 1];