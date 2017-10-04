%Input arguments:
%                A=toeplitz([1 2 3 4 5 6])
function [L,U,P] = my_lu(A)
n=max(size(A));
U=zeros(n);
L=zeros(n);
P=eye(n);
for i=1:n
    [maximum,index]=max(A); 
    A([index(i) i],:) = A([i index(i)],:);
    P([index(i) i],:) = P([i index(i)],:);
    L([index(i) i],:) = L([i index(i)],:);
    L(:,i)=A(:,i)/maximum(i);
    U(i,:)=(A(i,:));
    A=A-L(:,i)*U(i,:);
end
end

