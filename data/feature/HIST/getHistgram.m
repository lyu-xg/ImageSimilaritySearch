function hist = getHistgram(im)
% clc;
% clear all;

% im=imread('images.jpg');
% imshow(im);
% im=rgb2hsv(im);
% h0=im(:,:,1);
% s0=im(:,:,2);
% v0=im(:,:,3);

r0 = im(:,:,1);
g0 = im(:,:,2);
b0 = im(:,:,3);

r1 = zeros(256,1);
g1 = zeros(256,1);
b1 = zeros(256,1);

[M,N] = size(r0);
NUM = M*N;
for i=1:NUM     
    r1(r0(i)+1) = r1(r0(i)+1) + 1;
    g1(g0(i)+1) = g1(g0(i)+1) + 1;
    b1(b0(i)+1) = b1(b0(i)+1) + 1;
end

r1 = r1/NUM;
g1 = g1/NUM;
b1 = b1/NUM;

hist = [r1',g1',b1'];
% figure;
% subplot(1,2,1);
% imhist(im(:,:,1));
% subplot(1,2,2);
% plot(r1);
% 
% figure;
% subplot(1,2,1);
% imhist(im(:,:,2));
% subplot(1,2,2);
% plot(g1);
% 
% figure;
% subplot(1,2,1);
% imhist(im(:,:,3));
% subplot(1,2,2);
% plot(b1);
