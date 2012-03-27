function [output dimension] = clearinitzeros(input)
[d1 d2]=size(input);
dimension = d1*d2;
for i=1:dimension,
  if input(1,i)~=0, break; end;  
end;
output=input(i:dimension);
dimension = dimension-i+1;
end