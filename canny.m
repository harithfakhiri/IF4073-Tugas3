function  canny_edged  = canny(img)
    img = im2gray(img);

    canny_edged = edge(img, 'Canny');
end