function result = histogram( mIn , range)
	result = zeros(1,range);
	[height width] = size(mIn);

	for y = 1:height   
	    for x=1:width
	        result(mIn(y,x) + 1) =  result(mIn(y,x) + 1) + 1;       
	    end
	end

