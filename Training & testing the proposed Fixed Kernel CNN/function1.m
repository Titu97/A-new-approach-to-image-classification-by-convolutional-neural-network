   function [y] = function1(a)
   
  % a= edge(a,'Sobel');
 
   
 h=[-1    -1    -1
    -1     8    -1
    -1    -1    -1];

  
 a = imfilter(a,h);
 
  
 s=double(a);
 [r1,c1]=size(s); 
 
 i=1;j=1;k=1;l=1;
 f=(r1*c1)/4;
 for p=1:f
 c=[s(i,j) s(i,(j+1));
s((i+1),j) s((i+1),(j+1))];

 
 d(p)=max(max(c));
 
 if j==(c1-1)
      
     i=i+2;
     
  
     j=1;
      
 
 else 
     j=j+2;
 
    
 end

 end
 
 x= reshape(d, (c1/2),(r1/2));
 
x = transpose(x);
 
 y1=transpose(d);
[a1 a2]=size(y1);
 
if a1<=2500
 %imshow(x)
y=y1;
else    
    
y= function1(x);
 
 
    
end




 
end

