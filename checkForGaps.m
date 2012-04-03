function output = checkForGaps(input, seekVertical)
    [L blobcount] = bwlabel(input);
    if blobcount>1, % чи є розриви
        P = regionprops(L,'BoundingBox');
        for i=1:blobcount, % перебираємо шматки попарно
          for j=1:blobcount,
            if i==j, continue; end;
            
            bbCurrent = round(P(i).BoundingBox);
            bbNext    = round(P(j).BoundingBox);
            
            Xes= [bbCurrent(1) bbCurrent(1)+bbCurrent(3)-1 bbNext(1) bbNext(1)+bbNext(3)-1]; % усі ікси 2 сусідніх блобів
            Ys = [bbCurrent(2) bbCurrent(2)+bbCurrent(4)-1 bbNext(2) bbNext(2)+bbNext(4)-1]; % усі ігреки 2 сусідніх блобів
            Xes = sort(Xes);
            Ys =  sort(Ys);
           
            endX = Xes(2); % координати крайніх точок по сторонах розриву (не попарно)
            endY = Ys(2);
            nextX = Xes(3);
            nextY = Ys(3);
            
            if ~seekVertical && endY+1==nextY, 
                % розрив в цьому місці горизонтальний
                deltaX = nextX - endX - 1; % ширина горизонтального розриву
                patch = ones(deltaX,1); % готуємо горизонтальну латку
                input(endY, endX+1:nextX-1) = patch; % латаємо
            elseif seekVertical && endX+1==nextX, 
                % розрив в цьому місці вертикальний
                deltaY = nextY - endY - 1; % ширина вертикального розриву
                patch = ones(1,deltaY); % готуємо вертикальну латку
                input(endY+1:nextY-1, endX) = patch; % латаємо
            end;
            
          end;
        end;
    end;
    output = input;
end