%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Name: Prepare.m
% Author: Tongkai Li
% mail: ltk@pku.edu.cn
% Created Time: 2018年07月30日 星期一 19时56分00秒
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script is used to load data and initiate parameter.

load ../data/exp.mat

rand('seed',sum(100*clock));
tspan=[0;2000];
for i=1:7
    temp_index=find(Tq{i}>=tspan(1)&Tq{i}<=tspan(2));
    Tq{i}=Tq{i}(temp_index);
    Yq{i}=Yq{i}(temp_index);
end
texp=Tq;
yexp=Yq;
rhs=@rhs_2;
y0=[0.4,0,0,0,0,0];
var_index=[1:15,17,18];
theta=zeros(1,18);
group_index=[4];
gf_con = [80.65, 16.13, 8.065, 4.033, 1.515, 0.76, 0.1515];
options=odeset('RelTol',1e-5,'MaxStep',1.0,'Stats','off');
line_type = {'r-', 'g-', 'b-', 'k-', 'y-', 'm-', 'c-'};
conc_str = {'500 ng/ml', '100 ng/ml', '50 ng/ml', '25 ng/ml', '10 ng/ml', '5 ng/ml', '1 ng/ml'};










