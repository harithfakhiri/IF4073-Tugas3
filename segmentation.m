function  segmented  = segmentation(img, edge_img, type)
    closed_image = imclose(edge_img,strel('line',10,0));

    if type == "canny"
        closed_image = imfill(closed_image,'holes');
    end

    opened_image = imopen(closed_image, strel(ones(3,3)));
    mask_image = bwareaopen(opened_image,1500);
    
    size(mask_image)
    size(img(:,:,1))
    red_processed = img(:,:,1).*uint8(mask_image);
    green_processed = img(:,:,2).*uint8(mask_image);
    blue_processed = img(:,:,3).*uint8(mask_image);
    segmented = cat(3, red_processed, green_processed, blue_processed);
end