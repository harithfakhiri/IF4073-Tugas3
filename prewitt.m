function  prewitt_edged  = prewitt(img)
    img = im2gray(img);
    Px = [-1 0 1; -1 0 1; -1 0 1];
    Py = [-1 -1 -1; 0 0 0; 1 1 1];
    Jx = conv2(double(img), double(Px), 'same');
    Jy = conv2(double(img), double(Py), 'same');
    prewitt_edged = uint8(sqrt(Jx.^2 + Jy.^2));
end