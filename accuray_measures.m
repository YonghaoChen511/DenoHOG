function [statistic,ACC,PE,RE,ARI,NMI]=accuray_measures(new_class,class)
[sums,cluster]=equation(new_class);
r=length(new_class);
l=length(sums);
cs=unique(class);
n=length(cs)+2;
statistic=zeros(l,n);
statistic(:,1)=sums;
ms=0;
PE=0;
ACC=0;
RE=0;
true_class=zeros(1,r);
for i=1:l
    s=class_distribution(setdiff(cluster(i,:),0),cs,class);
    for j=2:n-1
        statistic(i,j)=s(j-1);
    end
    [maxvalue,maxrow]=max(s);
    attr_class=unique(class);
    for clusteri=1:length(setdiff(cluster(i,:),0))
        if isequal(class(cluster(i,clusteri)),attr_class(maxrow))
            true_class(cluster(i,clusteri))=1;
        end
    end
    statistic(i,n)=maxvalue/sums(i);
    PE=PE+maxvalue/sums(i);
    ms=ms+max(s);
end
for i=1:l
    [maxvalue,maxrow]=max(statistic(i,[2:n-1]));
if sum(statistic(:,maxrow+1))~=0
    RE=RE+maxvalue/sum(statistic(:,maxrow+1));
    %RE=RE+max(statistic(:,i+1))/sum(statistic(:,i+1));
end
end
ACC=ms/r;
PE=PE/l;
RE=RE/l;
ARI=CorrectedRandIndex(new_class,class);
NMI=MutualInfromation(new_class,class);
end

function [sum,class]=equation(Column)
k=unique(Column);
m=length(k);
n=length(Column);
sum=zeros(1,m);
for i=1:n
    for j=1:m
        if isequal(Column(i),k(j))
            sum(j)=sum(j)+1;
            class(j,sum(j))=i;
        end
    end
end
end

function ARI=CorrectedRandIndex(X,Y)
    r=length(X);
    xk=unique(X);
    xk_len=length(xk);
    yk=unique(Y);
    yk_len=length(yk);
    Nx=0;
    for i=1:xk_len
        for j=1:yk_len
            A=find(X==xk(i));
            B=find(Y==yk(j));
            C=intersect(A,B);
            N(i,j)=length(C);
            Nx=Nx+N(i,j)*(N(i,j)-1)/2;
        end
    end
    a=zeros(1,xk_len);
    Ax=0;
    for i=1:xk_len
        a(i)=sum(N(i,:));
        Ax=Ax+a(i)*(a(i)-1)/2;
    end
    Bx=0;
    b=zeros(1,yk_len);
    for i=1:yk_len
        b(i)=sum(N(:,i));
        Bx=Bx+b(i)*(b(i)-1)/2;
    end        
    ARI=(Nx-Ax*Bx/(r*(r-1)/2))/((Ax+Bx)/2-Ax*Bx/(r*(r-1)/2));    
end

function NMI=MutualInfromation(A,B)
   if length( A ) ~= length( B)
      error('length( A ) must == length( B)');
   end
   total = length(A);
   A_ids = unique(A);
   B_ids = unique(B);
   AL=length(A_ids);
   BL=length(B_ids);
% Mutual information
  MI = 0;
  for i=1:AL
      idA = A_ids(i);
       for j=1:BL         
         idB = B_ids(j);
         idAOccur = find( A==idA );
         idBOccur = find( B==idB );
         idABOccur = intersect(idAOccur,idBOccur); 
         
         px = length(idAOccur)/total;
         py = length(idBOccur)/total;
         pxy = length(idABOccur)/total;
         
         MI = MI + pxy*log2(pxy/(px*py)+eps); % eps : the smallest positive number
       end
  end
  % Normalized Mutual information
  Hx = 0; % Entropies
  for i=1:AL
      idA = A_ids(i);
      idAOccurCount = length( find( A == idA ) );
      Hx = Hx - (idAOccurCount/total) * log2(idAOccurCount/total + eps);
  end
  Hy = 0; % Entropies
  for j=1:BL
      idB = B_ids(j);
      idBOccurCount = length( find( B == idB ) );
      Hy = Hy - (idBOccurCount/total) * log2(idBOccurCount/total + eps);
  end
  NMI = 2 * MI / (Hx+Hy);
end

function sum=class_distribution(class,attribute,data)
n=length(class);
k=length(attribute);
sum=zeros(1,k);
for i=1:n
    for j=1:k
        if isequal(data(class(i)),attribute(j))
            sum(j)=sum(j)+1;
            
        end
    end
end
end

%for i=1:k
   %sum(i)=sum(i)/n;
%end


