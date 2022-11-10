
I = imread('img/buah1.png');
figure, imshow(I);
% J = processing_convo(double(I), double(H));
J = laplace(I);
Jlog = log_edge(I);
%figure, imshow(J);
%figure, imshow(Jlog), title ('Hasil deteksi tepi dengan LoG');
%BW = edge(im2gray(I), 'prewitt');
%figure, imshow(BW)
prew = prewitt(I);

figure, imshow(uint8(prew)), title ('Hasil deteksi tepi dengan prewitt');

can_edged = canny(I);
figure, imshow(can_edged), title ('Hasil deteksi tepi dengan canny');
