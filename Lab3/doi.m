x = -10:10;
y = 0:3:30;
[X, Y] = meshgrid(x, y);

c = zeros(length(y), length(x));
for i = 1:length(y)
    for j = 1:length(x)
        c(i, j) = y(i) * sin(x(j));
    end
end

mesh(c)