function [] = Selectframe(video,filename,frame)
movieID = VideoReader(video);
A=read(movieID,frame);
imwrite(A,filename);
end

