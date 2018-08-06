%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: Error_ODE2EXP.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月17日 星期二 20时51分46秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[ret]=Error_ODE2EXP(t,result,texp,yexp,tspan)
%Error_ODE2EXP: Error between the ODE simulated result and the experiment data.
%	Input:
%		t:		time mesh of the ODE.
%		result:	Variable value with respect to the mesh t.
%		texp:	time mesh of the experiment.
%		yexp:	Varialbe value with respect to the mesh texp.
%		tspan:	Interval for calculating the error.
%	Output:
%		ret:	the value of error function.

	ret=0;
	tstart=tspan(1);
	tend=tspan(2);
% Find the experiment time mesh that is in the interval.
	Index=find(texp<=tend & texp>=tstart);
	
	texp=texp(Index);
	yexp=yexp(Index);
% Interp the ODE result in the above mesh.
	yode=interp1(t,result,texp,'spline');

	for i=1:length(texp)-1
		ret=ret+(texp(i+1)-texp(i))*(yode(i)-yexp(i))^2;
	end

	return ;













