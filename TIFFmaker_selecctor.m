function [] = TIFFmaker_selecctor(video,frame,filename)
movieID = VideoReader(video);
A=read(movieID,(frame));
As=A(180:890,576:1320,1:3);
imwrite(As,filename);
end

