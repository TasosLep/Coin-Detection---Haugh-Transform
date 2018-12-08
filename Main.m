clear;
clf;
Image = imread('coins008.tif'); %load the image

Image = single(Image)/255;%unit8 to [0 1] range

[height,width, channels] = size(Image); %dimensions of the image

GrayImage = grayscale(Image); %image in grayscale

Sobel_apply_to_Image = sobel(GrayImage); %sobel

disp('Please wait...');

subplot(1,4,1),imshow(Image),title('Original Image'); 

subplot(1,4,2),imshow(GrayImage),title('Gray Scaled Image');

subplot(1,4,3),imshow(Sobel_apply_to_Image),title('Sobel Filtered Image');

subplot(1,4,4);
imshow(Image),title('Final Image');

subplot(1,4,4);
TWOEUROS(Image,Sobel_apply_to_Image);
OneEuro(Image,Sobel_apply_to_Image);
FifteenCents(Image,Sobel_apply_to_Image);
TenCents(Image,Sobel_apply_to_Image);