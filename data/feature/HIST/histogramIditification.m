im=imread('dongfang1.jpg');
hist1 = getHistgram(im);
im1=imread('dongfang3.jpg');
hist2 = getHistgram(im1);

dist = sqrt(hist1.*hist2);
SUM = sum(dist(:));
SUM = SUM/3;