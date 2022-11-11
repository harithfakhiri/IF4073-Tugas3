clc
clear all
close all

I1 = imread('./img/2.jpg');
I1 = im2gray(I1);
figure, imshow(I1);
k = 1;
I2 = padarray(I1, [k k], 'replicate');
[m, n] = size(I1);
robert_x = [1 0; 0 -1];
robert_y= [0 1; -1 0];

%}
c1 = conv2(double(I2), double(robert_x), 'same');
c2 = conv2(double(I2), double(robert_y), 'same');

c = sqrt(c1.^2 + c1.^2);

figure(2), imshow(uint8(c));
figure(3), imshow(uint8(c1));
figure(4), imshow(uint8(c2));


