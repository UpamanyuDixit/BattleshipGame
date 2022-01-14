% This function checks whether the shot coordinates are present on the battleMatrix or not. 
% It also checks whether the ship exists on the given coordinates or not and return a 
% corresponding value according to the given conditions. It also updates the value of 
% each square in the battleMatrix where the shot lands. 

function [output,matrix1] = error3(matrix,rowshot,colshot)
  check = 1:10;
  if(~(any(rowshot==check) && any(colshot==check))) % checks if dimensions of the shot lies on the battleMatrix or not
    output = -97;
  else
    shot = [];

     %check for shot on an empty square

    if(mod(matrix(rowshot,colshot),100) == 0) 
        shot = [shot 0];

        %check for shot on carrier ship

    elseif(mod(matrix(rowshot,colshot),100) == 1) 
        valid = 0;
        currenthundred = 0;
        hundredplus = 0;
        if(matrix(rowshot,colshot)>100)
            currenthundred = 1;
        end
        if((rowshot+1 <= 10) && (mod(matrix(rowshot+1,colshot),100) == 1))
            valid = valid + 1;
            if(matrix(rowshot+1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            for i = 2:4
                if((rowshot+i <= 10) && (mod(matrix(rowshot+i,colshot),100) == 1))
                    valid = valid + 1;
                    if(matrix(rowshot+i,colshot)>100)
                        hundredplus = hundredplus + 1;
                    end
                else
                    break;
                end
            end
        end
        if((valid < 4) && (rowshot-1 >= 1) && (mod(matrix(rowshot-1,colshot),100) == 1))
            valid = valid + 1;
            if(matrix(rowshot-1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            for i = 2:4
                if((rowshot-i >= 1) && (mod(matrix(rowshot-i,colshot),100) == 1))
                    valid = valid + 1;
                    if(matrix(rowshot-i,colshot)>100)
                        hundredplus = hundredplus + 1;
                    end
                else
                    break;
                end
            end
        end
        if(valid == 0)
            if((colshot+1 <= 10) && (mod(matrix(rowshot,colshot+1),100) == 1))
                valid = valid + 1;
                if(matrix(rowshot,colshot+1)>100)
                    hundredplus = hundredplus + 1;
                end
                for i = 2:4
                    if((colshot+i <= 10) && (mod(matrix(rowshot,colshot+i),100) == 1))
                        valid = valid + 1;
                        if(matrix(rowshot,colshot+i)>100)
                            hundredplus = hundredplus + 1;
                        end
                    else
                        break;
                    end
                end
            end
            if((valid < 4) && (colshot-1 >= 1) && (mod(matrix(rowshot,colshot-1),100) == 1))
                valid = valid + 1;
                if(matrix(rowshot,colshot-1)>100)
                    hundredplus = hundredplus + 1;
                end
                for i = 2:4
                    if((colshot-i >= 1) && (mod(matrix(rowshot,colshot-i),100) == 1))
                        valid = valid + 1;
                        if(matrix(rowshot,colshot-i)>100)
                            hundredplus = hundredplus + 1;
                        end
                    else
                        break;
                    end
                end
            end
        end
        if((currenthundred + hundredplus) > valid)
            shot = [shot 0];
        elseif( hundredplus == valid)
            shot = [shot 100+matrix(rowshot,colshot)];
        else
            shot = [shot mod(matrix(rowshot,colshot),100)];
        end

        %check for shot on battleship ship

    elseif(mod(matrix(rowshot,colshot),100) == 2) 
        valid = 0;
        currenthundred = 0;
        hundredplus = 0;
        if(matrix(rowshot,colshot)>100)
            currenthundred = 1;
        end
        if((rowshot+1 <= 10) && (mod(matrix(rowshot+1,colshot),100) == 2))
            valid = valid + 1;
            if(matrix(rowshot+1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            for i = 2:3
                if((rowshot+i <= 10) && (mod(matrix(rowshot+i,colshot),100) == 2))
                    valid = valid + 1;
                    if(matrix(rowshot+i,colshot)>100)
                        hundredplus = hundredplus + 1;
                    end
                else
                    break;
                end
            end
        end
        if((valid < 3) && (rowshot-1 >= 1) && (mod(matrix(rowshot-1,colshot),100) == 2))
            valid = valid + 1;
            if(matrix(rowshot-1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            for i = 2:3
                if((rowshot-i >= 1) && (mod(matrix(rowshot-i,colshot),100) == 2))
                    valid = valid + 1;
                    if(matrix(rowshot-i,colshot)>100)
                        hundredplus = hundredplus + 1;
                    end
                else
                    break;
                end
            end
        end
        if(valid == 0)
            if((colshot+1 <= 10) && (mod(matrix(rowshot,colshot+1),100) == 2))
                valid = valid + 1;
                if(matrix(rowshot,colshot+1)>100)
                    hundredplus = hundredplus + 1;
                end
                for i = 2:3
                    if((colshot+i <= 10) && (mod(matrix(rowshot,colshot+i),100) == 2))
                        valid = valid + 1;
                        if(matrix(rowshot,colshot+i)>100)
                            hundredplus = hundredplus + 1;
                        end
                    else
                        break;
                    end
                end
            end
            if((valid < 3) && (colshot-1 >= 1) && (mod(matrix(rowshot,colshot-1),100) == 2))
                valid = valid + 1;
                if(matrix(rowshot,colshot-1)>100)
                    hundredplus = hundredplus + 1;
                end
                for i = 2:3
                    if((colshot-i >= 1) && (mod(matrix(rowshot,colshot-i),100) == 2))
                        valid = valid + 1;
                        if(matrix(rowshot,colshot-i)>100)
                            hundredplus = hundredplus + 1;
                        end
                    else
                        break;
                    end
                end
            end
        end
        if((currenthundred + hundredplus) > valid)
            shot = [shot 0];
        elseif( hundredplus == valid)
            shot = [shot 100+matrix(rowshot,colshot)];
        else
            shot = [shot mod(matrix(rowshot,colshot),100)];
        end

        %check for shot on cruiser ship

     elseif(mod(matrix(rowshot,colshot),100) == 3) 
        valid = 0;
        currenthundred = 0;
        hundredplus = 0;
        if(matrix(rowshot,colshot)>100)
            currenthundred = 1;
        end
        if((rowshot+1 <= 10) && (mod(matrix(rowshot+1,colshot),100) == 3))
            valid = valid + 1;
            if(matrix(rowshot+1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            
            if((rowshot+2 <= 10) && (mod(matrix(rowshot+2,colshot),100) == 3))
                valid = valid + 1;
                if(matrix(rowshot+1,colshot)>100)
                    hundredplus = hundredplus + 1;
                end
            end
     
        end
        if((valid < 2) && (rowshot-1 >= 1) && (mod(matrix(rowshot-1,colshot),100) == 3))
            valid = valid + 1;
            if(matrix(rowshot-1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            
            if((rowshot-2 >= 1) && (mod(matrix(rowshot-2,colshot),100) == 3))
                valid = valid + 1;
                if(matrix(rowshot-2,colshot)>100)
                    hundredplus = hundredplus + 1;
                end
            end
            
        end
        if(valid == 0)
            if((colshot+1 <= 10) && (mod(matrix(rowshot,colshot+1),100) == 3))
                valid = valid + 1;
                if(matrix(rowshot,colshot+1)>100)
                    hundredplus = hundredplus + 1;
                end
                
                if((colshot+2 <= 10) && (mod(matrix(rowshot,colshot+2),100) == 3))
                    valid = valid + 1;
                    if(matrix(rowshot,colshot+2)>100)
                        hundredplus = hundredplus + 1;
                    end
              
                end
            end
            if((valid < 2) && (colshot-1 >= 1) && (mod(matrix(rowshot,colshot-1),100) == 3))
                valid = valid + 1;
                if(matrix(rowshot,colshot-1)>100)
                    hundredplus = hundredplus + 1;
                end
                
                if((colshot-2 >= 1) && (mod(matrix(rowshot,colshot-2),100) == 3))
                    valid = valid + 1;
                    if(matrix(rowshot,colshot-2)>100)
                        hundredplus = hundredplus + 1;
                    end
                end
            end
        end
        if((currenthundred + hundredplus) > valid)
            shot = [shot 0];
        elseif( hundredplus == valid)
            shot = [shot 100+matrix(rowshot,colshot)];
        else
            shot = [shot mod(matrix(rowshot,colshot),100)];
        end

        %check for shot on submarine ship

     elseif(mod(matrix(rowshot,colshot),100) == 4)
        valid = 0;
        currenthundred = 0;
        hundredplus = 0;
        if(matrix(rowshot,colshot)>100)
            currenthundred = 1;
        end
        if((rowshot+1 <= 10) && (mod(matrix(rowshot+1,colshot),100) == 4))
            valid = valid + 1;
            if(matrix(rowshot+1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            
            if((rowshot+2 <= 10) && (mod(matrix(rowshot+2,colshot),100) == 4))
                valid = valid + 1;
                if(matrix(rowshot+1,colshot)>100)
                    hundredplus = hundredplus + 1;
                end
            end
     
        end
        if((valid < 2) && (rowshot-1 >= 1) && (mod(matrix(rowshot-1,colshot),100) == 4))
            valid = valid + 1;
            if(matrix(rowshot-1,colshot)>100)
                hundredplus = hundredplus + 1;
            end
            
            if((rowshot-2 >= 1) && (mod(matrix(rowshot-2,colshot),100) == 4))
                valid = valid + 1;
                if(matrix(rowshot-2,colshot)>100)
                    hundredplus = hundredplus + 1;
                end
            end
            
        end
        if(valid == 0)
            if((colshot+1 <= 10) && (mod(matrix(rowshot,colshot+1),100) == 4))
                valid = valid + 1;
                if(matrix(rowshot,colshot+1)>100)
                    hundredplus = hundredplus + 1;
                end
                
                if((colshot+2 <= 10) && (mod(matrix(rowshot,colshot+2),100) == 4))
                    valid = valid + 1;
                    if(matrix(rowshot,colshot+2)>100)
                        hundredplus = hundredplus + 1;
                    end
              
                end
            end
            if((valid < 2) && (colshot-1 >= 1) && (mod(matrix(rowshot,colshot-1),100) == 4))
                valid = valid + 1;
                if(matrix(rowshot,colshot-1)>100)
                    hundredplus = hundredplus + 1;
                end
                
                if((colshot-2 >= 1) && (mod(matrix(rowshot,colshot-2),100) == 4))
                    valid = valid + 1;
                    if(matrix(rowshot,colshot-2)>100)
                        hundredplus = hundredplus + 1;
                    end
                end
            end
        end
        if((currenthundred + hundredplus) > valid)
            shot = [shot 0];
        elseif( hundredplus == valid)
            shot = [shot 100+matrix(rowshot,colshot)];
        else
            shot = [shot mod(matrix(rowshot,colshot),100)];
        end
    
        %check for shot on destroyer

    else 
        valid = 0;
        currenthundred = 0;
        hundredplus = 0;
        if(matrix(rowshot,colshot)>100)
            currenthundred = 1;
        end 
        if((rowshot+1 <= 10) && (mod(matrix(rowshot+1,colshot),100) == 5))
            valid = valid + 1;
            if(matrix(rowshot+1,colshot)>100)
                hundredplus = hundredplus + 1;
            end           
        elseif((rowshot-1 >= 0) && (mod(matrix(rowshot-1,colshot),100) == 5))
            valid = valid + 1;
            if(matrix(rowshot-1,colshot)>100)
                hundredplus = hundredplus + 1;
            end    
        elseif((colshot+1 <= 10) && (mod(matrix(rowshot,colshot+1),100) == 5))
            valid = valid + 1;
            if(matrix(rowshot,colshot+1)>100)
                hundredplus = hundredplus + 1;
            end           
        elseif((colshot-1 >= 0) && (mod(matrix(rowshot,colshot-1),100) == 5))
            valid = valid + 1;
            if(matrix(rowshot,colshot-1)>100)
                hundredplus = hundredplus + 1;
            end
        else 
            %empty
        end
        if((currenthundred + hundredplus) > valid)
            shot = [shot 0];
        elseif( hundredplus == valid)
            shot = [shot 100+matrix(rowshot,colshot)];
        else
            shot = [shot mod(matrix(rowshot,colshot),100)];
        end
    end
    matrix(rowshot,colshot)= 100 + matrix(rowshot,colshot);
    output = shot;
  end
  matrix1 = matrix;
end
