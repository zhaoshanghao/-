function data = ReadObj_h(fileName)
% 时间：2009.04.23
% 作者：张彦飞
% 修改：2010.03.27
%      原先我在解决三角面皮和四角面皮的时候用的办法比较笨，其实MATLAB中提供了更好的办法
%      那就是如果是三角面片的话仍然顶点索引数组仍然是四个，但最后一个为无穷大。
%      这样的数组直接送到patch函数中就可以自动区别三角和四角面片

% 输入：模型的OBJ文件的绝对文件名
% 输出：一个结构体，其中包含的是每个分区的点和面
% 和以前函数区别：根据OBJ文件中的分区信息来读取

% fileName = 'I:\HeadModel\训练选取\初步选取\训练样本\1.obj';
fid = fopen(fileName);
%fid=fopen('E:\work\1.obj');
%%% 修改于2009.09.02，为了使该函数支持没有分组的数据，即不包含g前缀的数据。
vertexCount = 0;
faceCount = 0;
partCount = 1;
data(partCount).name = 'Global';%设置该分区的名称为全局变量global
% 以下布尔变量的添加是为了使该文件既能读取全局模型，也可读取分区模型
IsHaveGroupInformation = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data(1).fname = fileName;
while 1
    [prefix,count] = fscanf(fid,'%s',1);%fscanf函数表示对本文数据读取，从原始文件中读的时候是按行读，写入时按列优先,prefix为前缀，count表示读到的字段数
    switch prefix
        case '#'
            tline = fgetl(fid);%从文件中读取一行数据，并去掉行末的换行符,返回指定文件中的下一行，并删除换行符。
        case 'g'
            partname = fgetl(fid);
            
            if IsHaveGroupInformation == 1
                [prefix,count] = fscanf(fid,'%s',1);
                if prefix == 's'
                    tline = fgetl(fid);
                    partCount = str2num(tline);
%                 else
%                     errordlg('读取文件错误','错误提示');
                end;
                vertexCount = 0;
                faceCount = 0;   
            end
            data(partCount).name = partname;
       
            IsHaveGroupInformation = 1;
         case 'v'
             vertexCount = vertexCount + 1;
             [data(partCount).vertexes(:,vertexCount),count1] = fscanf(fid,'%f',3);%%fscanf函数表示对本文数据读取，从原始文件中读的时候是按行读，写入时按列优先,count1表示读到的字段数
         case 'f'
             faceCount = faceCount + 1;
             i = 1;
             face = zeros(4,1);
             face(4,1) = NaN;
             face(i,1) = fscanf(fid,'%d',1);
             guard = fscanf(fid,'%c',1);
            while guard ~= '\n'
                if guard == ' '
                    i = i + 1;
                    face(i,1) = fscanf(fid,'%d',1);
                   guard = fscanf(fid,'%c',1);
                elseif guard == '/'
                    temp = fscanf(fid,'%d',1);
                   guard = fscanf(fid,'%c',1);
                else
                   break;
                end               
            end
            
            data(partCount).faces(:,faceCount) = face(:,1);
             
        otherwise
            tline = fgetl(fid);
    end
    
    if count == 0
        break;
    end
end
[M,N] = size(data);
count = 0;
for partnum = 1:1:N
    data(partnum).prepartsVcount = count;
    %%
    % _ _ _ _ _ITALIC TEXT_ _ _ _ _
    [M2,N2] = size(data(partnum).vertexes);
    
    count = count + N2;
end

fclose(fid);