function [ output ] = getAAPL( company, dMn, dMx )
%GETAAPL returns a matrix (n, 3) with Date(ISO), Close value and volume values for the selected period (dMn & dMx as a 'MM/DD/YYYY' date) 
%   Detailed explanation goes here

% Parametters init
dateMin = dMn;
dateMax = dMx;
date=datenum('2015-05-01 00:00:01');
% Connection init
y = yahoo;

% Company Selection
if company == 'Apple'
    c = 'AAPL';
end

% Methods

% Using existin method
data = fetch(y, c, dateMin, dateMax);

% Formating Data
time = datestr(data(:,1), 'yyyy-mm-ddTHH:MM:SS.FFFZ');
fData = cat(2,time,num2str(data(:,5)),num2str(data(:,6)));

% Check if file exist
numF = exist(strcat(company,'data.dat'));
if numF == 0
    % Writing file begining at line 0 col 0
    % Format 'date','closeValue','volume'
    csvwrite(strcat(company,'data.dat'),fData,0,0);
end

% In every cases outputs formated data
output = fData;
end

