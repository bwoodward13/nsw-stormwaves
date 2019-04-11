clear all; close all;


url = 'https://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/Daily/4km/sst/2019/';
str = webread(url);
links = regexp(str,'https://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?(\.nc)','match')';
data = cell(size(links));
for kk = 1:numel(links)
  data{kk} = webread(links{kk});
end


hhjh



url2 = 'http://data-cbr.csiro.au/thredds/catalog/catch_all/CMAR_CAWCR-Wave_archive/CAWCR_Wave_Hindcast_aggregate/gridded/catalog.html';
str2 = webread(url2);
links2 = regexp(str2,'http://([\w-]+.nc)','match')';
links2 = regexp(str2,'http://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?(\.nc)','match')';
klkl


str = 'bat cat can car coat court CUT ct CAT-scan';
expression = 'c[aeiou]+t';
startIndex = regexp(str,expression)

str = webread(url);
expression = 'http://www.w3.org/TR/html4/loose.dtd';
links = regexp(str,expression);

links = regexp(str,'http://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?(\.nc)','match')';

D2=webread('https://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/Daily/4km/sst/2019/A2019001.L3m_DAY_NSST_sst_4km.nc');

D2=webread('http://data-cbr.csiro.au/thredds/catalog/catch_all/CMAR_CAWCR-Wave_archive/CAWCR_Wave_Hindcast_aggregate/gridded/catalog.html?dataset=allDatasetScan/CMAR_CAWCR-Wave_archive/CAWCR_Wave_Hindcast_aggregate/gridded/ww3.aus_4m.201204.nc')

D=webread('https://oceandata.sci.gsfc.nasa.gov/cgi/getfile/A2019001.L3m_DAY_NSST_sst_4km.nc');
href='https://oceandata.sci.gsfc.nasa.gov/cgi/getfile/A2019099.L3m_DAY_NSST_sst_4km.nc'

D2=webread('http://data-cbr.csiro.au/cgi/getfile/ww3.pac_4m.201901.nc');
href='catalog.html?dataset=allDatasetScan/CMAR_CAWCR-Wave_archive/CAWCR_Wave_Hindcast_aggregate/gridded/ww3.aus_10m.197901.nc'
D2=webread('catalog.html?dataset=allDatasetScan/CMAR_CAWCR-Wave_archive/CAWCR_Wave_Hindcast_aggregate/gridded/ww3.aus_10m.197901.nc')