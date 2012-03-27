function psf = updatePsf(posY,posX,im,trace)
    prevPoint = -1;
    [PSFheight PSFwidth] = size(trace);
    tempPsf = zeros(PSFheight, PSFwidth);
    for y=1:PSFheight,
        for x=1:PSFwidth,
            if trace(y,x)==1,
                if prevPoint ~= -1, % не перша знайдена ненульова точка
                    tempPsf(prevPosY,prevPosX) = uint8(abs(int32(sum(im(posY + y-1, posX + x-1,  :)))- prevPoint));
                    tempPsf(y,x) = tempPsf(prevPosY,prevPosX);
                    % йдемо зі зміщенням остання точка бо рахуємо різницю
                    % остання точка просто копіюється з попереднього
                    % значення
                end;
                prevPoint = int32(sum(im(posY + y-1, posX + x-1,  :))); % сума 
                prevPosX = x;
                prevPosY = y;
            end; 
        end;
    end;
    psf = tempPsf;
end