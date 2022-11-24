% Any live cell with two or three live neighbours survives.
% Any dead cell with three live neighbours becomes a live cell.
% All other live cells die in the next generation. Similarly, all other dead cells stay dead.
clear
clf

N = 20; % number of rows
M = 25; % number of columns

rows = 1:N;
topRows = mod(rows-2, N) + 1;
bottomRows = mod(rows, N) + 1;

cols = 1:M;
leftCols = mod(cols-2, M) + 1;
rightCols = mod(cols, M) + 1;

# Random start
grid = randi([0,1], N, M);

imshow(grid)
axis('equal')
title('0')

for n = 1:100
  # Get the 8 neighbours on a 3D array and sum them on the 3rd dimension
  neighbours = sum(
    cat(
    3,
    grid(topRows, leftCols),
    grid(topRows, cols),
    grid(topRows, rightCols),
    grid(rows, leftCols),
    grid(rows, rightCols),
    grid(bottomRows, leftCols),
    grid(bottomRows, cols),
    grid(bottomRows, rightCols)
    )
  ,3);

  # Conways game of life
  grid = ((grid & neighbours==2) | neighbours==3 );

  # Display
  imshow(grid)
  title(n)
  drawnow
end
