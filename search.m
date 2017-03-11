function result = search(imagep,LBPFeatures,LBPTable,ColorCorrelograms,ColorCorrelogramsTable,...
    ColorFeatures,ColorFeaturesTable,Fouriers,FouriersTable,allNames)

im = imread(imagep);
im = imresize(im,[128,128]);
l = LBP(im)';
cc = ColorCorrelogram(im,6);
cf = yanseju(im)';
f = fourier(im);
getsize = 20;
rank1234 = zeros(4,getsize);
[rank1234(1,:),~] = lshlookup(l,LBPFeatures',LBPTable,'k',getsize,'distfun','lpnorm','distargs',{2});
[rank1234(2,:),~] = lshlookup(cc,ColorCorrelograms',ColorCorrelogramsTable,'k',getsize,'distfun','lpnorm','distargs',{2});
[rank1234(3,:),~] = lshlookup(cf,ColorFeatures',ColorFeaturesTable,'k',getsize,'distfun','lpnorm','distargs',{2});
[rank1234(4,:),~] = lshlookup(f,Fouriers',FouriersTable,'k',getsize,'distfun','lpnorm','distargs',{2});

nnlsh = union(union(rank1234(1,:), rank1234(2,:)),union(rank1234(3,:),rank1234(4,:)));

tic;
d_lbp=sum(abs(bsxfun(@minus,l',LBPFeatures(nnlsh,:))));
d_color=sum(abs(bsxfun(@minus,cc',ColorCorrelograms(nnlsh,:))));
d_colorfeatures=sum(abs(bsxfun(@minus,cf',ColorFeatures(nnlsh,:))));
d_fouriers=sum(abs(bsxfun(@minus,f',Fouriers(nnlsh,:))));
d = d_lbp + d_color + d_colorfeatures + d_fouriers;
[~,ind]=sort(d);

toc;













i12 = intersect(rank1234(1,:),rank1234(2,:));
i34 = intersect(rank1234(3,:),rank1234(4,:));
i24 = intersect(rank1234(2,:),rank1234(4,:));
i14 = intersect(rank1234(1,:),rank1234(4,:));
i23 = intersect(rank1234(2,:),rank1234(3,:));
i13 = intersect(rank1234(1,:),rank1234(3,:));

inter = union(union(union(i12,i34),union(i24,i13)),union(i14,i23));

a1 = sum(rank1234(1,:))/getsize;
a2 = sum(rank1234(2,:))/getsize;
a3 = sum(rank1234(3,:))/getsize;
a4 = sum(rank1234(4,:))/getsize;

f1 = nthroot(sum((a1-rank1234(1,:)).^2)/getsize,2);
f2 = nthroot(sum((a2-rank1234(2,:)).^2)/getsize,2);
f3 = nthroot(sum((a3-rank1234(3,:)).^2)/getsize,2);
f4 = nthroot(sum((a4-rank1234(4,:)).^2)/getsize,2);
f = [f1,f2,f3,f4];
highest = 9999999;
for i=1:4
    if f(i)<highest;
        highest = i;
    end

%result = union(inter,rank1234(highest,:));
result = inter;
end