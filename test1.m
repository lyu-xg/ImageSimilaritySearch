
LBPTable = lsh('e2lsh',14, 11, 256, LBPFeatures','range',1);
lshstats(LBPTable,100);

ColorCorrelogramsTable = lsh('e2lsh',14, 7, 64, ColorCorrelograms','range',1);
lshstats(ColorCorrelogramsTable,100)

ColorFeaturesTable = lsh('e2lsh',12,4,9,ColorFeatures','range',1);
lshstats(ColorFeaturesTable,100);

FouriersTable = lsh('e2lsh',12,18,52,Fouriers','range',1);
lshstats(FouriersTable,100);