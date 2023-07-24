function Ndata=Normalized_data(Ndata)
[r,c]=size(Ndata);
for i=1:c
    ma=max(Ndata(:,i));
    %mz=mean(Ndata(:,i));
    mi=min(Ndata(:,i));
    for j=1:r 
        if ma-mi~=0
        Ndata(j,i)=(Ndata(j,i)-mi)/(ma-mi);
        else
        Ndata(j,i)=0;     
        end
    end
end
     