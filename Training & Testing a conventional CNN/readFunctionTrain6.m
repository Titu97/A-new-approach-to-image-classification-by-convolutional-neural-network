 
function I = readFunctionTrain6(filename)
% Resize the flowers images to the size required by the network.
x = imread(filename);
%a=imresize(x,[28 28]);
 
 b=imresize(x,[28 28]);
  e=size(b);
 [r6 r1]=size(e);
 
   if r1==3
    a=rgb2gray(b);
    b1=b;
   else
   b1(:,:,1)=b;
   b1(:,:,2)=b;
   b1(:,:,3)=b;
   a=b;
   end


I=b1;
