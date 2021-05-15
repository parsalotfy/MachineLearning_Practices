function PlotClasses(X,y)
    % Ploting without Feature Scaling
    %subplot(4,2,1);
    m = length(y);

    for i = 1:m
        if((y(i)==0))
            plot(X(i,[2]),X(i,[7]),".r", "markersize",15); hold on
        end
        
        if ((y(i)==1))
            plot(X(i,[2]),X(i,[7]),".b", "markersize",15); hold on
        end
        
    end
    
    
    xlabel("TOEFL")
    ylabel("CGPA")
    %axis([289 341])    
end