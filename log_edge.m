function  log_img  = log_edge(img)
    img = im2gray(img);
    kernel = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];
    log_img = uint8(convn(img, kernel, 'same'));
end