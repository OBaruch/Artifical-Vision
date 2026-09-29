%Correspondencia de características
clear im1 Im1 im2 Im2
im1=getsnapshot(vid);
imshow(im1)

im2=getsnapshot(vid);



Im1 = rgb2gray(im1);
Im2 = rgb2gray(im2);
puntos1 = detectHarrisFeatures(Im1);
puntos2 = detectHarrisFeatures(Im2);
[f1, vpts1] = extractFeatures(Im1, puntos1);
[f2, vpts2] = extractFeatures(Im2, puntos2);
indexPairs = matchFeatures(f1, f2) ;
matchedPoints1 = vpts1(indexPairs(1:10, 1));
matchedPoints2 = vpts2(indexPairs(1:10, 2));
figure; ax = axes;
showMatchedFeatures(Im1,Im2,matchedPoints1,matchedPoints2,'montage','Parent',ax);
title(ax, 'Correspondencias puntos candidatos');
legend(ax, 'Correspondencias puntos 1','Correspondencias puntos 2');