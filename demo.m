% Hello this project is part of MATLAB Hackathon 2022
% Developed by 19BEC006 (Harsh Ahuja), 19BEC034 (Gaurang Maheshwari)
%              19BEC140(Upamanyu Dixit). 
% Please input your matrix as X variable; you can use predifined user
% matrix Y and Z if you want. 

% Y= [0 0 1 1 1 1 1 0 2 0;
%     0 0 0 0 0 0 0 0 2 0;
%     0 0 3 3 3 0 0 0 2 0;
%     0 0 0 0 0 0 0 0 2 0;
%     0 0 0 0 0 0 0 0 0 0;
%     0 0 4 0 0 0 0 0 0 0;
%     0 0 4 0 0 0 0 0 0 0;
%     0 0 4 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0;]
% 
% Z= [0 0 1 1 1 1 1 0 2 0;
%     0 0 0 0 0 0 0 0 2 0;
%     0 0 3 3 3 0 0 0 2 0;
%     0 0 0 4 0 0 0 0 2 0;
%     0 0 0 4 0 0 0 0 0 0;
%     0 0 0 4 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 0 0 0;]

% here x is an user given Matrix 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; 
clear all;
close all;
x= [0 0 1 1 1 1 1 0 2 0;
    0 0 0 0 0 0 0 0 2 0;
    0 0 3 3 3 0 0 0 2 0;
    0 0 4 4 4 0 0 0 2 0;
    0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 5 5]; 
history = [];


num = input('Enter the number of shots you want to take : ');
for i = 1:num
    rowshot = input('Enter rowshot : ');
    colshot = input('Enter colshot : ');
    [outcome, x] = battleshipShotCheck(x,rowshot,colshot);
    outcome
    history = [history; rowshot colshot outcome];
    if((outcome==-99)||(outcome==-98))
        break;
    end
end
history




