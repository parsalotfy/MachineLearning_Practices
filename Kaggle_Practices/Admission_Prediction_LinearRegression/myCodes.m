% Fetch Data 
rawData = csvread('Admission_Predict.csv');
data = rawData(2:end,2:9);

m = length(data);

X = data(:,1:7);
y = data(:,8);

# add ones columns to the first
X = [ones(m,1),X];

% => X columns are :
% __________________________________________________________
% | Ones | GRE | TOEFL | UniRating | SOP | LOR | CGPA | RE |  
% ¯¯¯1¯¯¯¯¯¯2¯¯¯¯¯¯3¯¯¯¯¯¯¯¯¯4¯¯¯¯¯¯¯¯5¯¯¯¯¯6¯¯¯¯¯7¯¯¯¯¯¯8¯¯

% Ploting without Feature Scaling
PlotNoNorm(X(:,[2:end]),y);

% Print the Plot without Feature Scaling
print ("XY.jpg")



% Feature Scaling
mu = mean (X);
sigma = std(X);


% normalizatoin : just normalize continious columns
X_norm = X;

% normalize continious columns
X_norm(:,2) = (X(:,2) - mu(2))./sigma(2);
X_norm(:,3) = (X(:,3) - mu(3))./sigma(3);
X_norm(:,7) = (X(:,7) - mu(7))./sigma(7);



% Ploting with Feature Scaling
PlotNorm(X_norm(:,[2:end]),y);

% Print the Plot with Feature Scaling
print ("XY_norm.jpg")




% fminunc Features one by one : (WHICH IS WRONG !!!)

initial_theta = zeros(2, 1);
options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta_gre, cost_gre , exitFlag_gre] = fminunc(@(t)(costFunction(t, X_norm(:,[1,2]), y)), initial_theta, options);
[theta_toefl, cost_toefl , exitFlag_toefl] = fminunc(@(t)(costFunction(t, X_norm(:,[1,3]), y)), initial_theta, options);
[theta_uniRating, cost_uniRating , exitFlag_uniRating] = fminunc(@(t)(costFunction(t, X_norm(:,[1,4]), y)), initial_theta, options);
[theta_SOP, cost_SOP , exitFlag_SOP] = fminunc(@(t)(costFunction(t, X_norm(:,[1,5]), y)), initial_theta, options);
[theta_LOR, cost_LOR , exitFlag_LOR] = fminunc(@(t)(costFunction(t, X_norm(:,[1,6]), y)), initial_theta, options);
[theta_CGPA, cost_CGPA , exitFlag_CGPA] = fminunc(@(t)(costFunction(t, X_norm(:,[1,7]), y)), initial_theta, options);
[theta_RE, cost_RE , exitFlag_RE] = fminunc(@(t)(costFunction(t, X_norm(:,[1,8]), y)), initial_theta, options);



resultTheta = [theta_gre , theta_toefl , theta_uniRating , theta_SOP , theta_LOR , theta_CGPA , theta_RE];
%minmaxes = [min(X_norm) ; max(X_norm)];



% Plot the linear fit
PlotLinearFit(X_norm(:,[2:end]),y,resultTheta);
print ("XY_norm_LinearFit.jpg")


%Preciction just by one Feature
% 2 is mode for TOEFL
% 80 is TOEFL score
Predict(resultTheta , mu , sigma , 2 , 80);



% fminunc with all Features : (WHICH IS RIGHT !!!)

% normalize all Features
X_norm = (X-mu)./sigma;

% size(A,1) -> number of rows
% size(A,2) -> number of columns
n = size(X_norm,2);

% Fix ones in first column
X_norm(:,[1]) = ones(m,1);

initial_theta = zeros(n, 1);
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost , exitFlag] = fminunc(@(t)(costFunction(t, X_norm, y)), initial_theta, options);

% Result is (Descending) :

% 0.7217 for theta 0
% 0.0716 for CGPA
% 0.0209 for GRE
% 0.0168 for TOEFL
% 0.0155 for Letter of Recommendation
% 0.0120 for Research Experience
% 0.0067 for University Rating
% 0.0015 for Statement of Purpose

% Cost =  0.0017704

% Preciction by all Features
xtest = [1,300,100,1,1,1,6,0]
xtest = (xtest - mu)./sigma
xtest(1) = 1
xtest*theta

