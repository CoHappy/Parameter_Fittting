%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: forward_solver.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月17日 星期二 10时30分35秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function[t,result] = forward_solver(@rhs,tspan,y0,theta,options)
%forward_solver: choose an ODE solver to solve the prolbem
%	input:
%		@rhs:	right hand site function .
%		tsapn:	time interval to solve in.
%		y0:		initial value of the variable.
%		theta:	parameter value.
%		option:	general options for the solver.
%	output: 
%		t:		time mesh 
%		result:	variable value with respect to time.

[t,result]=ode15s(@rhs,tspan,y0,options,theta);






















