function output = ImageAffine(inputImage)
I = imread(inputImage);
tform = affine2d([2 0.33 0;; 0 1 0; 0 0 1]);
%tform1 = maketform('affine',xform);
J = imwarp(I,tform);
%figure,imshow(J);
output = J;
end

