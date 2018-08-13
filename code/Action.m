%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: Action.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月30日 星期一 20时32分13秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script is used to plan to solve the parameter fiiting problem.
% 
% clear;
Prepare
scale=[3*1e-3,1e-3,1e-3,3*1e-3,1e-3,0.5,3,0.5,3,1e-3,0.5,3,0.5,3,1e-3,0.5,0.5,0.5];
M=10;
% [info,Error_dp,Theta_dp]=Latin_Sampling(M,scale,gf_con,Tq,Yq,rhs,tspan,y0,options);
% f=@(theta)(Error_theta(theta,texp,yexp,rhs,tspan,y0,options,group_index,gf_con,0));
% f_show=@(theta)(Error_theta(theta,texp,yexp,rhs,tspan,y0,options,group_index,gf_con,1));
% [~,sample_error_index]=sort(Error_dp);
% Error=Error_dp(sample_error_index);
% Theta=Theta_dp(sample_error_index,:);
[info,selection,Theta]=show_pattern(Theta,Tq,Yq,gf_con,group_index,rhs,tspan,y0,options,0);
Time=fix(clock);
reportaddress='../data/';
Opt_Theta=Theta;
Error_Theta=zeros(size(Theta,1),1);
addressString=[sprintf('%s%d%d%d%d_data.mat',reportaddress,2018,Time(4),Time(5),Time(6))];
pass=find(selection==1);
i_temp=1;
for i=pass'
    theta=Theta(i,:);
%     if(selection(i)==0)
%         continue;
%     end
    f(theta);
    [error,Mtheta,info]=Coor_Descent(theta,f,var_index);
    f(Mtheta)
    Opt_Theta(i_temp,:)=Mtheta;
    Error_Theta(i_temp)=error;
    save(addressString,'Opt_Theta','Error_Theta');
    i_temp=i_temp+1;
end

