function [ M C G GlobalEndEffectorJacobian EndEffectorPosition] = ModelMatrices(q, qd, parameters, gravity, mass, inertias)

[M Gamma G J HLocal HGlobal]=ComputeModel(q',parameters,gravity,mass,inertias);


C = Coriolis(Gamma,qd);

% Extract griper position and Jacobian:
EndEffectorPosition=HGlobal(1:3,end);
    
EndEffectorJacobian=J(:,end-7:end);
    
% Compute the analytical Jacobian from the geometrical Jacobian:
for i=1:8
    GlobalEndEffectorJacobian(:,i)=UnTilde(Tilde(EndEffectorJacobian(:,i))*HGlobal(1:4,end-3:end));
end
    
 

end