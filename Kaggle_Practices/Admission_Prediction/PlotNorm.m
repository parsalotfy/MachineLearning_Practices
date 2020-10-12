function PlotNorm(X,y)
    subplot(4,2,1);
    plot(X(:,1),y,".r", "markersize",3)
    xlabel("GRE Normalized")
    ylabel("Chance")
    %axis([289 341])



    subplot(4,2,2);
    plot(X(:,2),y,".r", "markersize",3)
    xlabel("TOEFL Normalized")
    ylabel("Chance")
    %axis([91 121])


    subplot(4,2,3);
    plot(X(:,3),y,".r", "markersize",3)
    xlabel("UniRating")
    ylabel("Chance")
    axis([0.9 5.1])

    subplot(4,2,4);
    plot(X(:,4),y,".r", "markersize",3)
    xlabel("SOP")
    ylabel("Chance")
    axis([0.9 5.1])


    subplot(4,2,5);
    plot(X(:,5),y,".r", "markersize",3)
    xlabel("LOR")
    ylabel("Chance")
    axis([0.9 5.1])

    subplot(4,2,6);
    plot(X(:,6),y,".r", "markersize",3)
    xlabel("CGPA Normalized")
    ylabel("Chance")
    %axis([6.7 10])

    subplot(4,2,7);
    plot(X(:,7),y,".r", "markersize",3)
    xlabel("RE")
    ylabel("Chance")
    axis([-0.2 1.2 ])

end