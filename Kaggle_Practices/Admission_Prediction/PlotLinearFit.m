function PlotLinearFit(X,y,theta)

    minmaxes = [min(X) ; max(X)]

    subplot(4,2,1);
    plot(X(:,1),y,".r", "markersize",3);
    xlabel("GRE Normalized");
    ylabel("Chance");
    %axis([289 341])
    hold on
    xLine = minmaxes(:,1);
    yLine = theta(1,1) + theta(2,1)*xLine;
    plot(xLine,yLine);

    

    subplot(4,2,2);
    plot(X(:,2),y,".r", "markersize",3)
    xlabel("TOEFL Normalized")
    ylabel("Chance")
    %axis([91 121])
    hold on
    xLine = minmaxes(:,2);
    yLine = theta(1,2) + theta(2,2)*xLine;
    plot(xLine,yLine);


    subplot(4,2,3);
    plot(X(:,3),y,".r", "markersize",3)
    xlabel("UniRating")
    ylabel("Chance")
    axis([0.9 5.1])
    hold on
    xLine = minmaxes(:,3);
    yLine = theta(1,3) + theta(2,3)*xLine;
    plot(xLine,yLine);


    subplot(4,2,4);
    plot(X(:,4),y,".r", "markersize",3)
    xlabel("SOP")
    ylabel("Chance")
    axis([0.9 5.1])
    hold on
    xLine = minmaxes(:,4);
    yLine = theta(1,4) + theta(2,4)*xLine;
    plot(xLine,yLine);



    subplot(4,2,5);
    plot(X(:,5),y,".r", "markersize",3)
    xlabel("LOR")
    ylabel("Chance")
    axis([0.9 5.1])
    hold on
    xLine = minmaxes(:,5);
    yLine = theta(1,5) + theta(2,5)*xLine;
    plot(xLine,yLine);



    subplot(4,2,6);
    plot(X(:,6),y,".r", "markersize",3)
    xlabel("CGPA Normalized")
    ylabel("Chance")
    %axis([6.7 10])
    hold on
    xLine = minmaxes(:,6);
    yLine = theta(1,6) + theta(2,6)*xLine;
    plot(xLine,yLine);


    subplot(4,2,7);
    plot(X(:,7),y,".r", "markersize",3)
    xlabel("RE")
    ylabel("Chance")
    axis([-0.2 1.2 ])
    hold on
    xLine = minmaxes(:,7);
    yLine = theta(1,7) + theta(2,7)*xLine;
    plot(xLine,yLine);


end