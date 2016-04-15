function WriteActuatorsToSimulator(vrep, clientID, revJoints, u , goalObject, xd , HandObject, x)    

% Write the control input to VREP Model:
    
    for j = 1 : 8
        % Set the Joint Force from the input computed using the above model
        vrep.simxSetJointForce(clientID, revJoints(j), abs(u(j)), vrep.simx_opmode_oneshot); 
        % Set arbitrary high velocity to apply maximum torque on the joint
        vrep.simxSetJointTargetVelocity(clientID, revJoints(j), 1*sign(u(j))*10, vrep.simx_opmode_oneshot); 
    end

    
    vrep.simxSetObjectPosition(clientID,goalObject,-1,xd,vrep.simx_opmode_oneshot);
    
    vrep.simxSetObjectPosition(clientID,HandObject,-1,x,vrep.simx_opmode_oneshot);
    
    % Synchronous Trigger to read the values from VREP:
    % Synchronous Trigger to update simulation time by dt (dt = 5ms)
    vrep.simxSynchronousTrigger(clientID);
    % Check to wait till the computations on VREP are completed
    vrep.simxGetPingTime(clientID); 
    
end