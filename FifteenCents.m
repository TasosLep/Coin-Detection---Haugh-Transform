function FifteenCents = fifteen_cents(IMG,Sobel_apply_to_Image)

[height,width, channels] = size(IMG); %dimensions
count = 0;
r = 46.92;
r_two = 51;
numThetas = 200; %angle discretization
th = 0 : (2*pi) / 200 : 2*pi; %save in a matrix the discretized thetas
Fifteen_cents = HT(r, th,Sobel_apply_to_Image);
Two_euros = HT(r_two, th,Sobel_apply_to_Image);

	for yy = 1:height
		for xx = 1:width
			if(Fifteen_cents(xx,yy) >= 150 && Fifteen_cents(xx,yy) <= 195 && Two_euros(xx,yy) <= 100)
				for vote = 1:numThetas
					theta = th(vote); %getting the theta value
					x = floor(xx - cos(theta) * r);
					y = floor(yy - sin(theta) * r);
					if (x > 0 && x <= height && y > 0 && y <= width)
						hold on;
						plot(x,y, 'g-') % green color
					end			
					
				end
				count = count + 1;
			end
		end
	end
print = ['There are ', num2str(count), ' 50-Cents coins in the image'];
disp(print); %printing
end