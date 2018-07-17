%""%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: rhs.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月16日 星期一 16时34分44秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [f] = rhs(t, x, theta)
%  rhs:
%  rhs(t, x, theta) is the right hand side of the ODE dx/dt=f(t, x, theta),
%  including  function values respected to theta, x and time t.
%  where x represent the variables and theta are the set of unknown parameters.
%  The ODE system below is the third version.

	n = length(x);
	f = zeros(n, 1);
	if (t < 0)
		return ;
	end
	GF   = theta(16)/4.033;
	fyn1 = theta(17);
	fyn2 = theta(18);

	f(1) = theta(2)*x(2)-theta(1)*GF*x(1);
	f(2) = theta(1)*GF*x(1)-theta(2)*x(2)-2*theta(3)*x(2)*x(2)+2*theta(4)*x(3);
	f(3) = theta(3)*x(2)*x(2)-theta(4)*x(3)-theta(5)*x(3)+theta(10)*x(4);
	f(4) = theta(5)*x(3)-theta(10)*x(4)-theta(15)*x(4);
	f(5) = theta(6)*x(3)*(fyn1-x(5))/(theta(7)+fyn1-x(5))-theta(8)*x(5)^a2/(theta(9)+x(5));
	f(6) = theta(11)*x(4)*(fyn2-x(6))/(theta(12)+fyn2-x(6))-theta(13)*x(6)/(theta(14)+x(6));

end
