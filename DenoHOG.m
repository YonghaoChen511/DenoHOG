function [res, H, U] = DenoHOG(S, gamma, k, gnd, M)
c = length(unique(gnd));

[HOG] = Construct_HOG(S, M, k);     % construct M HOGs with h-SPS

[U] = Fusion(HOG, M, gamma);             % multi-order graphs fusion

degs = sum(U, 2);
degs(degs == 0) = eps;
D = diag(1./degs);
L = D * U;
L = (L + L') / 2;

[H, ~] = eigs(L, c);            % spectral decomposition
H=bsxfun(@rdivide, H, sqrt(sum(H.^2, 2))+eps);

% evaluation
N=20;
ARI=zeros(1,N);
NMI=zeros(1,N);
ACC=zeros(1,N);
for j=1:N  
[Label]= kmeans(H, c, 'EmptyAction', 'singleton','Replicates',10);
[~,ACC(j),~,~,ARI(j),NMI(j)]=accuray_measures(Label,gnd);
end
res.ARI=mean(ARI);
res.ACC=mean(ACC);
res.NMI=mean(NMI);
res.ARIstd=std(ARI);
res.NMIstd=std(NMI);
res.ACCstd=std(ACC);

end