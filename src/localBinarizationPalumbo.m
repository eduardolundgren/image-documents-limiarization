function [imgOut] = localBinarizationPalumbo(img)
	img = double(img);
	imgOut = zeros(size(img));
	[height, width] = size(img);

	M1 = 20; M2 = 20; M3 = 0.85; M4 = 1.0; M5 = 0.0;

	for i = 5:height - 5
		for j= 5:width - 5

			if img(i,j) < M1
				imgOut(i,j) = 1;
			else
				A1 = img(i,j)+ img(i,j-1)+ img(i,j+1) + img(i-1,j) + img(i-1, j-1) + img(i-1, j+1) + img(i+1,j) + img(i+1, j-1) + img(i+1, j+1);
				count = 0;
				A2a = 0;
				for k = i -3: i
					for l = j - 3: j
						 A2a = img(k,l)+ img(k,l-1)+ img(k,l+1) + img(k-1,l) + img(k-1, l-1) + img(k-1, l+1) + img(k+1,l) + img(k+1, l-1) + img(k+1, l+1);
						count = count + 1;
					end
				end

				A2b = 0;
				for k = i -3: i
					for l = j + 3: j
						 A2b = img(k,l)+ img(k,l-1)+ img(k,l+1) + img(k-1,l) + img(k-1, l-1) + img(k-1, l+1) + img(k+1,l) + img(k+1, l-1) + img(k+1, l+1);
						count = count + 1;
					end
				end

				A2c = 0;
				for k = i + 3: i
					for l = j - 3: j
						 A2c = img(k,l)+ img(k,l-1)+ img(k,l+1) + img(k-1,l) + img(k-1, l-1) + img(k-1, l+1) + img(k+1,l) + img(k+1, l-1) + img(k+1, l+1);
						count = count + 1;
					end
				end

				A2d = 0;
				for k = i + 3 : i
					for l = j + 3: j
						 A2d = img(k,l)+ img(k,l-1)+ img(k,l+1) + img(k-1,l) + img(k-1, l-1) + img(k-1, l+1) + img(k+1,l) + img(k+1, l-1) + img(k+1, l+1);
						count = count + 1;
					end
				end

				A2 = (A2a + A2b + A2c + A2d) / count;

				if(A2*M3+M5) > A1*M4
					imgOut(i,j) = 1;
				end

			end

		end
	end