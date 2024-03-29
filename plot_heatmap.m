%Plot Heatmap for averaged_out_mattia.csv
clear all; close all;
%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\marci\OneDrive - Politecnico di Milano\PhD\Lab experience - tutoraggio\risultati_rev0\averaged_out_mattia.csv
%
% Auto-generated by MATLAB on 20-Nov-2023 11:56:31
% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 15);
% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
% Specify column names and types
opts.VariableNames = ["id", "direction", "lat", "long", "avg_throughput_up", "variance_throughput_up", "avg_throughput_down", "variance_throughput_down", "avg_highest_rsrp", "variance_highest_rsrp", "avg_mcs_up", "variance_mcs_up", "avg_mcs_down", "variance_mcs_down", "most_freq_beam"];
opts.VariableTypes = ["double", "categorical", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Specify variable properties
opts = setvaropts(opts, "direction", "EmptyFieldRule", "auto");
% Import the data
averagedout = readtable("output_parsers/averaged_ouput_parser_nemo.csv", opts);
% Clear temporary variables
clear opts
%% Plot
markers = {'^','>','v','<'};
markersOn = 1;
numPoints = 10;
offsetConst = 5e-5;
flag = 0;
figure()
for i=1:size(averagedout,1)
    geoscatter([averagedout.lat(i)+sequenzaCiclica(mod(i,4)+1)*offsetConst], [averagedout.long(i)+sequenzaCiclica(mod(i,4))*offsetConst], 120, [averagedout.avg_highest_rsrp(i)], "filled", markers{mod(i-1,4)+1})
    if(flag == 0)
        hold on
        flag =1;
    end
end
title('Highest RSRP')
geobasemap satellite
c = colorbar;