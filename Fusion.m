function [U] = Fusion(HOG, order, gamma)
num = size(HOG{1},1);
U = zeros(num);
alpha = 1/order*ones(1,order);
for i = 1:order                 % initailize U
    U = U + alpha(i)*HOG{i};
end;

iter = 10;

for t = 1:iter
    Sim = zeros(num);
    for i = 1:order
       Sim = Sim + alpha(i)/sum(alpha)*HOG{i}; 
    end
    U = Sim;    % update U
        
    for i = 1:order
    alpha(i) = gamma*0.5*norm(U-HOG{i},'fro')^(gamma-2);       % update alpha
        if isnan(alpha(i)) || isinf(alpha(i))
           alpha(i) = 1/order;
        end
    end   
     
%      loss(t) = convergence(S, W, num, order, alpha);        
end
end


function loss = convergence(S, W, num, order, alpha)
SS = zeros(num);
for i = 1:order
    SS = SS + alpha(i)/sum(alpha)*W{i}; 
end
loss = norm(S-SS, 'fro');
end