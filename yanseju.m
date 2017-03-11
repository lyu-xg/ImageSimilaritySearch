function y=yanseju(rgb)
if ndims(rgb) == 3
    hsv = rgb2hsv(rgb);
    H = hsv(:,:,1);
    S = hsv(:,:,2);
    V = hsv(:,:,3);

    [a,b] = size(H); length = a*b;

    H1 = sum(sum(H))/length;
    H2 = nthroot(sum(sum(H.^2))/length,2);
    H3 = nthroot(sum(sum(H.^3))/length,3);

    S1 = sum(sum(S))/length;
    S2 = nthroot(sum(sum(S.^2))/length,2);
    S3 = nthroot(sum(sum(S.^3))/length,3);

    V1 = sum(sum(V.^1))/length;
    V2 = nthroot(sum(sum(V.^2))/length,2);
    V3 = nthroot(sum(sum(V.^3))/length,3);

    y = [H1,H2,H3,S1,S2,S3,V1,V2,V3];
    return
else 
    [a,b] = size(rgb);length = a*b;
    y = [sum(sum(rgb))/length,nthroot(sum(sum(rgb.^2))/length,2),...
        nthroot(sum(sum(rgb.^3))/length,3),0,0,0,0,0,0];
    return
end

end