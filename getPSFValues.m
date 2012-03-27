function psf = getPSFValues(im,imageMask,trace) % заповнення траекторії значеннями
    [PSFheight PSFwidth] = size(trace);
    psf = zeros(PSFheight, PSFwidth);
    counter = 0;
    [height width] = size(im(:,:,1));
    for y=1:height-PSFheight,
        for x=1:width-PSFwidth,
            if imageMask(y,x) && imageMask(y+PSFheight-1,x+PSFwidth-1), % чи влізає апертура в маску
                psf = psf + updatePsf(y,x,im,trace);
                counter = counter +1;
            end;
        end;
    end;
    psf = psf./counter;
    psf = psf./sum(sum(psf)); % нормалізувати на 1
end