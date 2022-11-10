
I = imread('img/buah1.png');
figure, imshow(img);
H = [-1 -1 -1; -1 8 -1; -1 -1 -1];
h = fspecial('log')
% J = processing_convo(double(I), double(H));
J = laplace(I, H);
Jlog = laplace(I, h);
figure, imshow(J)
figure, imshow(Jlog), title ('Hasil deteksi tepi dengan LoG');