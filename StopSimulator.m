function StopSimulator(vrep, clientID)

%% Stop simulation and Clean up the connection:

% Stop the simulation on VREP:
vrep.simxStopSimulation(clientID, vrep.simx_opmode_oneshot_wait);

% Close the connection to VREP:
vrep.simxFinish(clientID);

%Call the destructor and destroy the vrep object:
vrep.delete();

disp('Program Ended');
vrep.simxFinish(clientID);

end