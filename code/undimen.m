%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: undimen.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年08月01日 星期三 19时48分06秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[result]=undimen(theta,time,conc)
%	undimen: used to apply undimensionalization.
%	Input:
%		theta:	original theta;
%		time:	time multiple number.
%		conc:	conc multiple number.
%	Output:
%		result:	results after undimensionalization.

	result=theta;
	for i=[1:6,8,10,11,13,15]
		result(i)=result(i)*time;
	end
	for i=[6:9,11:14,17:18]
		result(i)=result(i)/conc;
	end

