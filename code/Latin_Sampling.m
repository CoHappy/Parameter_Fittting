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
%		texp:	time mesh for the experiment(cell type contain data of different group).
%		yexp:	varialbe value for the experiment(the same above).
%		@rhs et.al: Input for the forward solver.
%	Output:
%		Theta:	Sampled parameter value.
%		Error:	Error for each parameter value.
%	Inner parameter:
%		Max_sample:	Maximal sampling number.(some kind of early stop)
%		Max_step:	Maximal step number.
%		Step_sample:Number of latin queue in a certain latin hypercube.
%		Group_Index:Group index of the experiment that involved in this sampling.
%		Max_time:	Maximal runing time.(early abort)
	Max_sample=6000;
	Max_step=1000;
	Group_Index=4;
	Max_time=3600*13;
	tstart=tic;

	sample_number=1;
	dp_number=0;
	number_theta=length(theta); 

% Each step we sample a latin hypercube. Then we may rescale the scale according to the error.
for step=1:Max_Step
% Generate a latin hypercube sampling one time.	
	for i=1:number_theta
		latin_number(:,i)=randperm(M)';
	end
	for i=1:M
% For biochemical parameters, we may generate them in log space.
		theta=exp(-M/2+latin_number(i,:)+rand(1,18)).*scale;
		for k=Group_Index
			theta(16)=gf_con(k);
			[t{k},result]=forward_solver(@rhs,tspan,y0,theta,options);
% Estimate the error under this certain parameter.
			Error(sample_number)=Error(sample_number)+Error_ODE2EXP(t{k},result,texp{k},yexp{k},tspan);
% Sometimes we need to pick up parameters that lead to special patterns(double peak pattern for this case).Then we choose another error estimator.
			[num_crit,location]= Locate(t,result,span);
			if(num_crit>=3)
				Theta_dp(dp_number+1,:)=theta;
				Error_dp(dp_number+1)=Error(sapmle_number)
				dp_number=dp_number+1;
				save ../data/latin_sample.mat	Theta_dp	Error_dp 
				if(dp_number>=Max_sample)
					clear Theta Error
					Theta=Theta_dp;
					Error=Error(dp);
					return ;
				end
			end
			sample_number=sample_number+1;
		end
	end
			time_used=toc(tstart);
			if(time_used>=Max_time)
				clear Theta Error
				Theta=Theta_dp;
				Error=Error_dp;
				return ;
			end
end





























