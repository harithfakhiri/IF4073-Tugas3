
I = imread('img/buah1.png');
figure, imshow(I);
% J = processing_convo(double(I), double(H));
J = laplace(I);
Jlog = log_edge(I);
prew = prewitt(I);
prewi = uint8(prew);

can_edged = canny(I);

figure, imshow(J), title ('Hasil deteksi tepi dengan prewitt');
segmentation(I, can_edged, "canny");


can_edged = canny(I);
%figure, imshow(can_edged), title ('Hasil deteksi tepi dengan canny');
