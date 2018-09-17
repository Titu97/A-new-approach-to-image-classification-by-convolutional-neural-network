 clear all;


digitData = imageDatastore( '  C:\Users\Titu\Desktop\trainingdata\train test  ',...
        'IncludeSubfolders',true,'LabelSource','foldernames');
  

  [trainingSet,testSet] = splitEachLabel(digitData,0.5 ); 
    [r c]=size(countEachLabel( trainingSet ));  

 
       
  layers = [
        imageInputLayer([28 28 3])
        convolution2dLayer([5 5], 20)
        reluLayer()  
        maxPooling2dLayer(2,'Stride',2)
       fullyConnectedLayer(r)                             
       softmaxLayer()
       classificationLayer()
    ];

 
 
 
 options = trainingOptions('sgdm','MaxEpochs',20,...
 	'InitialLearnRate',0.0001);
  
trainingSet .ReadFcn =  @readFunctionTrain6;    
convnet = trainNetwork(trainingSet ,layers,options);

 
testSet.ReadFcn = @readFunctionTrain6;    

YTest = classify(convnet,testSet);
TTest=testSet.Labels; 

 

  accuracy = (sum(YTest == TTest)/numel(TTest))*100
  
  
  
  