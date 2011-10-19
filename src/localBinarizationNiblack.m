function [imgOut] = localBinarizationNiblack(img, blockSize, weight)
	setDefaultValue(2, 'blockSize', 31);
	setDefaultValue(3, 'weight', -0.8);

	imgOut = double(rgb2gray(img));

	localMean = filter2(ones(blockSize), imgOut) / (blockSize*blockSize);
	localVar = filter2(ones(blockSize), imgOut.^2) /(blockSize*blockSize) - localMean.^2;
	localStd = sqrt(localVar);

	t = localMean+weight*localStd;

	imgOut = imgOut < t;