function x=HW8_prob8(A,b)
    u=[0; 0; 1];
    v=[0; 2; 0];
    x=inv(A-u*v.')*b;
end