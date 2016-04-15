% Copyright (c), Gabriel Lopes, Delft University of Technology, 2015

% Lengths of each of the arm's segments
parameters = [.05 .05 0.125 0.125 .05 .05 0.125 0.125 .05 .05 0.125 0.125 .05 .05 0.125];

gravity=9.810; % Gravity in the system

mass=[1 5 1 5 1 5 1 2.5]; % Masses of individual links in Kg


% Principle Moment of Inertias of the Links ([Ixx Iyy Izz])

Link1 = diag([0.00333,0.00333,0.00333]);
Link2 = diag([0.0125,0.0075,0.0125]);
Link3 = diag([0.00333,0.00333,0.00333]);
Link4 = diag([0.0125,0.0075,0.0125]);
Link5 = diag([0.00333,0.00333,0.00333]);
Link6 = diag([0.0125,0.0075,0.0125]);
Link7 = diag([0.00333,0.00333,0.00333]);
Link8 = diag([0.01667,0.00333,0.004167]);

% Generate the Inertia Matrix

inertias=[ [Link1*eye(3) zeros(3,3); zeros(3,3) mass(1)*eye(3)] ...
 [Link2*eye(3) zeros(3,3); zeros(3,3) mass(2)*eye(3)] ...
 [Link3*eye(3) zeros(3,3); zeros(3,3) mass(3)*eye(3)] ...
 [Link4*eye(3) zeros(3,3); zeros(3,3) mass(4)*eye(3)] ...
 [Link5*eye(3) zeros(3,3); zeros(3,3) mass(5)*eye(3)] ...
 [Link6*eye(3) zeros(3,3); zeros(3,3) mass(6)*eye(3)] ...
 [Link7*eye(3) zeros(3,3); zeros(3,3) mass(7)*eye(3)] ...
 [Link8*eye(3) zeros(3,3); zeros(3,3) mass(8)*eye(3)] ...
];