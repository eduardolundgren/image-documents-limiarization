function [imgOut, regionProps] = findImageLines(img, minHeight, maxHeight, minWidth, maxWidth, dilate, erode)
	setDefaultValue(2, 'minHeight', 3);
	setDefaultValue(3, 'maxHeight', 20);
	setDefaultValue(4, 'minWidth', 100);
	setDefaultValue(5, 'maxWidth', 10000);
	setDefaultValue(6, 'dilate', [90, 10; 0 90]);
	setDefaultValue(7, 'erode', []);

	imgBw = bwlabel(img);
	initialProps = regionprops(imgBw, 'BoundingBox');

	BB = cat(1, initialProps.BoundingBox);
	bbHeight = BB(:, 4);
	bbWidth = BB(:, 3);
	indexes = find((bbHeight >= minHeight) & (bbHeight <= maxHeight) & (bbWidth >= minWidth) & (bbWidth <= maxWidth));
	imgOut = ismember(imgBw, indexes);

	[dRows, dCols] = size(dilate);
	for i = 1:dCols
		imgOut = imdilate(imgOut, strel('line', dilate(1, i), dilate(2, i)));
	end

	[eRows, eCols] = size(erode);
	for i = 1:eCols
		imgOut = imerode(imgOut, strel('line', erode(1, i), erode(2, i)));
	end

	regionProps = regionprops(imgOut, 'BoundingBox');