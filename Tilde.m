% Copyright (c), Gabriel Lopes, Delft University of Technology, 2015
function m=Tilde(r)

m=[[skew3([r(1) r(2) r(3)]) [r(4); r(5); r(6)]] ; 0 0 0 0];