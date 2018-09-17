
function [ y ] = mx( a )
 

 [r c]=size(a); 

q=0;
 k=1;
i=1;j=1;
t=5;
l=1;
 
 while(i<=(r-t+1))
      
    
for m=i:(i+t-1)
  l=1; 
   
 for n=j:(j+t-1)
    
   
    
   x(k,l)= a(m,n);
     
   l=l+1 ;
 end
k=k+1;
end
      
 k=1; 
 
 if(j>(c-t))
    i=m+1;
    j=1;
    
else j=n+1;
 end
 
 
 
 q=q+1;
 
  
  d(q)=max(max(x));
  y=transpose(d);
 end
end

