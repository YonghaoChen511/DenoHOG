function [HOG] = Construct_HOG(S, M, k)
[n, ~] = size(S);
S = S - diag(diag(S));    
HOG{1} = S;
A = Find_neighborhood(S, k);
for h = 2: M
    D = zeros(n);    
    for startNode = 1:n
        w = 1;
        T = [startNode];
        [D] = h_SPS(A, startNode, T, h, w, D);
    end
    HOG{h} = D;       % construct high-order graph
    
end

for i = 1: M
    HOG{i} = HOG{i} - diag(diag(HOG{i}));     % normalization
    degs = sum(HOG{i}, 2);
    degs(degs == 0) = eps;
    D = diag(1./degs);
    HOG{i} = D * HOG{i};
    HOG{i} = (HOG{i}+HOG{i}')/2;
end    
end


% construct kNN graph
function A = Find_neighborhood(S, k)
[n ~] = size(S);
[YW, IW1] = sort(S, 2, 'descend');      % Sort by Row Descending
A = zeros(n);
temp = repmat((1: n)', 1, k);
I1 = (IW1(:, 1:k) - 1) * n + temp;
A(I1(:)) = S(I1(:));
end


