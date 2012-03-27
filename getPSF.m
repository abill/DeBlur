function psf=getPSF(im,imageMask)
    trace = getTrace(im,imageMask);
    psf = getPSFValues(im,imageMask,trace);
end