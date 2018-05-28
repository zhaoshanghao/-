[vertices, faces ]= obj__read( 'spider.obj' );
%[vertices, faces ]= obj__read( 'elephav.obj' );
%%
%给面着色
figure(1);
handle = patch ( 'Vertices', vertices', 'Faces', faces');
set ( handle, 'FaceColor', [0.4, 0.7, 0.8], 'EdgeColor', 'yellow');
%light('Color',[1 0 1],'Posi',[0,10,1]);%添加光照
% % hold on;
%%
%画出散点图
figure(2);
X = vertices(1,:);
Y = vertices(2,:);
Z = vertices(3,:);
scatter3(X,Y,Z);
%surfnorm(X,Y,Z);
% %  hold on
% % ezmesh('0-y-x',[-500 700])%画平面
% % [x,y,z]=meshgrid(linspace(-500,700));
% % contourslice(x,y,z,x+y+z,X,Y,Z,[0 0])%画交线
% % hold on
% [x,y,z]=meshgrid(linspace(-500,700));
% h1=contourslice(x,y,z,x+y+z,X,Y,Z,[0 0]);
% set(h1,'Marker','*','LineWidth',3)
% slice(X,Y,Z,V,[6 8],[5 9],[3 5])%截取x=6和8，y=5和9，z=3和5等6个截面视图
% xlabel('x')
% ylabel('y')
% zlabel('z')
% axis off