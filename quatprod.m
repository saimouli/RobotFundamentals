% Function to multiply two quaternions
%%
function q1=quatprod(q,p)
    % All quaternions q, q1 and q2 are represented as 1-by-4 row vectors 
    q1=zeros(1,4);
    
    %q= q1 r= q2
    %%%%% your code starts here %%%%%
    q1(1)= q(1)*p(1)-q(2)*p(2)-q(3)*p(3)-q(4)*p(4);
    q1(2)= q(1)*p(2)+q(2)*p(1)+q(3)*p(4)-q(4)*p(3);
    q1(3)= q(1)*p(3)-q(2)*p(4)+q(3)*p(1)+q(4)*p(2);
    q1(4)= q(1)*p(4)+q(2)*p(3)-q(3)*p(2)+q(4)*p(1);
    
    %%%%% your code ends here %%%%%
    
end