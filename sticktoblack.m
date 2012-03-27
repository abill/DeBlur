function outim = sticktoblack(inim,psf)
[ImHeight ImWidth depth]  =size(inim); %#ok<NASGU>
[PSFHeight PSFWidth]=size(psf);
lineprocessed= zeros(1,ImWidth);
outim = inim;
acc = 0;
bkcolor = inim(1,1,:);
replacecolor=[0 0 0];
for j=1:ImWidth;
    for i=1:ImHeight;
        currpoint=inim(i,j,:);
        if ~isequal(currpoint,bkcolor),
            if lineprocessed(1,j)==0,
                for n=1:PSFHeight;
                    for m=1:PSFWidth;
                        if psf(n,m)~=0,
                            acc(1,1) = acc(1,1)+psf(n,m);
                            outim(i+n-1,j+m-1,:)=(outim(i+n-1,j+m-1,:)-bkcolor(1,1,1)*(1-acc(1,1)));
                        end; 
                    end;
                end;
                acc = 0;
                
                %ще раз, але знизу
                for k=1:ImHeight;
                    currpoint=inim(ImHeight+1-k,j,:);
                    if ~isequal(currpoint,bkcolor),
                       for n=1:PSFHeight;
                        for m=1:PSFWidth;
                            if psf(PSFHeight+1-n,m)~=0,
                                acc(1,1) = acc(1,1)+psf(PSFHeight+1-n,m);
                                outim(ImHeight+1-k-n+1,j-m+1,:)=(outim(ImHeight+1-k-n+1,j-m+1,:)-bkcolor(1,1,1)*(1-acc(1,1)));
                            end; 
                        end;
                       end;
                       acc = 0; 
                       break;
                    end;
                end;
                % кінець того, що ще раз, але знизу
                
                lineprocessed(1,j)=1;
            end;
         else outim(i,j,:)=replacecolor;
        end;
    end;
end;

end