clc;
clear;
data=ReadObj_h('1003_unify_SingleLayerFace_NoEar.obj');%可修改为任意obj文件的绝对路径
global faces;
global vertexes;
global fname;
fname = data.fname;
faces=data.faces;
vertexes=data.vertexes;
vertexes=vertexes';%矩阵转置,每一行表示一个点的坐标
faces=faces(1:3,:);
faces=faces';%矩阵转置,每一行表示一个三角面片
%setappdata(gcf,'vertexes',vertexes);
%setappdata(gcf,'faces',faces);
%gcf返回当前Figure（用来显示图形和用户界面的窗口）对象的句柄值
%gca返回当前axes（在窗口中显示图形的轴）对象的句柄值
%gco返回当前鼠标单击的句柄值，该对象可以是除root对象外的任意图形对象，并且会将当前图形对象的句柄值存放在Figure的CurrentObject属性中
%图形句柄和图形之间是一种一一对应关系，简单的说图形句柄就是指向了这个图形的一个变量，通过它可以设定该图形的各种属性。
light('Color','w','Position',[0 -1 0],'Style','infinite');%设置光源位置
hidden off;%显示被遮挡部位 hidden on 为隐藏遮挡部位，配合透明度使用效果明显

trisurf(faces,vertexes(:,1),vertexes(:,2),vertexes(:,3), 'FaceColor', 'yellow', 'EdgeColor', 'none', 'FaceAlpha', 0.99);
%绘制三角表面图（三角面片、顶点位置坐标（X、Y、Z），属性：面片的颜色、边缘线的颜色、透明度）
hold on;
light('Color','w','Position',[1 -2 1],'Style','infinite');
light('Color','w','Position',[-1  2 -0.5],'Style','infinite');

xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');
view(0,0);%设置视角位置，view（方位角，俯仰角）;
axis tight;% axis用来设置坐标轴的最小最大值，axis tight是使坐标系的最大值和最小值和你的数据范围一致（即设置坐标轴的范围为数据的范围）
grid off;%grid off/on 用于显示或关闭画图中的网格线 
hold on;
title(fname);
rotate3d on;%对模型进行自由旋转