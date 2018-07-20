%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: Coor_Descent.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月19日 星期五 10时54分33秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[Error,x_optimal,info]= Coor_Descent(x0,f)
% Coor_Descent: Apply coordinate descent method to find the optimal value of the @cost_function from x0.
%	Input:
%		x0:			initial value of the parameter.
%		f:	objective function to be optimized.	
%	Output:
%		Error:		The optimal value of the objective function.
%		x_optimal:	Parameter value to meet the optimal.
%		info:		Information of the results of the algorithm.
%	PS:
%		Here we apply the armijo line search.
%		The gradient are approximated by finite difference.
%	Inner parameter:
%		pho:		armijo line search parameter.
%		max_iter:	maximal iteration number.
%		max_armi:	maximal iteration in armijo line search.
		pho=0.6;
		max_iter=500;
		max_armi=20;

		n=length(x);
		delta=1e-6;
		xp=x0;
		x=x0;
		Error=0;
		x_optimal=x0;

		for i=1:max_iter
			gradient=zeros(n,1);
			for j=1:n
				gradient(j)=(f(x+delta*[zeros(j-1,1);1;zeros(n-j,1)])-f(x))/delta;
			end
			if (norm(gradient)==0)
				info=0;
				return ;

			end
			success=0;
			queue=randperm(n);
%Here we search over all directions, can be modified latter.
			for j=1:n
				for l=0:mar_armi
					x(j)=xp(j)-gradient(j)*pho^l;
%Bioparameters are all nonnegetive so we should hold these constraint when we are doing line search.
					if(min(x)<0)
						continue;
					end
%line search principle, to be modified latter.
					if ((f(x)-f(xp))<0)
					success=1;
					break;
					end
				end
				if(success==0)
					info=1;
					x_optimal=xp;
					Error=f(xp);
					return;
				end
				xp=x;
			end
		end
		info=2;
		x_optimal=x;
		Error=f(x);

