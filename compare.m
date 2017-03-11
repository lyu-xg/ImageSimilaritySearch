[rgb1,~] = imread('7.pic.jpg');
a1 = yanseju(rgb1);
[rgb2,~] = imread('8.pic.jpg');
a2 = yanseju(rgb2);
[rgb3,~] = imread('9.pic.jpg');
a3 = yanseju(rgb3);
[rgb4,~] = imread('10.pic.jpg');
a4 = yanseju(rgb4);

compare12 = sqrt(sum((a1-a2).^2))

compare13 = sqrt(sum((a1-a3).^2))

compare14 = sqrt(sum((a1-a4).^2))

compare23 = sqrt(sum((a3-a2).^2))

compare24 = sqrt(sum((a4-a2).^2))

compare34 = sqrt(sum((a3-a4).^2))
