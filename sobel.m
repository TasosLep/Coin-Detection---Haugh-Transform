function A = sobel(IMG)

[width, height, channels] = size(IMG);

assert(channels == 1, 'A grayscale image should be provided');

%Sobel filter kernel
Gx = [-1 0 1; -2 0 2; -1 0 1];
Gy = [-1 -2 -1; 0 0 0; 1 2 1];

GRADIENT_X = conv2(IMG, Gx);
GRADIENT_Y = conv2(IMG, Gy);

A = abs(GRADIENT_X) + abs(GRADIENT_Y);

end