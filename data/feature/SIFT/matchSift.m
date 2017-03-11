

Ia=imread('img1.jpg');
% imshow(Ia);
Ib=imread('img2.jpg');
% imshow(Ib);
  

% Ia = im2single(Ia) ;
% Ib = im2single(Ib) ;

% Ia=single(rgb2gray(Ia));
% Ib=single(rgb2gray(Ib));
Imga=single(rgb2gray(Ia));
Imgb=single(rgb2gray(Ib));


[fa, da] = vl_sift(Imga) ;
[fb, db] = vl_sift(Imgb) ;
[matches, scores] = vl_ubcmatch(da, db) ;


dh1 = max(size(Ib,1)-size(Ia,1),0) ;
dh2 = max(size(Ia,1)-size(Ib,1),0) ;
numMatches = size(matches,2) ;

figure(1) ; clf ;
imshow(Ia);
plot(fa(1,:),fa(2,:),'+');
 
imagesc([padarray(Ia,dh1,'post') padarray(Ib,dh2,'post')]) ;
o = size(Ia,2) ;
line([fa(1,matches(1,:));fb(1,matches(2,:))+o], ...
     [fa(2,matches(1,:));fb(2,matches(2,:))]) ;
title(sprintf('%d tentative matches', numMatches)) ;
axis image off ;