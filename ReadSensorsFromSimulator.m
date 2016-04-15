function [q qd EndPos] = ReadSensorsFromSimulator(vrep, clientID, revJoints, EndEffector)    

% Pre-initialize arrays:

q = zeros(1,8); % Joint Angles
qd = zeros(1,8); % Joint Velocities
tau = zeros(1,8); % Joint Torques

for j = 1:8
    
% Get Joint Angle
[ret q(j)] = vrep.simxGetJointPosition(clientID, revJoints(j), vrep.simx_opmode_buffer); 
% Get Joint Force/Torque
[ret tau(j)] = vrep.simxGetJointForce(clientID, revJoints(j), vrep.simx_opmode_buffer); 
% Get Joint Angular Velocity
[ret qd(j)] = vrep.simxGetObjectFloatParameter(clientID, revJoints(j), 2012, vrep.simx_opmode_buffer);
        
end
    
% Get End Effector position in Global Frame
[ret EndPos] = vrep.simxGetObjectPosition(clientID,EndEffector, -1,vrep.simx_opmode_buffer);
    
end