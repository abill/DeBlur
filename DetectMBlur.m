function resultMask = DetectMBlur(image)
    [height width depth] = size(image);
    %resultMask = zeros(height, width);
    determins = zeros(height, width); % матриц€ визначник≥в матриць-окол≥в кожноњ точки вх≥дного зображенн€
    
    for i = 2:height -1,
        for j = 2:width -1,
            matrTemp = double(image(i-1:i+1, j-1:j+1, 1));
            determins(i,j) = det(matrTemp)/sum(sum(matrTemp));
            
        end;
    end;
    
    mediana = sum(sum(determins))/(height*width);
    resultMask = determins>mediana;  
end