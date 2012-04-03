function [EdgeL EdgeR] = findEdge(input,XY)
[y x]=size(input);
output =zeros(y,x);
output2=zeros(y,x);
if XY>0,
    for j=1:x;
        for i=1:y;
            if input(i,j)>0,
                output(i,j)=1;
                break;
            end;
        end;
    end;
    for j=1:x;
        for tempi=1:y;
            i=y-tempi+1;
            if input(i,j)>0,
                output2(i,j)=1;
                break;
            end;
        end;
    end;
else
    for i=1:y;
        for j=1:x;
            if input(i,j)>0,
                output(i,j)=1;
                break;
            end;
        end;
    end;
    for i=1:y;
        for tempj=1:x;
            j=x-tempj+1;
            if input(i,j)>0,
                output2(i,j)=1;
                break;
            end;
        end;
    end;
end;
EdgeR=checkForGaps(output2, XY); % перевіряєм чи нема розривів в лінії, як є  - заповнюємо їх
EdgeL=checkForGaps(output, XY);
end