 clear all;

digitData = imageDatastore( ' C:\Users\Titu\Desktop\trainingdata\train test  ',...
        'IncludeSubfolders',true,'LabelSource','foldernames');
  
  [trainingSet,testSet] = splitEachLabel(digitData,0.5 ); 
    [r c]=size(countEachLabel( trainingSet ));  

    
 
 [r, c]=size(countEachLabel( trainingSet ));  
     
t3=countEachLabel(trainingSet  );
    
   y=t3.Count;
   t1=sum(y);
 p=zeros(r,t1);
 
 g=1;
  for j=1:r 
      
  for m=1:y(j)
  p(j,g)=1;
  
  g=g+1;
  end
  end
  
for q=1:t1 
    
trainingSet .ReadFcn =  @readFunctionTrain7;    
    
a=read(trainingSet );
    
    b=a;
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
  s1=function1(a); 
   
  c1=transpose(s1);
  c1= reshape(c1,50,50);
  c1=transpose(c1);
  c1=mx(c1);
  
    
  
 s2=functioni7(b1(:,:,1));
 
 c2=transpose(s2);
  c2= reshape(c2,25,25);
  c2=transpose(c2);
  c2=mx(c2);
 
   
 s3=functioni7(b1(:,:,2));
 
  c3=transpose(s3);
  c3= reshape(c3,25,25);
  c3=transpose(c3);
  c3=mx(c3);
 s4=functioni7(b1(:,:,3)); 
 
  c4=transpose(s4);
  c4= reshape(c4,25,25);
  c4=transpose(c4);
  c4=mx(c4);
 s=cat(1,s1,s2,s3,s4);
   
    
  
   w(:,q)=s; 
  g1(:,q)=s1;
  k1(:,q)=c1;
  
  g2(:,q)=s2;
   k2(:,q)=c2;
  
  g3(:,q)=s3;
   k3(:,q)=c3; 
  g4(:,q)=s4;
 k4(:,q)=c4;
 

 end 
  
 
     
net2= patternnet(10);
net2= train(net2,g2,k2);


  net3= patternnet(10);
net3= train(net3,g3,k3);
   
 

net4= patternnet(10);
net4= train(net4,g4,k4);

  

for i=1:t1
     s1=g1(:,i);
     s2=g2(:,i);
     s3=g3(:,i);
     s4=g4(:,i);
     % z1=net1(s1);
     z2=net2(s2);
      z3=net3(s3);
      z4=net4(s4);
        
        
      h=cat(1,s2,z2,s3,z3,s4,z4,s1); 
    
     w9(:,i)=h;
end

 
 
 net=trainSoftmaxLayer(w9,p);

 

[r c]=size(countEachLabel(testSet ));  
    
    t3=countEachLabel(testSet  );
    
   y=t3.Count;
   t1=sum(y);
 p1=zeros(r,t1);
 
 g=1;
  for j=1:r 
      
  for m=1:y(j)
  p1(j,g)=1;
  
  g=g+1;
  end
  end
  
for q=1:t1 
    
testSet.ReadFcn =  @readFunctionTrain7;     
a2=read( testSet );
      
  
 
   
    b=a2;
  e=size(b);
 [r6 r1]=size(e);
 
   if r1==3
    a1=rgb2gray(b);
    b1=b;
   else
   b1(:,:,1)=b;
   b1(:,:,2)=b;
   b1(:,:,3)=b;
   a1=b;
   end



     
    
  s1=function1(a1); 
  
  s2=functioni7(b1(:,:,1)); 
 
 s3=functioni7(b1(:,:,2)); 
   
 s4=functioni7(b1(:,:,3)); 
   
   %z1=net1(s1);
     z2=net2(s2);
      z3=net3(s3);
      z4=net4(s4);
        
        
 
 v=cat(1,s2,z2,s3,z3,s4,z4,s1); 
 
  c=net(v);
  
  
[ro, co] = find(ismember(c, max(c(:))));
test(q)=ro;

[ro, co] = find(ismember(p1(:,q), max(p1(:,q))));
test1(q)=ro;

 
end
 

accuracy = (sum(test == test1)/t1)*100







 
