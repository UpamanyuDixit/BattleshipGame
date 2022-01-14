% This function checks the error of the correct orientation and size of the ships.
% Here we checked the placement row-wise and column-wise according to 
% the given category of the ship (carrier, destroyer, cruiser) and their 
% corresponding value( carrier=1, destroyer=5).

function output = error2(matrix,rowshot,colshot)
sz = size(matrix);
row = sz(1);
col = sz(2);
flag = 0;
for i = 1:row
    for j = 1:col
        matrix(i,j) = mod(matrix(i,j),100);
    end
end
for i = 1:row
    for j = 1:col

         %check for carrier

        if(matrix(i,j)==1) 
            if((i>6)&&(j>6))
                flag = 1;
            elseif((i<=6) && matrix(i+1,j)==1)
                for k = 2:4
                    if(~(matrix(i+k,j)==1))
                        flag = 1;
                        break;
                    end
                end
                if (flag == 0)
                    matrix(i:i+4,j) = -1;
                end
            elseif((j<=6) && matrix(i,j+1)==1)
                for k = 2:4
                    if(~(matrix(i,j+k)==1))
                        flag = 1;
                        break;
                    end
                end
                if (flag == 0)
                    matrix(i,j:j+4) = -1;
                end
            else
                flag = 1;
            end 
            %carrier checking ends

             %check for battleship

        elseif(matrix(i,j)==2) 
            if((i>7)&&(j>7))
                flag = 1;
            elseif( (i<=7) && matrix(i+1,j)==2)
                for k = 2:3
                    if(~(matrix(i+k,j)==2))
                        flag = 1;
                        break;
                    end
                end
                if (flag == 0)
                    matrix(i:i+3,j) = -1;
                end
            elseif((j<=7) && matrix(i,j+1)==2)
                for k = 2:3
                    if(~(matrix(i,j+k)==2))
                        flag = 1;
                        break;
                    end
                end
                if (flag == 0)
                    matrix(i,j:j+3) = -1;
                end
            else
                flag = 1;
            end 
            %battleship checking ends

             %check for cruiser

        elseif(matrix(i,j)==3) 
                if((i>8)&&(j>8))
                    flag = 1;
                elseif((i<=8) && matrix(i+1,j)==3)    
                    if(~(matrix(i+2,j)==3))
                        flag = 1;
                    end
                    if (flag == 0)
                        matrix(i:i+2,j) = -1;
                    end
                elseif((j<=8) && matrix(i,j+1)==3)                    
                    if(~(matrix(i,j+2)==3))
                        flag = 1;                      
                    end                   
                    if (flag == 0)
                        matrix(i,j:j+2) = -1;
                    end
                else
                    flag = 1;
                end 
                %cruiser checking ends

                 %check for submarine
                 
        elseif(matrix(i,j)==4) %check for submarine
                if((i>8)&&(j>8))
                    flag = 1;
                elseif((i<=8) && matrix(i+1,j)==4)    
                    if(~(matrix(i+2,j)==4))
                        flag = 1;
                    end
                    if (flag == 0)
                        matrix(i:i+2,j) = -1;
                    end
                elseif((j<=8) && matrix(i,j+1)==4)                    
                    if(~(matrix(i,j+2)==4))
                        flag = 1;                      
                    end                   
                    if (flag == 0)
                        matrix(i,j:j+2) = -1;
                    end
                else
                    flag = 1;
                end 
                %submarine checking ends
           
                 %check for destroyer 
        elseif (matrix(i,j)==5)  
            if((i>9)&&(j>9))
                    flag = 1;
            elseif((j<=9)&&(matrix(i,j+1)==5))
                    matrix(i,j:j+1) = -1;
            elseif((i<=9)&&(matrix(i+1,j)==5))
                    matrix(i:i+1,j) = -1;
            else 
                    flag = 1;
            end
            %destroyer checking ends

        else
            flag = 0;
        end
        if(flag == 1)
            break;
        end
    end
    if(flag == 1)
        break;
    end
end
if(flag == 1)
    output = -98;
else
    output = 0;
end 
end
