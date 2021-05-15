% Fetch Data 
rawData = csvread('Admission_Predict.csv');
data = rawData(2:end,2:9);

m = length(data);


% Convert continous data to binary data
for i=1:m
    if (data(i,8)>=0.5)
        data(i,8)=1;
    else
        data(i,8)=0;
    endif
endfor

% Save data .txt
dlmwrite('Admission_Predict_BinaryClassification.mat','data');

% Load data from .txt file
data = load("Admission_Predict_BinaryClassification.txt");

m = length(data);

X = data(:,1:7);
y = data(:,8);


# add ones columns to the first
X = [ones(m,1),X];

for i = 1:m
    xline = X(:,[2]);
    yline = X(:,[3]);
end
