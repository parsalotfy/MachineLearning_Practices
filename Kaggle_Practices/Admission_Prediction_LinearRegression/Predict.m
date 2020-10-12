function chance = Predict(theta , mu , sigma ,mode  , value)
    % MODE :
    % 1 -> GRE
    % 2 -> TOEFL
    % 3 -> UniRating
    % 4 -> SOP
    % 5 -> LOR
    % 6 -> CGPA
    % 7 -> RE
    chance = theta(1,mode) + theta (2,mode)*(value-mu(mode+1))/sigma(mode+1);
end