% Copyright (c), Gabriel Lopes, Delft University of Technology, 2015
function c = Coriolis(gamma,qd)

for i=1:length(qd)
    c(i)=0;
    for j=1:length(qd)
        for k=1:length(qd)
            c(i)=c(i)+gamma(i,k,j)*qd(j)*qd(k);
        end
    end
end
