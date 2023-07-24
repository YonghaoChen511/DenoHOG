function [D] = h_SPS(A, startNode, T, order, w, D)
if(order+1 == length(T))
    T(length(T)) = [];
else
    ind = find(A(startNode, :) > 0);
    for j = ind
        if(ismember(j, T) == 0)
           T = [T, j];
           w = w * A(startNode, j);
           if(order+1 == length(T))
               D(T(1), j) = D(T(1), j) + w;
           end
           [D] = h_SPS(A, j, T, order, w, D);
           T(length(T)) = [];
           w = w / A(startNode, j);
        end 
    end
end
end