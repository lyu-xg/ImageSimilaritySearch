function y = fourier(A)
    m = size(A,3);
    if(m > 1)
        f=rgb2gray(A);%תΪ�Ҷ�ͼ
    else
        f = A;
    end
    [l,w] = size(f);
    %subplot(2,2,2),imshow(f)%��ʾ
    F=fft2(f);%���ٸ���Ҷ�任
    S1=log(1+abs(F));
    %subplot(2,2,3);imshow(S1,[])%��ʾ
    FS=fftshift(F);%ת�Ƶ�����
    S=log(1+abs(FS));
    x = max(max(S));
    z = min(min(S));
    step = (x-z)/51;
    y = zeros(52,1);
    for i = 1:l
        for j = 1:w
        value = (S(i,j) - z)/step;
        value = floor(value) + 1;
        y(value) = y(value) + 1;
        end
    end
    %subplot(2,2,4);imshow(S,[])%��ʾ
end
