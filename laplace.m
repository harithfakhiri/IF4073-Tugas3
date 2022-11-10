function  laplace_edged  = laplace(img, kernel)
    
    figure, imshow(img);
    % J = processing_convo(double(I), double(H));
    laplace_edged = uint8(convn(img, kernel));
end