function siftFeature = getSift( imgPathName)
Imgori=imread(imgPathName);
% imshow(Imgori);
% image(Imgori);
Imgori = rgb2gray(Imgori);
Imgori = imresize(Imgori,[128,128]);
I=single(Imgori);
% I=single(Imgori);

[f,d] = vl_sift(I);
% disp(size(f,2));
if size(f,2)>=10
% perm = randperm(size(f,2)) ;
% % sel = perm(1:50) ;
% sel = perm;
% h1 = vl_plotframe(f(:,sel)) ;
% h2 = vl_plotframe(f(:,sel)) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;

siftFeature = d(:,1:10);

else
    siftFeature = zeros(1,1);
end
end