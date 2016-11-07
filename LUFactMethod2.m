%__________________________________________________________________
%                        Problem 1
%__________________________________________________________________


myMatrix = [ 1 2 3 4 5 6; 2 1 2 3 4 5;3 2 1 2 3 4; 4 3 2 1 2 3; 5 4 3 2 1 2; 6 5 4 3 2 1 ];

num = size(myMatrix,1);
fullM = cell(num+1,1);
lM = cell(num,1);
rM = cell(num,1);
fullM{1} = myMatrix;
zeroMat = zeros(num);

for i = 1:num
    if isequal(zeroMat,fullM{i});
        break
    end
    tempMatrix = fullM{i};
    pivot = tempMatrix(i,i);
    %catch a fatal error and print what i have so far
    if pivot == 0;
        lMatrix = lM{1};
        rMatrix = rM{1};
             for j = 1:i
                if j ~= 1
                    lMatrix = horzcat(lMatrix,lM{j});
                    rMatrix = vertcat(rMatrix,rM{j});
                end
             end
        disp('Your l matrix is:'); %for debugging
        lMatrix;
        disp('Your u matrix is:');
        rMatrix;
        error('Error 0 in denominator for step: %d of the first for loop. Above is as far as you can go', i)
    end
    tempL = tempMatrix(:,i);
    tempR = tempMatrix(i,:);
    for j = 1:num
        temp = tempL(j);
        temp = temp/pivot;
        tempL(j)=temp;
    end
    rM{i} = tempR;
    lM{i} = tempL;
    tempA = tempL*tempR;
    fullM{i+1} = tempMatrix - tempA;
end
%l and u for loop, i dont know matlab lol
lMatrix = lM{1};
rMatrix = rM{1};
%makes new matrixes out of parts of L & R
for j = 1:i
    if j ~= 1
        lMatrix = horzcat(lMatrix,lM{j});
        rMatrix = vertcat(rMatrix,rM{j});
    end
end
disp('L matrix: ')
disp(lMatrix)
disp('U matrix: ')
disp(rMatrix)
testMatrix = lMatrix*rMatrix %tests if L dot U is the og matrix
%__________________________________________________________________
%                       Problem 2
%__________________________________________________________________



points = [-0.1; 0; 0.2; 0.3];
values = [5.3;2.0;3.19;1];
%Fucntion form would be: function d = dd(points,values)
if length(points) ~= length(values) %Catch an inconsistency in input
 error('There must be an equal amount of points and values')
end
size = length(points); %initialization of dd matrix
DD = zeros(size, size);
DD(:, 1) = values; % reads through values and places them in first col
    for i = 2:size
        for j = 1 : (size - i + 1)
            DD(j,i) = (DD(j + 1, i - 1) - DD(j, i - 1)) / (points(j + i - 1) - points(j));
        end
    end
    
disp('______________________________________________________________')
disp('The table of coef is:')
disp(DD)


    
    


