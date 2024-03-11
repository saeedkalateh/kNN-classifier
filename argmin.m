function mins_index = argmin(data,k)
% This function is able to calculate the k lowest values
%
% mins_index = argmin(data,k)
%
% data should be a vector
% k should be an integer
% mins_index is the vector of indices

mins=ones(k,1)*10000;
mins_index=zeros(k,1);
for j=1:length(data)
    [m,i] = max(mins) ;
    if data(j)<m
        mins(i)=data(j);
        mins_index(i)=j;
    end
end
end