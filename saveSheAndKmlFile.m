clear; clc; close all % Clears existing variables, clears command window and closes all figures.

%% Load the data
inFile = 'data.mat'; % Specify the name of the .mat file containing the data.
load(inFile) % Load data from the file.

%% Store latlon and altitude info 
lat = Position.latitude; % Store latitude information in the variable 'lat'.
lon = Position.longitude; % Store longitude information in the variable 'lon'.
alt = Position.altitude; % Store altitude information in the variable 'alt'.

%% Write Shp file
n = size(lat, 1); % Store the number of rows in the latitude information in the variable 'n'.
S(n).Geometry = 'Point'; % Create an array of Shape objects with point geometry.
for i = 1:n % Iterate and store values in the S array.
    S(i).Lat = lat(i); % store lat info 
    S(i).Lon = lon(i); % store lon info 
    S(i).Geometry = 'Point';
    S(i).Name = 'Point';
end
shapewrite(S, 'point.shp'); % Write the Shape file.

%% Write KML file
filename = 'point.kml'; % Specify the name of the KML file.
kmlwriteline(filename, lat, lon, alt, 'Color', 'red', 'LineWidth', 5); % Write the line segment to the KML file.
