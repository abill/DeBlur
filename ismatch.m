function [result,output] = ismatch (input1,input2)
result=isequal(input1,input2);
if result,
  output=input1;  
else
    if sum(sum(input1))>=sum(sum(input2)),
    output=input1; lesser=input2; else output=input2; lesser=input1; end;
    sumbigX=sum(output,1);
    sumsmallX=sum(lesser,1);
    if sum(sumbigX)/sum(sumsmallX)>=5, return;end;
    sumbigY=sum(output,2);
    sumsmallY=sum(lesser,2);
    if ~(all(sumbigX)&&all(sumbigY)&&all(sumsmallY)&&all(sumsmallX)),return,end;
    commX=findstr(sumbigX,sumsmallX);
    commY=findstr(sumbigY',sumsmallY');
    if size(commX)==0, commX=0; end;
    if size(commY)==0, commY=0; end;
    if (commX(1)==0)&&(commY(1)==0), return; end;
    if commY(1)~=0, a=find(output(commY(1),:)); else a=0; end; % шукаємо як по графіку іншу координату тої самої точки
    if size(a)>0, a=a(1); else a=0; end;
    if (a>0)&&(commX(1)==a), result=true; % якщо крива лінія без країв на прямих ділянках
    else
      if (commX(1)>0),  
          if size(sumbigY')==size(sumsmallY'), result=true; end; % якщо просто пряма горизонтальна лінія 
      end;
      if (commY(1)>0),
          if size(sumbigX)==size(sumsmallX), result=true; end; % якщо просто пряма вертикальна лінія 
      end;
    end;
end;
end