% for i=1:77
% 	theta=Theta(i,:);
	for k=group_index
        theta(16)=gf_con(k);
        showfigure=0;
        selection=1;
		[t{k},result]=forward_solver(rhs,tspan,y0,theta,options);
		y{k}=result(:,5)+result(:,6);
        [num_crit,locate]=Locate_crit(t{k},y{k},tspan);
        num_crit
        locate
		visualize(t,y,texp,yexp,k,showfigure);
    end
% end
