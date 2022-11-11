function  laplace_edged  = laplace(img)
    
    % figure, imshow(img);
    img = im2gray(img);
    [M,N,D]=size(img);
    kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    % J = processing_convo(double(I), double(H));
    laplace_edged = uint8(convn(img, kernel, 'same'));
end