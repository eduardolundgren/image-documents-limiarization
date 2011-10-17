clear all
close all

%
% Document Image 1
%

img = imread('../assets/doc1.jpg');
% figure, imshow(I);

imgBw = niblack(img);
% imgBw = ~im2bw(img, 0.8);
% I = imgBw;
% figure, imshow(I);


I = imdilate(imgBw, strel('line', 5, 0));
% figure, imshow(I);

I = imerode(I, strel('line', 20, 0));
% figure, imshow(I);

I = imerode(I, strel('line', 3, 90));
% figure, imshow(I);

I = imdilate(I, strel('line', 70, 0));
% figure, imshow(I, [0 1]);

[imgOut, regionProps] = findImageLines(I);
% figure, imshow(imgOut);

plotImageLines(img, regionProps);

% break;

%
% Document Image 2
%

img = imread('../assets/doc2.jpg');

imgBw = ~im2bw(img, 0.25);

[imgOut, regionProps] = findImageLines(imgBw, 10, 150, 25, 2000, [100; 0]);
% figure, imshow(imgOut);

plotImageLines(img, regionProps);