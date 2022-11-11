function  log_img  = log_edge(img)
    
    %figure, imshow(img);
    img = im2gray(img);
    %img = imgaussfilt(img,1.4);
    %kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    kernel = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];
    % J = processing_convo(double(I), double(H));
    log_img = uint8(convn(img, kernel, 'same'));
end