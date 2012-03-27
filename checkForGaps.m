function output = checkForGaps(input)
    [L blobcount] = bwlabel(input);
    if blobcount>1, % чи є розриви
        P = regionprops(L,'BoundingBox');
        for i=1:blobcount-1, % перебираємо шматки
            bbCurrent = round(P(i).BoundingBox);
            bbNext    = round(P(i+1).BoundingBox);
            
            Xes= [bbCurrent(1) bbCurrent(3)-1 bbNext(1) bbNext(3)-1]; % усі ікси 2 сусідніх блобів
            Ys = [bbCurrent(2) bbCurrent(4)-1 bbNext(2) bbNext(4)-1]; % усі ігреки 2 сусідніх блобів
            sort(Xes);
            sort(Ys);

            %endX = bbCurrent(3)-1; % координати крайніх точок по сторонах розриву (не попарно)
            %endY = bbCurrent(4)-1;
            %nextX = bbNext(1);
            %nextY = bbNext(2);
           
            endX = Xes(2); % координати крайніх точок по сторонах розриву (не попарно)
            endY = Ys(2);
            nextX = Xes(3);
            nextY = Ys(3);
            
            if endY+1==nextY, 
                % розрив в цьому місці горизонтальний
                deltaX = nextX - endX - 1; % ширина горизонтального розриву
                patch = ones(deltaX,1); % готуємо горизонтальну латку
                input(endX+1:nextX-1, endY) = patch; % латаємо
            elseif endX+1==nextX, 
                % розрив в цьому місці вертикальний
                deltaY = nextY - endY - 1; % ширина вертикального розриву
                patch = ones(1,deltaY); % готуємо вертикальну латку
                input(endX,endY+1:nextY-1) = patch; % латаємо
            end;
            
        end;
    end;
    output = input;
end