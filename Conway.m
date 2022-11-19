% Any live cell with two or three live neighbours survives.
% Any dead cell with three live neighbours becomes a live cell.
% All other live cells die in the next generation. Similarly, all other dead cells stay dead.
clear
clf

N = 20; % number of rows
M = 25; % number of columns

rows = 1:N;
topRows = mod(rows-2,N)+1;
bottomRows = mod(rows,N)+1;

cols = 1:M;
leftCols = mod(cols-2,M)+1;
rightCols = mod(cols,M)+1;

grid = randi([0,1], N, M);
k = zeros(N, M, 8); % neighbours

imshow(grid)
axis('equal')
title('0')

for n = 1:100
  k(:,:,1) = grid(topRows, leftCols); % top left
  k(:,:,2) = grid(topRows, cols); % top
  k(:,:,3) = grid(topRows, rightCols); % top right
  k(:,:,4) = grid(rows, leftCols); % left
  k(:,:,5) = grid(rows, rightCols); % right
  k(:,:,6) = grid(bottomRows, leftCols); % bottom left
  k(:,:,7) = grid(bottomRows, cols); % bottom
  k(:,:,8) = grid(bottomRows, rightCols); % bottom right
  neighbours = sum(k,3);
  # Conways game of life
  grid = ((grid & neighbours==2) | neighbours==3 );
  # Display
  imshow(grid)
  title(n)
  drawnow
end
