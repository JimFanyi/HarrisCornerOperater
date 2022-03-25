function [outputSize, deltaShift] = calcOutputSize(inputSize, A, type)
% type 有两种，一种是 loose， 一种是crop，参考imrotate命令的帮助文件
% 需要实现这两种
% 'crop'
% Make output image B the same size as the input image A, cropping the rotated image to fit
% {'loose'}
% Make output image B large enough to contain the entire rotated image. B is larger than A

% 获取图像的行和列的总数，其中行方向对应着y方向，列方向对应着x方向    
ny = inputSize(1);
nx = inputSize(2);

% 计算四个顶点的齐次坐标
inputBoundingBox = [ 1  1 1;...
                    nx  1 1;...
                    nx ny 1;...
                     1 ny 1];
inputBoundingBox = inputBoundingBox';

% 获取输入图像经过仿射变换后在输出图像中的框
outputBoundingBox = A * inputBoundingBox;

% 找到输出图像的紧致的框
xlo = floor(min(outputBoundingBox(1,:)));
xhi =  ceil(max(outputBoundingBox(1,:)));
ylo = floor(min(outputBoundingBox(2,:)));
yhi =  ceil(max(outputBoundingBox(2,:)));

if strcmp(type,'loose')==1
    outputSize(1) = xhi-xlo+1;
    outputSize(2) = yhi-ylo+1;
    deltaShift(1) = -xlo+1;
    deltaShift(2) = -ylo+1;
elseif strcmp(type,'crop')==1
    outputSize(1) = inputSize(2);
    outputSize(2) = inputSize(1);
    deltaShift(1) = -(xlo+xhi-outputSize(1)-1)/2;
    deltaShift(2) = -(ylo+yhi-outputSize(2)-1)/2;
end
end