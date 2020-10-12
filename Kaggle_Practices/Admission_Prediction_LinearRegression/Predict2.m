function chance = Predict2(X, theta , mu , sigma   )
    X = (X - mu)./sigma;
    X(1) = 1;
    chance = X * theta;
end