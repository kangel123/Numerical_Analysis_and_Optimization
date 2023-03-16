x = []
for j =n:1
    
    x(j,1) = b(j,1)/A(j,j)
    for i=1:(j-1)
        b(i,1)=b(i,1)-A(i,j)*x(j,1)
    end
        
end