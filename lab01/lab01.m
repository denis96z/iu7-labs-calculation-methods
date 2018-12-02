function lab01()
  c = readMatrix(); 
  printf("Zero step:\n");
  disp(c);
  
  c = decCols(c);
  printf("First step:\n");
  disp(c);
  
  c = decRows(c);
  printf("Second step:\n");
  disp(c);
  
  cSIZ = getPrimarySIZ(c);
  printf("Third step:\n");
  disp(cSIZ);
endfunction

function c = readMatrix()
  c = [
    10,  8,  6,  4,  9;
    11,  9, 10,  5,  6;
     5, 10,  8,  6,  4;
     3, 11,  9,  6,  6;
     8, 10, 11,  8,  7;
  ];
  
  [m, n] = size(c);
  assert(m == n);
endfunction

function c = decCols(c)
  [n, _] = size(c);
  for i = 1:n
    colMin = c(1,i);
    for j = 2:n
      if c(j,i) < colMin
        colMin = c(j,i);
      endif
    endfor
    for j = 1:n
      c(j,i) -= colMin;
    endfor
  endfor
endfunction

function c = decRows(c)
  [n, _] = size(c);
  for i = 1:n
    rowMin = c(i,1);
    for j = 2:n
      if c(i,j) < rowMin
        rowMin = c(i,j);
      endif  
    endfor
    for j = 1:n
      c(i,j) -= rowMin;
    endfor
  endfor
endfunction

function cSIZ = getPrimarySIZ(c)
  [n, _] = size(c);
  cSIZ = zeros(n, n);
  for i = 1:n
    for j = 1:n
      if c(j,i) == 0
        rowHasZero = false;
        
        for k = 1:n
          if cSIZ(j,k) == 1
            rowHasZero = true;
            break;
          endif
        endfor
        
        if !rowHasZero
          cSIZ(j,i) = 1;
        endif
      endif
    endfor
  endfor
endfunction
