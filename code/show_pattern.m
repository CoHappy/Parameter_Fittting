%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: show_pattern.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年08月01日 星期三 11时01分44秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[info,selection,Theta]=show_pattern(Theta,texp,yexp,gf_con,group_index,rhs,tspan,y0,options,visual)
% show_pattern: show comparasion picture of the ODE system and the results one by one.
%               I also plan to select more probable choice during this
%               procedure.
%	Input:
%		Theta:	parameter queue to show one by one.
%		Remain:	the same as in other functions.
%	Output:
%		info:       return information.
%       selection:  comments for each parameter.
[n,~]=size(Theta);
[~,locate_org]=Locate_crit(texp{group_index},yexp{group_index},tspan);
info=0;
selection=ones(n,1);
for i=1:n
	theta=Theta(i,:);
    for k=group_index
        theta(16)=gf_con(k);
        showfigure=0;
%         selection(i)=1;
		[t{k},result]=forward_solver(rhs,tspan,y0,theta,options);
		y{k}=result(:,5)+result(:,6);
        [num_crit,locate]=Locate_crit(t{k},y{k},tspan);
%         visualize(t,y,texp,yexp,k,showfigure);
        if(num_crit<3)
            selection(i)=0;
        else
            peak_time(1)=locate(1,1);
            peak_height(1)=locate(1,2);
            peak_time(2)=locate(3,1);
            peak_height(2)=locate(3,2);
            undimen_time=peak_time(1)/locate_org(1,1);
            undimen_conc=peak_height(1)/locate_org(1,2);
            theta=undimen(theta,undimen_time,undimen_conc);
            if(peak_height(2)<peak_height(1)&&peak_time(2)*peak_time(1)/locate_org(1,1)<tspan(2))
                showfigure=1;
            else
                showfigure=2;
                selection(i)=0;
            end
        end
        theta(16)=gf_con(k);
		[t{k},result]=forward_solver(rhs,tspan,y0,theta,options);
		y{k}=result(:,5)+result(:,6);
%         [num_crit,locate]=Locate_crit(t{k},y{k},tspan)
		visualize(t,y,texp,yexp,k,showfigure*visual);
    end
    Theta(i,:)=theta;
end
info=1;