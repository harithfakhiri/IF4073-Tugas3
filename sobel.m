clc
clear all
close all

I1 = imread('./img/2.jpg');
I1 = im2gray(I1);
k = 1;
I2 = padarray(I1, [k k], 'replicate');
[m, n] = size(I1);
sobel_math = [-1 -2 -1;0 0 0;1 2 1];
sobel_matv= [-1 0 1;-2 0 2;-1 0 1];

for i = 2 : (m - 1)
    for j = 2 : (n - 1)
        v = double(I2(i - 1 : i + 1, j - 1 : j + 1)) .* sobel_math;
        r = sum(v(:));
        c(i-1, j-1) = uint8(ceil(r));
    end
end

for i=2 : (m-1)
    for j=2 : (n-1)
        v1 = double(I2(i - 1 : i + 1, j - 1 : j + 1)) .* sobel_matv;
        r1 = sum(v1(:));
        c1(i-1, j-1) = uint8(ceil(r1));
    end
end

c2 = c + c1;

figure(2), imshow(c);
[x, y, z] = size(c1);
figure(3), imshow(c1);
figure(4), imshow(c2);


