function [eigenvalue,eigenvector]=HW8_prob9(A)
    [row col]=size(A);
    if row~=col
        error('행렬A의 크기가 n x n 이 아닙니다.')
    end
    
    x=normalize(randn(row,1));
    L=transpose(x)*A*x;
    tol=10.^-6; ErrorValue=tol+1;
    while ErrorValue > tol
        if A-L*x==0 & transpose(x)*(x)-1==0
            break
        end
        J=[A-L*eye(row) -x; 2.*transpose(x) 0];
        b=[-A*x+L*x; -transpose(x)*x+1];
        t=HW8_prob7(J, b);
        ErrorValue=abs(t(row+1,1));
        
        x=t(1:row,1)+x;
        L=t(row+1,1)+L;
        
    end
    eigenvalue=L;
    eigenvector=x;
end
