function lab01()
  c = readMatrix(); 
  printf("Zero step:\n");
  disp(c);
  
  c = firstStep(c);
  printf("First step:\n");
  disp(c);
  
  c = secondStep(c);
  printf("Second step:\n");
  disp(c);
endfunction

function c = readMatrix()
  c = [
    10,  8,  6,  4,  9;
    11,  9, 10,  5,  6;
     5, 10,  8,  6,  4;
     3, 11,  9,  6,  6;
     8, 10, 11,  8,  7;
  ];
endfunction

function c = firstStep(c)
  [m, n] = size(c); 
  for i = 1:n
    colMin = c(1,i);
    for j = 2:m
      if c(j,i) < colMin
        colMin = c(j,i);
      endif
    endfor
    for j = 1:m
      c(j,i) -= colMin;
    endfor
  endfor
endfunction

function c = secondStep(c)
  [m, n] = size(c); 
  for i = 1:m
    strMin = c(i,1);
    for j = 2:n
      if c(i,j) < strMin
        strMin = c(i,j);
      endif  
    endfor
    for j = 1:n
      c(i,j) -= strMin;
    endfor
  endfor
endfunction
