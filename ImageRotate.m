function output = ImageRotate(filename)
    I = imread(filename);
    result = imrotate(I,90,'nearest');
    output = result;
end