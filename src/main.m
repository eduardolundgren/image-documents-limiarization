clear all
close all

%
% Document Image 1
%

img = imread('../assets/doc1.jpg');
imgBw = ~im2bw(img, graythresh(img));
% imgBw = localBinarizationNiblack(img);
% imgBw = globalBinarizationHistogramWULU(img);
% imgBw = localBinarizationPalumbo(img);
% figure, imshow(imgBw);

I = imdilate(imgBw, strel('line', 5, 0));
I = imerode(I, strel('line', 20, 0));
I = imerode(I, strel('line', 3, 90));
I = imdilate(I, strel('line', 70, 0));

[imgOut, regionProps] = findImageLines(I);
figure, imshow(imgOut);
plotImageLines(img, regionProps);

%
% Document Image 2
%

img = imread('../assets/doc2.jpg');
imgBw = ~im2bw(img, 0.25);
% imgBw = localBinarizationNiblack(img);
% imgBw = globalBinarizationHistogramWULU(img);
% imgBw = localBinarizationPalumbo(img);
[imgOut, regionProps] = findImageLines(imgBw, 10, 150, 25, 2000, [100; 0]);
% plotImageLines(img, regionProps);