function  edgeImg  = sobel(img)
    inputImg = im2gray(img);
    [m, n] = size(inputImg);
    sobelX = [-1 -2 -1; 0 0 0; 1 2 1];
    sobelY = [-1 0 1; -2 0 2; -1 0 1];

    edgeX = convn(double(inputImg), double(sobelX), 'same');
    edgeY = convn(double(inputImg), double(sobelY), 'same');

    edge = sqrt(edgeX.^2 + edgeY.^2);

    edgeImg = uint8(edge);
end


