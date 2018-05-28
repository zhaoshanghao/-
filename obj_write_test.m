% Example: Box    
vertices = [0 0 0; 0 50 0; 30 50 0; 30 0 0; 0 0 40; 0 50 40; 30 50 40; 30 0 40]';    
faces = [1 2 3 4; 2 6 7 3; 4 3 7 8; 1 5 8 4; 1 2 6 5; 5 6 7 8]'; 
obj_write('myobj.obj',vertices,faces);