%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: Latin_Sampling.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月17日 星期二 15时35分22秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[Error,Theta]= Latin_Sampling(M,scale,gf_con,texp,yexp,@rhs,tspan,y0,options)
%Latin_Sampling: Sample over the parameter space to find some 'good points' to start with.
%	Input:
%		M:		Devide number of the latin hypercube.
%		gf_con:	[gf] of different experiment group.
%		scale:	Specified value for each parameter.
%		texp:	time mesh for the experiment.
%		yexp:	varialbe value for the experiment.
%		@rhs et.al: Input for the forward solver.
%	Output:
%		Theta:	Sampled parameter value.
%		Error:	Error for each parameter value.
%	Inner parameter:
%		Max_sample:	Maximal sampling number.(some kind of early stop)
%		Max_step:	Maximal step number.
%		Step_sample:Number of latin queue in a certain latin hypercube.
	Max_sample=6000;
	Max_step=24;

	sample_number=1;
	number_theta=length(theta); 

% Each step we sample a latin hypercube. Then we may rescale the scale according to the error.
for step=1:Max_Step
%
	for i=1:M
		for j=1:number_theta
			latin_number(:,j)=randperm(M)';
		end
		theta=exp(-M/2+latin_number(i,:)+rand(1,18)).*scale;
		for k=Index
			theta(16)=gf_con(k);
			[t{k},result]=forward_solver(@rhs,tspan,y0,theta,options);
		end
		Error(sample_number)=Error_ODE2EXP(Index,t,result,texp,yexp)
	




	end
end





























