%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: Error_theta.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年08月02日 星期四 10时44分04秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[ret,info]=Error_theta(theta,texp,yexp,rhs,tspan,y0,options,group_index,gf_con,visual)
% Error_theta: calculate the error respect to theta only.
%   Input:
%       theta:  parameter.
%       remain: same as in other function.
%   Output:
%       ret:    error.

    ret=0;
    info=1;
for k=group_index
			theta(16)=gf_con(k);
			[t{k},result]=forward_solver(rhs,tspan,y0,theta,options);
% Estimate the error under this certain parameter.
            y{k}=result(:,5)+result(:,6);
			ret=ret+Error_ODE2EXP(t{k},y{k},texp{k},yexp{k},tspan);
            [num_crit,~]=Locate_crit(t{k},y{k},tspan);
            if(k==4&&num_crit<3)
                info=0;
            end
end
    visualize(t,y,texp,yexp,group_index,visual);