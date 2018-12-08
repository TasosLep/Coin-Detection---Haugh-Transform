function HT = HoughCircle(radius,Thetas,Image)

[height, width, channels] = size(Image); % dimensions

numThetas = 200; %angel discretization
VOTES = zeros(width,height); %initialize the accumulator

for y = 1:height
	for x = 1:width
		if(Image(y,x) > 0.35) %count only the pixels with value greater than 0.35
			for vote = 1:numThetas
				theta = Thetas(vote); %getting the theta value
				dist1 = floor(x - radius *cos(theta));
				dist2 = floor(y - radius *sin(theta));
				if(dist1 > 0 && dist1 <= width && dist2 > 0 && dist2 <= height)
					VOTES(dist1, dist2) = VOTES(dist1, dist2) + 1;
				end
			end
		end
	end
end
HT = VOTES;
end