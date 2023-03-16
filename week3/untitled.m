%% Gauss elimination
% MA(=U), Mb
function [x, LU]=Gauss_elimination(A, b)
    [A_row, A_col]=size(A);
    [b_row , ~]=size(b);
    n=length(A);
    if A_row ~= A_col
        error('행렬A의 크기가 n x n 이 아닙니다.')
    end

    if b_row ~= A_col
        error('행렬A의 크기와 벡터 b의 크기가 일치하지 않습니다.')
    end
    
    for k = 1:(n-1)
        if A(k,k) == 0
            break;
        end
        M_{k}=eye(n); 
        for i = k+1: n
            M_{k}(i,k) = -A(i,k)/A(k,k);
        end
        A=M_{k}*A;
    end
    U=A;
    M=eye(n);
    for k=1:(n-1)
        M=M_{k}*M;
    end
    L=inv(M);
    LU=L*U;
    c=forward_substitution(L,b,n);
    x=back_substitution(U,c,n);
end

function x=forward_substitution(A,b,n)
    
    for j = 1:n
        if A(j,j) == 0
            break;
        end
        x(j,1) = b(j,1)/A(j,j);
        for i=j+1:n
            b(i,1)=b(i,1)-A(i,j)*x(j,1);
        end        
    end
end

function x=back_substitution(A,b,n)  
    for j = n:-1:1
        if A(j,j) == 0
            break;
        end
        x(j,1) = b(j,1)/A(j,j);
        for i=1:(j-1)
            b(i,1)=b(i,1)-A(i,j)*x(j,1);
        end        
    end
end
