clear;
warning off;

M = 3;

load(['./dataset/ORL_32x32.mat']);
disp('ORL')
gamma = 1.6; loc_k = 3;
S = Gaussian_similarity_matrix(fea, 1);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/Umist.mat']);
disp('Umist')
gamma = 2; loc_k = 3;
S = Gaussian_similarity_matrix(fea, 30);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/COIL20.mat']);
disp('COIL20');
gamma = 2; loc_k = 2;
S = Gaussian_similarity_matrix(fea, 50);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/yeast.mat']);
disp('Yeast')
gamma = 2; loc_k = 4;
S = Gaussian_similarity_matrix(fea, 1);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/OpticDigits.mat']);
disp('OpticDigits')
gamma = 0.6; loc_k = 3;
S = Gaussian_similarity_matrix(fea, 1);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/Statlog.mat']);
disp('Statlog');
gamma = 2; loc_k = 5;
S = Gaussian_similarity_matrix(fea, 50);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);
           
% 
load(['./dataset/COIL100.mat']);
disp('COIL100');
gamma = 0.6; loc_k = 4;
S = Gaussian_similarity_matrix(fea, 1);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/MNIST.mat']);
disp('MNIST');
gamma = 1; loc_k = 4;
S = Gaussian_similarity_matrix(fea, 1);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/PenDigits.mat']);
disp('PenDigits');
gamma = 0.9; loc_k = 7;
S = Gaussian_similarity_matrix(fea, 1);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);


load(['./dataset/USPS.mat']);
disp('USPS');
gamma = 1; loc_k = 5;
S = Gaussian_similarity_matrix(fea, 1);
[res, H, U] = DenoHOG(S, gamma, loc_k, gnd, M);
fprintf('loc_k=%d, gamma=%.1f, ACC=%.2f¡À%.2f, ARI=%.2f¡À%.2f, NMI=%.2f¡À%.2f \n', ...
   loc_k, gamma, res.ACC*100, res.ACCstd*100, res.ARI*100, res.ARIstd*100, res.NMI*100, res.NMIstd*100);



