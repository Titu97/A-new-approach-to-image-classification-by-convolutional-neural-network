  function [y] = functioni7(a)
       
 
 s=double(a);
 [r1,c1]=size(s); 
 
 i=1;j=1;k=1;l=1;
 f=(r1*c1)/4;
 for p=1:f
 c=[s(i,j) s(i,(j+1));
s((i+1),j) s((i+1),(j+1))];

 
d(p)=(c(1,1)+c(1,2)+c(2,1)+c(2,2))/4;

 if j==(c1-1)
      
     i=i+2;
     
  
     j=1;
      
 
 else 
     j=j+2;
 
    
 end

 end
 
 x= reshape(d, (c1/2),(r1/2));
 

 
x = transpose(x);

%y=fun1(x);

 
y1=transpose(d);
 
[a1 a2]=size(y1);

if a1<2500
    
y=y1;
else
    
y= functioni7(x);
 
 end

end

