function PlotLegend(handles)

% A function that plots the legend for the SpectrogramTool.m GUI. Colors
% correspond to relative magnitudes of the frequencies plotted by Spec.m
%
% EE-10114 Audio DSP Final Project
% Author: Seth Cattanach


% define colors
white = [1 1 1];
purple = [.5 0 .5];
blue = [0 0 1];
cyan = [0 1 1];
green = [0 1 0];
yellow = [1 1 0];
orange = [1 .5 0];
red = [1 0 0];

% plots colors to legend
axes(handles.legend)
set(handles.legend,'visible','off');
axis([0 1 0 8]);
line([0 1],[.5 .5],'Color',white,'LineWidth',43);
line([0 1],[1.5 1.5],'Color',purple,'LineWidth',43);
line([0 1],[2.5 2.5],'Color',blue,'LineWidth',43);
line([0 1],[3.5 3.5],'Color',cyan,'LineWidth',43);
line([0 1],[4.5 4.5],'Color',green,'LineWidth',43);
line([0 1],[5.5 5.5],'Color',yellow,'LineWidth',43);
line([0 1],[6.5 6.5],'Color',orange,'LineWidth',43);
line([0 1],[7.5 7.5],'Color',red,'LineWidth',43);
