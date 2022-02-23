function [d_hat w]=MyNLMS(d,u,n,mu_tilla)
%#codegen 
if mu_tilla<=0
mutilla=0.1;
end
u=[zeros(1,n-1) u];
d_hat=zeros(1,size(u,2)-n+1);
error=zeros(1,size(u,2)-n+1);
w=zeros(1,n);           % coefficients
    for i=1:size(d_hat,2)
     d_hat(i)=u(i:i+n-1)*transpose(w);
     error(i)=d(i)-d_hat(i);
     mu=mu_tilla/(0.1+sum(u(i:i+n-1).*u(i:i+n-1)));
     w=w+mu*error(i)*u(i:i+n-1);
    end

end