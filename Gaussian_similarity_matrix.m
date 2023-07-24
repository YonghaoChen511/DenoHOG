function S = Gaussian_similarity_matrix(X, sigma)
X = Normalized_data(X);
m = distances_means2(X);
delta = 2 * m / sigma;
Dis = squareform(pdist(X, 'euclidean' ));      
S = exp(- Dis.^2 / delta);
end