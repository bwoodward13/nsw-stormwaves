clear all; close all;

%% extract the relevant variables from the ncfile
url='http://data-cbr.csiro.au/thredds/dodsC/catch_all/CMAR_CAWCR-Wave_archive/CAWCR_Wave_Hindcast_aggregate/gridded/ww3.aus_4m.201606.nc';
ncdisp(url);

    % latitude and longitude
    lat=ncread(url,'latitude');
    lon=ncread(url,'longitude');
    % time
    time_num=ncread(url,'time'); % days since 1990-01-01T00:00:00Z
        % convert time to matlab format
        time=datenum('1990-01-01')+time_num;
    % significant wave height
    % hs=ncread(url,'hs'); % Error using netcdflib had to copy file to
    % local machine to access this data
    filename='ww3.aus_4m.201606.nc';
    hs=ncread(filename,'hs');
    % peak direction
    % dp=ncread(url,'dp'); % Error using netcdflib had to copy file to
    % local machine to access this data
    dp=ncread(filename,'dp');
    
%%  Create figures and frames for animations
% For each timestep between the period 4 June to 6 June 2016 create: 
% Contour plots of significant wave height
% Extract maximum wave height for each timestep for this same period. 
% Extract the peak direction of the maximum wave height.

ind=find(time==datenum('04-Jun-2016')):1:find(time==datenum('07-Jun-2016'));
% ind=find(time==datenum('06-Jun-2016')):1:find(time==datenum('07-Jun-2016'));
% ind=find(time==datenum('04-Jun-2016'));

clear sCMRmap
createcm; % run a separate script to creat colour map for the contour plot

max_hs=zeros(1,length(ind));
max_dp=zeros(1,length(ind));
for k=1:length(ind);
    j=ind(k);
    temp1=squeeze(hs(:,:,j));
    temp2=squeeze(dp(:,:,j));
    % Create contour plots of significant wave height and save as an image
        colordef white;
        figure(1)
        set(0,'defaultaxesfontname','Arial');
        set(0,'defaultaxesfontsize',10);
        set(gcf,'Color',[1,1,1]);
        contourf(lon,lat,temp1',contours)
        title(['Sea Surface Wave Significant Height ' datestr(time(j),'DD mmm YYYY HH:MM')])
        xlabel('Longitude (degrees East)')
        ylabel('Latitude (degrees North)')
        colormap(gca,sCMRmap);
        caxis([minT maxT])
        pos=(get(gca,'position'));
        cb=colorbar('Location','EastOutside');
        set(cb,'Xlim',[minT,maxT]);
        cb.Label.String = 'Height (m)';
        % mark location of Sydney and NSW border on the plot
        hold on;
        scatter(151.2093,-33.8688,'k','filled')
        text(151.2093-7,-33.8688,'Sydney')
        n1=-28.164750; % latitude of most northern point of NSW coast
        n2=-37.503625; % latitude of most northern point of NSW coast
        text(153.551842,n1,'- NSW Border')
        text(149.980771,n2,'- NSW Border')
        set(gca,'position',[pos(1)-0.03 pos(2) pos(3) pos(4)]);
        cd frames;
        print(gcf,'-djpeg',sprintf('-r%d',300), horzcat('hs_',datestr(time(j),'YY-mm-DD-HH-MM')))
        cd ..;
    % get index values necessary extract data off NSW coast
    n3=148; % longitude of western boundary of NSW coast
    n4=155; % longitude of eastern boundary of NSW coast
    [val,idx1]=min(abs(lat-n1)); clear val;
    [val,idx2]=min(abs(lat-n2)); clear val;
    [val,idx3]=min(abs(lon-n3)); clear val;
    [val,idx4]=min(abs(lon-n4)); clear val;
    clear ('n1','n2','n3','n4');
    % Extract and index maximum wave height off NSW coast
    temp1=temp1';
    temp1=temp1(idx2:idx1,idx3:idx4);
    [val, idx] = max(temp1(:));
    max_hs(k)=val;
    clear val; 
   % Extract the peak direction of the maximum wave height off NSW coast
   temp2=temp2';
   temp2=temp2(idx2:idx1,idx3:idx4);
   val=temp2(idx);
   max_dp(k)=val;
   clear val; clear idx;
   clear ('n1','n2','n3','n4');
   clear('temp1','temp2','k','j')
close
end

% plot maximum wave height and the peak direction of the maximum wave
% height
figure(1)
        set(0,'defaultaxesfontname','Arial');
        set(0,'defaultaxesfontsize',10);
        set(gcf,'Color',[1,1,1]);
        subplot(2,1,1)
        plot(time(ind),max_hs)
        datetick('x','dd-mmm-YYYY')
        set(gca,'xtick',datenum(datenum('04-Jun-2016'):1:datenum('07-Jun-2016')))
        title('NSW Coast Maximum Sea Surface Wave Height (m)');
        xlabel('Time')
        ylabel('Height (m)')
        subplot(2,1,2)
        plot(time(ind),max_dp)
        datetick('x','dd-mmm-YYYY')
        set(gca,'xtick',datenum(datenum('04-Jun-2016'):1:datenum('07-Jun-2016')))
        title('Peak Direction of Maximum Wave');
        xlabel('Time')
        ylabel('Direction')
print(gcf,'-djpeg',sprintf('-r%d',300), 'Figure1_max_hs_dp');