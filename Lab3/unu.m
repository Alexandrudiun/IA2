n = 3;
m = 6;

graphA = zeros(m,n);

for i = 1:m
    for j = 1:n
        if i==1 
            graphA(i,j)=1;
        elseif j==1
                graphA(i,j) = i;
        end
    end
end

for i = 2:m
    for j = 2:n
         graphA(i,j)=graphA(i,1)*graphA(i,j-1);
    end
end


mesh(graphA)
set(gca, 'YScale', 'log')