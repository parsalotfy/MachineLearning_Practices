function [jVal , gradient] = costFunction(theta , X , y)    
    % TrobelShooting
    %theta
    %X([1:5],:)
    %y([1:5],:)    
    m = length(y);
    h = X*theta;
    hminusy = h - y;
    jVal = 1/(2*m)*sum(hminusy.^2);
    gradient = zeros(length(theta),1);
    delta = (1/m) * X' * hminusy;
    gradient = delta;
    %display("-------------------------------------------------")
end