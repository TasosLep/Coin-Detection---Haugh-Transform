function TenCents = ten_cents(IMG,Sobel_apply_to_Image)

[height,width, channels] = size(IMG); %dimensions
count = 0;
r = 38.25;
numThetas = 200; %angle discretization
th = 0 : (2*pi) / 200 : 2*pi; %save in a matrix the discretized thetas
Ten_cents = HT(r, th,Sobel_apply_to_Image);

	for yy = 1:height
		for xx = 1:width
			if(Ten_cents(xx,yy) > 165)
				for vote = 1:numThetas
					theta = th(vote); %getting the theta value
					y = floor(yy - sin(theta) * r);
					x = floor(xx - cos(theta) * r);
					if (x > 0 && x <= height && y > 0 && y <= width)
						hold on;
						plot(x,y, 'y-') % yellow color
					end
			
				end
				count = count + 1;
			end
		end
	end
print = ['There are ', num2str(count), ' 10-Cent coins in the image'];
disp(print); %printing
end