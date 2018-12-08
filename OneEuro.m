function OneEuro = one_euro(IMG,Sobel_apply_to_Image)

[height,width, channels] = size(IMG); %dimensions
count = 0;
r = 43.35;
r_fifteen = 46.92;
numThetas = 200; %angle discretization
th = 0 : (2*pi) / 200 : 2*pi; %save in a matrix the discretized thetas
One_euro = HT(r, th,Sobel_apply_to_Image);
Fifteen_cents = HT(r_fifteen, th,Sobel_apply_to_Image);

	for yy = 1:height
		for xx = 1:width
			if(One_euro(xx,yy) > 170 && One_euro(xx,yy) < 180 && Fifteen_cents(xx,yy) <= 165) 
				for vote = 1:numThetas
					theta = th(vote); %getting the theta value
					x = floor(xx - cos(theta) * r);
					y = floor(yy - sin(theta) * r);
					if (x > 0 && x <= height && y > 0 && y <= width)
						hold on;
						plot(x,y, 'r-') % red color
					end				
					
				end
				count = count + 1;
			end
		end
	end
print = ['There are ', num2str(count), ' 1-Euro coins in the image'];
disp(print); %printing
end