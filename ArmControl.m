%% Connection for MATLAB/VREP in synchronous mode with Force/Torque Control
% Control Method for Robotics - 2016
% Copyright (c), Gabriel Lopes, Delft University of Technology, 2015
% Student Assistant, S. Tata Ramalingasetty

clear all;
clc;

%% Initialze Model Parameters:
InitParameters;

%% Initialze VREP Simulator:
InitSimulator;

%% Simulation Settings:

t = 0; % Time Varaible

dt = 5e-3; % Simulation Time Step (DO NOT CHANGE!!)

T = 15; % Simulation Time in Seconds

u=zeros(8,1); % Initialize the Input Vector

%% Gain for Controllers:

Kp = 1800; % Proportional Gain

Kd = 10; % Derivative Gain

%% Simulation Loop:

for (k = 1:T/dt)

   % The desired gripper position in time
   
   desiredEndEffectorPosition = [0.5*sin(t); 0.5*cos(t); 0];
    
   [q qd] = ReadSensorsFromSimulator(vrep, clientID, revJoints, EndEffector);
   
   [M C G J EndEffectorPosition] = ModelMatrices(q, qd, parameters, gravity, mass, inertias);
      
   %CONTROL LAW:
   
   u = -J'*(Kp*([0;0;0;EndEffectorPosition]-[0;0;0; desiredEndEffectorPosition ])) - Kd*qd' + G;

   WriteActuatorsToSimulator(vrep, clientID, revJoints, u, goalObject, desiredEndEffectorPosition,HandObject,EndEffectorPosition);
   
   t = t+dt; % Time Update
   
end


StopSimulator(vrep, clientID);

