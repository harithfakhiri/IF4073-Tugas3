function  edgeImg  = roberts(img)
    inputImg = im2gray(img);
    [m, n] = size(inputImg);
    robertX = [1 0; 0 -1];
    robertY= [0 1; -1 0];
    
    edgeX = conv2(double(inputImg), double(robertX), 'same');
    edgeY = conv2(double(inputImg), double(robertY), 'same');
    
    edge = sqrt(edgeX.^2 + edgeY.^2);

    edgeImg = uint8(edge);
end


