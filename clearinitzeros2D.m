function [output dimension1 dimension2] = clearinitzeros2D(input)
[dimension1 dimension2]=size(input);
for i=1:dimension1,
  if sum(input(i,:))~=0, break; end;  
end;
for j=1:dimension2,
  if sum(input(:,j))~=0, break; end;  
end;
if i>1, input(1:i-1,:)=[]; end;
if j>1, input(:,1:j-1)=[]; end;

[dimension1 dimension2]=size(input);
for i=1:dimension1,
  if sum(input(dimension1-i+1,:))~=0, break; end;  
end;
for j=1:dimension2,
  if sum(input(:,dimension2-j+1))~=0, break; end;  
end;
if i>1, input(dimension1-i+2:dimension1,:)=[]; end;
if j>1, input(:,dimension2-j+2:dimension2)=[]; end;

[dimension1 dimension2]=size(input);
output=input;
end