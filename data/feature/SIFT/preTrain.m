featureDim = 128*10;
numTrainImages = 750+1500;

trainImages = zeros(numTrainImages,featureDim);
trainLabels = zeros(numTrainImages,1);


run('vlfeat-0.9.19\toolbox\vl_setup');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%—µ¡∑CCTV5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
images = dir('C:\Users\JIN\Desktop\logo\tvlogo\sample\cctv5\*.*');
path = 'C:\Users\JIN\Desktop\logo\tvlogo\sample\cctv5\';
[r,c] = size(images);
count = 1;
min = 20;
for i=1:r
    if images(i).name == '.'
        disp([path,images(i).name]);
    else
        siftFeature = getSift([path,images(i).name]);
        [m,n] = size(siftFeature);
        siftFeature = siftFeature(:,1:10);
        siftFeature = reshape(siftFeature,1,featureDim);
        trainImages(count,:) = siftFeature;
        trainLabels(count,1) = 1;
        count = count + 1;
    end
end
% disp(count);
disp(count);
images = dir('C:\Users\JIN\Desktop\logo\tvlogo\sample\no-1\*.*');
path = 'C:\Users\JIN\Desktop\logo\tvlogo\sample\no-1\';
[r,c] = size(images);

min = 20;
for i=1:r
    if images(i).name == '.'
        disp([path,images(i).name]);
    else
        siftFeature = getSift([path,images(i).name]);
        [m,n] = size(siftFeature);
        siftFeature = siftFeature(:,1:10);
        siftFeature = reshape(siftFeature,1,featureDim);
        trainImages(count,:) = siftFeature;
        trainLabels(count,1) = 0;
        count = count + 1;
    end
end
disp(count);
save ('cctvtrainFeatures.mat','numTrainImages','trainImages','trainLabels');

% load cctvtrainFeatures.mat;

perm = randperm(numTrainImages);

data = trainImages(perm,:);
label = trainLabels(perm);

option=statset('MaxIter',100000);

svmStruct = svmtrain(data,label,'options',option);

save('cctvsvmStruct.mat','svmStruct');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%—µ¡∑∫˛ƒœŒ¿ ”%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
images = dir('C:\Users\JIN\Desktop\logo\tvlogo\sample\hn-1\*.*');
path = 'C:\Users\JIN\Desktop\logo\tvlogo\sample\hn-1\';
[r,c] = size(images);
count = 1;
min = 20;
for i=1:r
    if images(i).name == '.'
        disp([path,images(i).name]);
    else
        siftFeature = getSift([path,images(i).name]);
        [m,n] = size(siftFeature);
        siftFeature = siftFeature(:,1:10);
        siftFeature = reshape(siftFeature,1,featureDim);
        trainImages(count,:) = siftFeature;
        trainLabels(count,1) = 1;
        count = count + 1;
    end
end
disp(count);
save ('hntrainFeatures.mat','numTrainImages','trainImages','trainLabels');

% load cctvtrainFeatures.mat;

perm = randperm(numTrainImages);

data = trainImages(perm,:);
label = trainLabels(perm);

option=statset('MaxIter',100000);

svmStruct = svmtrain(data,label,'options',option);

save('hnsvmStruct.mat','svmStruct');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%—µ¡∑∂´∑ΩŒ¿ ”%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
images = dir('C:\Users\JIN\Desktop\logo\tvlogo\sample\df\*.*');
path = 'C:\Users\JIN\Desktop\logo\tvlogo\sample\df\';
[r,c] = size(images);
count = 1;
min = 20;
for i=1:r
    if images(i).name == '.'
        disp([path,images(i).name]);
    else
        siftFeature = getSift([path,images(i).name]);
        [m,n] = size(siftFeature);
        siftFeature = siftFeature(:,1:10);
        siftFeature = reshape(siftFeature,1,featureDim);
        trainImages(count,:) = siftFeature;
        trainLabels(count,1) = 1;
        count = count + 1;
    end
end
disp(min);
save ('dftrainFeatures.mat','numTrainImages','trainImages','trainLabels');

% load cctvtrainFeatures.mat;

perm = randperm(numTrainImages);

data = trainImages(perm,:);
label = trainLabels(perm);

option=statset('MaxIter',100000);

svmStruct = svmtrain(data,label,'options',option);

save('dfsvmStruct.mat','svmStruct');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%—µ¡∑∫⁄¡˙Ω≠Œ¿ ”%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
images = dir('C:\Users\JIN\Desktop\logo\tvlogo\sample\hlj\*.*');
path = 'C:\Users\JIN\Desktop\logo\tvlogo\sample\hlj\';
[r,c] = size(images);
count = 1;
min = 20;
for i=1:r
    if images(i).name == '.'
        disp([path,images(i).name]);
    else
        siftFeature = getSift([path,images(i).name]);
        [m,n] = size(siftFeature);
        siftFeature = siftFeature(:,1:10);
        siftFeature = reshape(siftFeature,1,featureDim);
        trainImages(count,:) = siftFeature;
        trainLabels(count,1) = 1;
        count = count + 1;
    end
end
disp(min);
save ('hljtrainFeatures.mat','numTrainImages','trainImages','trainLabels');

% load cctvtrainFeatures.mat;

perm = randperm(numTrainImages);

data = trainImages(perm,:);
label = trainLabels(perm);

option=statset('MaxIter',100000);

svmStruct = svmtrain(data,label,'options',option);

save('hljsvmStruct.mat','svmStruct');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%—µ¡∑ ’≤ÿÃÏœ¬%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
images = dir('C:\Users\JIN\Desktop\logo\tvlogo\sample\sc\*.*');
path = 'C:\Users\JIN\Desktop\logo\tvlogo\sample\sc\';
[r,c] = size(images);
count = 1;
min = 20;
for i=1:r
    if images(i).name == '.'
        disp([path,images(i).name]);
    else
        siftFeature = getSift([path,images(i).name]);
        [m,n] = size(siftFeature);
        siftFeature = siftFeature(:,1:10);
        siftFeature = reshape(siftFeature,1,featureDim);
        trainImages(count,:) = siftFeature;
        trainLabels(count,1) = 1;
        count = count + 1;
    end
end
disp(min);
save ('sctxtrainFeatures.mat','numTrainImages','trainImages','trainLabels');

% load cctvtrainFeatures.mat;

perm = randperm(numTrainImages);

data = trainImages(perm,:);
label = trainLabels(perm);

option=statset('MaxIter',100000);

svmStruct = svmtrain(data,label,'options',option);

save('sctxsvmStruct.mat','svmStruct');




