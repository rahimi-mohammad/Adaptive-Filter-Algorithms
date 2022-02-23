% ------------------------------------------------------------------------ 
%  Copyright (C)
%  mrahimi7755 - Sharif University of Technology, Iran
% ------------------------------------------------------------------------
% myLMS.m - least mean squares algorithm
%
% Inputs:
% d  - the vector of desired signal samples of size ,
% u  - the vector of input signal samples of size ,
% n  - the number of taps, 
% mu - the stepsize parameter.

%
% Outputs:
% w  - filter coefficients,
% d_hat - filter output(estimation of the output).


function [d_hat, w]=myLMS(d,u,n,mu)
    u=[zeros(1,n-1) u];
    d_hat=zeros(1,size(u,2)-n+1);
    error=zeros(1,size(u,2)-n+1);
    w=zeros(1,n);           % coefficients
        for i=1:size(d_hat,2)
         d_hat(i)=u(i:i+n-1)*transpose(w);
         error(i)=d(i)-d_hat(i);
         w=w+mu*error(i)*u(i:i+n-1);
        end

end