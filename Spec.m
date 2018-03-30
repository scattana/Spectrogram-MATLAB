% Spec.m
%
% This is the function that computes and plots the spectrogram of the
% recorded audio sample. Called by the "SpectrogramTool.m" GUI.
% EE-10114 Audio DSP Final Project
% Author: Seth Cattanach

function Spec(handles)

load('AudioSampleF.mat');



Fn = Fs/2;                  % Nyquist frequency (max freq that can be recovered)

% set axis approriately for given time and Nyquist freq.
axis(handles.specGraph,[0 time 0 Fn]);
% set axis, title, and labels for the GUI plot
axes(handles.specGraph);
title('Spectrogram of Recorded Audio Sample');
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
drawnow;

Ns = time*Fs;               % total number of samples (length of audio array)

Nw = 50;                   % number of 'windows' to take FFT

Nsize = Ns/Nw;              % each 'window' is a fraction of total samples


numRow = Nsize/2;           % since FFT repeats second half of data
numCol = Nw;

NHertz = Fn / numRow;       % each FFT represents this many Hz (freq)

Ntime = time/Nw;            % length of time of each 'window'

% update the GUI to let the user know the program is currently computing
% FFTs for each sample point
handles.updateStatic.String = 'Currently computing FFTs...';
drawnow;

% use FOR loops to compute FFT for each window and extract first half
% outer loop tracks rows, where each row represents a frequency
for i=1:numRow
    % inner loop tracks columns, where each col holds magnitude (amplitude)
    % data for the FFT sample of the current window
    for j=1:numCol
        startIndex = (j-1)*(Nsize) +1;
        stopIndex = j*(Nsize);
        spec = fft(audio(startIndex:stopIndex));
        mag = abs(spec(1:(length(spec)/2)));        % since FFT repeats, only take first 1/2
        audioArr(:,j) = mag(1:length(mag));         % store mags in appropriate column
    end
end

% update GUI text when computation of FFTs is completed
handles.updateStatic.String = ' ';
drawnow;

% retrieve max magnitude value from array data and scale each magnitude to
% a color (to later plot in spectrogram) - 
% use 'max' function twice - first time returns max value in each column,
% second time returns the overall max value found in the matrix
maxMag = max(max(audioArr));



% now, using 8 colors, set appropriate scale for each magnitude. Use
% structure and fields to assign color to each (i,j) in 'audioArr'
% colors, from lowest mag to highest mag: white, purple, blue, cyan, green,
% yellow, orange, red

% need to represent each color using a 3 bit RGB value (fractions of 255)
white = [1 1 1];
purple = [.5 0 .5];
blue = [0 0 1];
cyan = [0 1 1];
green = [0 1 0];
yellow = [1 1 0];
orange = [1 .5 0];
red = [1 0 0];

% set 7 threshold values according to max value (for 8 colors)
th1 = (maxMag / 8);
th2 = 2*(maxMag / 8);
th3 = 3*(maxMag / 8);
th4 = 4*(maxMag / 8);
th5 = 5*(maxMag / 8);
th6 = 6*(maxMag / 8);
th7 = 7*(maxMag / 8);


for b=1:numCol
    for a=1:numRow
        % if mag response is below the 1st threshold, don't plot (just keep
        % white). For thresholds 2-7, plot color line corresponding to
        % relative magnitude response
        if audioArr(a,b)<th1
            % do nothing - background is already white! This vastly
            % improves the speed of the plotting to the GUI
        elseif audioArr(a,b)<th2 && audioArr(a,b)>th1
            line(handles.specGraph,[(b-1)*Ntime b*Ntime],[((a/numRow)*Fn) ((a/numRow)*Fn)],'Color',purple,'LineWidth',1.5);
        elseif audioArr(a,b)<th3
            line(handles.specGraph,[(b-1)*Ntime b*Ntime],[((a/numRow)*Fn) ((a/numRow)*Fn)],'Color',blue,'LineWidth',2);
        elseif audioArr(a,b)<th4
            line(handles.specGraph,[(b-1)*Ntime b*Ntime],[((a/numRow)*Fn) ((a/numRow)*Fn)],'Color',cyan,'LineWidth',2.5);
        elseif audioArr(a,b)<th5
            line(handles.specGraph,[(b-1)*Ntime b*Ntime],[((a/numRow)*Fn) ((a/numRow)*Fn)],'Color',green,'LineWidth',3);
        elseif audioArr(a,b)<th6
            line(handles.specGraph,[(b-1)*Ntime b*Ntime],[((a/numRow)*Fn) ((a/numRow)*Fn)],'Color',yellow,'LineWidth',3.5);
        elseif audioArr(a,b)<th7
            line(handles.specGraph,[(b-1)*Ntime b*Ntime],[((a/numRow)*Fn) ((a/numRow)*Fn)],'Color',orange,'LineWidth',4);
        else
            line(handles.specGraph,[(b-1)*Ntime b*Ntime],[((a/numRow)*Fn) ((a/numRow)*Fn)],'Color',red,'LineWidth',4.5);
        end

    end
    drawnow;
end
