function m=distances_means2(data)
[r,~]=size(data);
m=0;
x=sum(data)/r;
for i=1:r
    dis=norm(data(i,:)-x)^2;
%     for h=1:c
%         dis=dis+(data(i,h)-x(h))^2;
%     end
%     dis=sqrt(dis);
    m=m+dis;
end
m=m/r; 
end