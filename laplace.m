function  laplace_edged  = laplace(img)
    img = im2gray(img);
    kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    laplace_edged = uint8(convn(img, kernel, 'same'));
end