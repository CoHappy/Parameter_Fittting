%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: visualize.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月20日 星期五 10时24分59秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function[info]=visualize(t,y,texp,yexp,index,info)
%viualize: draw pictures of the curve of different species.
%	Input:
%		t:		time mesh of the ODE results.
%		y:		concentration of different species with respect to t.
%		texp:	time mesh of the experiment.
%		yexp:	concentration of different species with respect ot texp.
%		index:	experiment groups choosen.
%		info:	visulaize informations.
%			0:	both ODE and experiment are shown in the same figure.
%			1:	only show ODE results.
line_type = {'r-', 'g-', 'b-', 'k-', 'y-', 'm-', 'c-'};
conc_str = {'500 ng/ml', '100 ng/ml', '50 ng/ml', '25 ng/ml', '10 ng/ml', '5 ng/ml', '1 ng/ml'};
if (info==0)
	for i=index
		figure(i);
		plot(t{i},y{i},'r');
		hold on
		plot(texp{i},yexp{i},'b');
		title(conc_str(i));
		xlabel('Time(sec))');
		ylabel('fyn_activity');
		legend('simulation','experiment');
	end
else 
	for i=index
		figure(i);
		plot(t{i},y{i},'r')
		title(conc_str(i));
		xlabel('Time(sec))');
		ylabel('fyn_activity');
		legend('simulation');
	end
end
