%% Establishing connection between MATLAB and VREP:

disp('Program Started');

vrep = remApi('remoteApi'); % Create an object named vrep for remoteApi

vrep.simxFinish(-1); % Just to make sure that all connections with VREP are 
% closed

clientID = vrep.simxStart('127.0.0.1',19997,true, true, 5000,5); % Start the
% connection with debug and synchronous mode set to true.


% Check for Valid Connection
if (clientID > -1)
    
    disp('Connected to remote API server');
    
else 
        
    disp('Failed connecting to remote API server');

    close;
end

t = 0; % Time

dt = 5e-3; % Sampling Time

T = 7.5; % Simulation Time in Seconds

vrep.simxSynchronous(clientID, true); %Set-up synchronous communication on 
% the client side

vrep.simxStartSimulation(clientID, vrep.simx_opmode_oneshot_wait); % Start 
% the simulation

% Retrieve all Joint Handles:

[res revJoints(1)] = vrep.simxGetObjectHandle(clientID, 'Joint1', vrep.simx_opmode_oneshot_wait);
[res revJoints(2)] = vrep.simxGetObjectHandle(clientID, 'Joint2', vrep.simx_opmode_oneshot_wait);
[res revJoints(3)] = vrep.simxGetObjectHandle(clientID, 'Joint3', vrep.simx_opmode_oneshot_wait);
[res revJoints(4)] = vrep.simxGetObjectHandle(clientID, 'Joint4', vrep.simx_opmode_oneshot_wait);
[res revJoints(5)] = vrep.simxGetObjectHandle(clientID, 'Joint5', vrep.simx_opmode_oneshot_wait);
[res revJoints(6)] = vrep.simxGetObjectHandle(clientID, 'Joint6', vrep.simx_opmode_oneshot_wait);
[res revJoints(7)] = vrep.simxGetObjectHandle(clientID, 'Joint7', vrep.simx_opmode_oneshot_wait);
[res revJoints(8)] = vrep.simxGetObjectHandle(clientID, 'Joint8', vrep.simx_opmode_oneshot_wait);

% Retrieve End Effector Object Handle :

[res EndEffector] = vrep.simxGetObjectHandle(clientID, 'Link8', vrep.simx_opmode_oneshot_wait);

% Retrieve Desired and End Object Handle for Visualization:

[res goalObject] = vrep.simxGetObjectHandle(clientID, 'Goal', vrep.simx_opmode_oneshot_wait);

[res HandObject] = vrep.simxGetObjectHandle(clientID, 'EndEffector', vrep.simx_opmode_oneshot_wait);


% Initiaze variables to save information from VREP:

for j = 1:8

[ret q(1,j)] = vrep.simxGetJointPosition(clientID, revJoints(j), vrep.simx_opmode_streaming); % Joint Position
 
[ret tau(1,j)] = vrep.simxGetJointForce(clientID, revJoints(j), vrep.simx_opmode_streaming); % Joint Force

[ret qd(1,j)] = vrep.simxGetObjectFloatParameter(clientID, revJoints(j), 2012, vrep.simx_opmode_streaming); % Joint Velcoity

end

[ret EndPos(1,:)] = vrep.simxGetObjectPosition(clientID,EndEffector, -1,vrep.simx_opmode_streaming); % End Effector Position



