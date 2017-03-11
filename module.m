path = 'data/images/';
allNames = dir(strcat(path,'*.jpg'));
size = length(allNames);
LBPFeatures = ones(1000,256); %1000x256 ??
ColorFeatures = ones(1000,9); %1000x9 ???
ColorCorrelograms = ones(1000,64); %1000x64 ?????
Fouriers = ones(1000,52); %1000x256 ?????
if size > 0
    for i=1:size
        if rem(i,size/100)==0
            strcat('reading and computing',int2str(i))
        end
        im = imread(strcat(path,allNames(i).name));
        I1 = imresize(im,[128,128]);
        if ndims(I1) == 3
            RGB = I1;
            I = rgb2gray(I1);
            
        else
            RGB(:,:,1)=I1;
            RGB(:,:,2)=I1;
            RGB(:,:,3)=I1;
            I = I1;           
        end
        LBPFeatures(i,:) = LBP(I1);
        ColorFeatures(i,:) = yanseju(I1);
        ColorCorrelograms(i,:) = ColorCorrelogram(I1,6)';
        Fouriers(i,:) = fourier(I1)';
    end
   
end



