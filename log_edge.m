function  log_img  = log_edge(img)
    
    %figure, imshow(img);
    img = im2gray(img);
    img = imgaussfilt(img,1.2);
    kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    % J = processing_convo(double(I), double(H));
    log_img = uint8(convn(img, kernel));
end