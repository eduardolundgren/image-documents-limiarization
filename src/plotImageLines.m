function plotImageLines(img, regionProps)
	setDefaultValue(1, 'img', img);

	figure, imshow(img);
	title(['Number of lines: ', num2str(length(regionProps))]);
	hold on;
	for i = 1:length(regionProps)
		rectangle('Position', regionProps(i).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
	end
	hold off;
	