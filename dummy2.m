clear all
im = imread('img/buah2.png');
im_original = im;
im = double(im2gray(im)); %set image to grey
im = imresize(im,[3200,3200]);%resize
%Remove Background
I = RemoveBackground(im);
figure(1)
imshow(I,[])
%Remove gaussian noise (IE random noise in image)
figure(2)
DoS = 500; %degree of smoothing
I = imbilatfilt(I,DoS);
imshow(I,[])
%Apply filter to remove salt and pepper noise (white / black 'dots' in
%image)
%A median filter should do this.
m = 25; n = 25; %sets size of filter
I = medfilt2(I,[m,n]);
figure(3)
imshow(I,[])
%gradient across image to highlight edges
figure(4)
I = imgradient(I,'sobel');
imshow(I,[])
%find edge using canny filter
figure(5)
I = edge(I,'Canny',[0 0.15]); %compared this with 'prewitt' filter and this one was much better
imshow(I,[])