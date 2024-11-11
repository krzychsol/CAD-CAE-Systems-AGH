outputGif = 'output.gif';

for i = 0:1:120
    filename = sprintf('out_%d.png', i);
    img = imread(filename);
    [A, map] = rgb2ind(img, 256);
    
    if i == 0
        imwrite(A, map, outputGif, 'GIF', 'LoopCount', inf, 'DelayTime', 0.2);
    else
        imwrite(A, map, outputGif, 'GIF', 'WriteMode', 'append', 'DelayTime', 0.2);
    end
end
