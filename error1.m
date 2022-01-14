% These functions resolve the out of bounds error if the input battleMatrix
% by the user is out of bounds and also that each value is less than 5. We 
% use a conditionality statement to check out the bounds so that the matrix 
% size is less than 10


function output = error1(matrix,rowshot,colshot)
sz = size(matrix); % getting the size of the matrix
row = sz(1);
col = sz(2);

% checking the dimensions of the battleMatrix
if ((col~=10) || (row~=10))
    output = -99;
else
    flag = 0;
    check = 0:5;
    for i=1:row
      for j=1:col

          %Checking whether 100 mod of each value of matrix lies between 0-5 
          if(~(any(mod(matrix(i,j),100)==check)) || (matrix(i,j)<0))
              flag = 1;
              break;
          end
      if(flag == 1)
          break;
      end
      end
    end
    if (flag == 1)
        output = -99;
    else 
        output = 0;
    end
end
end