function [imgOut] = globalBinarizationHistogramWULU(img)
	imgTmp = img;
	prob = zeros(256,1);
	HOHB = zeros(256,1);

	hist = histogram(imgTmp, 256);
	[height, width] = size(imgTmp);

	for i = 1:256
	   prob(i) = double(hist(i))/double(width*height);
	end

	for i = 1:256
		pAcc = 0;
		for j = 1: i
			pAcc = pAcc + prob(j);
		end
		HO = 0;
		for k = 1: i
			temp = double(prob(k))/double(pAcc);
			if temp > 0
				HO = HO - temp*log(temp);
			end
		end
		HB = 0;
		for k = i + 1: 256
			temp = double(prob(k))/double(1-pAcc);
			if temp > 0
			   HB = HB - temp*log(temp);
			end
		end
		HOHB(i) = abs(HO-HB);
	end

	threshold = 0;
	minHOHB = HOHB(1);

	for i = 2: 256
		if HOHB(i) < minHOHB
			threshold = i;
			minHOHB = HOHB(i);
		end
	end

	 imgOut = ones(height, width);

	 for i = 1: height
		 for j = 1: width
			 if imgTmp(i,j)>=threshold
				 imgOut(i,j) = 0;
			 end
		 end
	 end

