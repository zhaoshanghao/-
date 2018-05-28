clc;
clear;
data=ReadObj_h('1003_unify_SingleLayerFace_NoEar.obj');%���޸�Ϊ����obj�ļ��ľ���·��
global faces;
global vertexes;
global fname;
fname = data.fname;
faces=data.faces;
vertexes=data.vertexes;
vertexes=vertexes';%����ת��,ÿһ�б�ʾһ���������
faces=faces(1:3,:);
faces=faces';%����ת��,ÿһ�б�ʾһ��������Ƭ
%setappdata(gcf,'vertexes',vertexes);
%setappdata(gcf,'faces',faces);
%gcf���ص�ǰFigure��������ʾͼ�κ��û�����Ĵ��ڣ�����ľ��ֵ
%gca���ص�ǰaxes���ڴ�������ʾͼ�ε��ᣩ����ľ��ֵ
%gco���ص�ǰ��굥���ľ��ֵ���ö�������ǳ�root�����������ͼ�ζ��󣬲��һὫ��ǰͼ�ζ���ľ��ֵ�����Figure��CurrentObject������
%ͼ�ξ����ͼ��֮����һ��һһ��Ӧ��ϵ���򵥵�˵ͼ�ξ������ָ�������ͼ�ε�һ��������ͨ���������趨��ͼ�εĸ������ԡ�
light('Color','w','Position',[0 -1 0],'Style','infinite');%���ù�Դλ��
hidden off;%��ʾ���ڵ���λ hidden on Ϊ�����ڵ���λ�����͸����ʹ��Ч������

trisurf(faces,vertexes(:,1),vertexes(:,2),vertexes(:,3), 'FaceColor', 'yellow', 'EdgeColor', 'none', 'FaceAlpha', 0.99);
%�������Ǳ���ͼ��������Ƭ������λ�����꣨X��Y��Z�������ԣ���Ƭ����ɫ����Ե�ߵ���ɫ��͸���ȣ�
hold on;
light('Color','w','Position',[1 -2 1],'Style','infinite');
light('Color','w','Position',[-1  2 -0.5],'Style','infinite');

xlabel('X��');
ylabel('Y��');
zlabel('Z��');
view(0,0);%�����ӽ�λ�ã�view����λ�ǣ������ǣ�;
axis tight;% axis�����������������С���ֵ��axis tight��ʹ����ϵ�����ֵ����Сֵ��������ݷ�Χһ�£�������������ķ�ΧΪ���ݵķ�Χ��
grid off;%grid off/on ������ʾ��رջ�ͼ�е������� 
hold on;
title(fname);
rotate3d on;%��ģ�ͽ���������ת