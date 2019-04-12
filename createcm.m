% Create colour map and set range of temperatures to plot

CMRmap = jet;

contour_interval=1;
minT = 0;
maxT = 10;
contours=minT:contour_interval:maxT;

%clear sCMRmap
x=1:63/(length(contours)):64; %get number of color levels to match number of contours
        xl=1:64;
        for i=1:3
        sCMRmap(:,i)=spline(xl,CMRmap(:,i),x)';%splinefitintermediate valucs
        end
        sCMRmap=abs (sCMRmap/max(max(sCMRmap)));
        sCMRmap=sCMRmap(3:end,:);