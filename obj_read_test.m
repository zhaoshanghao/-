[vertices, faces ]= obj__read( 'spider.obj' );
%[vertices, faces ]= obj__read( 'elephav.obj' );
%%
%������ɫ
figure(1);
handle = patch ( 'Vertices', vertices', 'Faces', faces');
set ( handle, 'FaceColor', [0.4, 0.7, 0.8], 'EdgeColor', 'yellow');
%light('Color',[1 0 1],'Posi',[0,10,1]);%��ӹ���
% % hold on;
%%
%����ɢ��ͼ
figure(2);
X = vertices(1,:);
Y = vertices(2,:);
Z = vertices(3,:);
scatter3(X,Y,Z);
%surfnorm(X,Y,Z);
% %  hold on
% % ezmesh('0-y-x',[-500 700])%��ƽ��
% % [x,y,z]=meshgrid(linspace(-500,700));
% % contourslice(x,y,z,x+y+z,X,Y,Z,[0 0])%������
% % hold on
% [x,y,z]=meshgrid(linspace(-500,700));
% h1=contourslice(x,y,z,x+y+z,X,Y,Z,[0 0]);
% set(h1,'Marker','*','LineWidth',3)
% slice(X,Y,Z,V,[6 8],[5 9],[3 5])%��ȡx=6��8��y=5��9��z=3��5��6��������ͼ
% xlabel('x')
% ylabel('y')
% zlabel('z')
% axis off