function [outcome, battleMatrix] =battleshipShotCheck(battleMatrix, rowShot, colShot)
%  BATTLESHIPSHOTCHECK Battleship game shot checker
% [outcome, battleMatrix] =BATTLESHIPSHOTCHECK(battleMatrix, rowShot, colShot)  It is a function used for checking the outcome of shot fired by the enemy on users Battleship Matrix and also returns updated battleMatrix. This function also checks if there is an error in the input battleMatrix, rowShot and colShot. 
%
% outcome= Its is the outcome of the shot fired on the ship returning a value equal to the point scored by that shot hitting a ship.
% battleMatrix= It is the matrix defining the initial layout of the battle map of the user. In successful iterations, the battle matrix will be updated to the score gained if a shot lands on the given coordinates. 
%
% Example 1: 
% For a battle Matrix = [0 0 2 0 0 0 0 0 0 0;
%                        0 0 2 0 3 0 0 0 0 0; 
%                        0 0 2 0 3 0 0 0 0 0; 
%                        0 0 2 0 3 0 1 0 0 0; 
%                        0 0 0 0 0 0 1 0 0 0; 
%                        0 0 0 0 0 0 1 0 0 0; 
%                        0 0 0 0 0 0 1 0 0 0; 
%                        5 0 0 0 0 0 1 0 0 0; 
%                        5 0 0 0 0 4 4 4 0 0; 
%                        0 0 0 0 0 0 0 0 0 0 ]
%
% [outcome, battleMatrix] =BATTLESHIPSHOTCHECK(battleMatrix, 4, 7); 
% outcome = 1
% battleMatrix =[0 0 2 0 0 0 0 0 0 0;
%                0 0 2 0 3 0 0 0 0 0; 
%                0 0 2 0 3 0 0 0 0 0; 
%                0 0 2 0 3 0 101 0 0 0; 
%                0 0 0 0 0 0 1 0 0 0; 
%                0 0 0 0 0 0 1 0 0 0; 
%                0 0 0 0 0 0 1 0 0 0; 
%                5 0 0 0 0 0 1 0 0 0; 
%                5 0 0 0 0 4 4 4 0 0; 
%                0 0 0 0 0 0 0 0 0 0 ]
% 
% outcome values
% 0= shot does not strike a ship or if the ship is already sunk
% 1= shot strikes a "carrier" ship
% 2= shot strikes a "battleship" ship
% 3= shot strikes a "cruiser" ship
% 4= shot strikes a "submarine" ship
% 5= shot strikes a "destroyer" ship
%
% 100 + above values = If the ship has completely sunk.
%
% For example
%
% A shot that sinks a battleship should return 102. 
% A shot that sinks a destroyer should return 105.
%
% Error
%
% -99 = battleMatrix out of proportion
% -98 = battleMatrix contains one or more undefined values
% -97 = shot coordinates are not on the battleMatrix


    if(error1(battleMatrix,rowShot,colShot) ~= 0) % calling error1 function
        outcome = error1(battleMatrix,1,1);
    elseif(error2(battleMatrix,rowShot,colShot) ~= 0) % calling error2 function
        outcome = error2(battleMatrix,1,1);
    else
        [outcome , battleMatrix] = error3(battleMatrix,rowShot,colShot); % calling error3 function
    end
end