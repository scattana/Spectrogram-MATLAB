% freqTest.m
%
% A function that records an audio signal for a user-specified
% duration (in seconds) and updates the GUI to indicate when the
% recorder is on/off
%
% Called by the SpectrogramTool.m GUI
%
% Author: Seth Cattanach
% EE-10114 Audio DSP Final Project


function freqTest(handles)

Fs = 10400;                          % Sampling frequency  
time = handles.recordSlider.Value;   % from SpectrogramTool GUI
T = 1/Fs;                            % Sampling period       
L = Fs*time;                         % Length of signal

% RECORD


% create object for recording (8 channels, and '0' is the device ID (mic))
recordObj = audiorecorder(Fs,8,1,0);

% update GUI to let user know when recording starts/stops
handles.recordStaticText.String = 'Recording in progress...';
recordblocking(recordObj, time);
handles.recordStaticText.String = ' ';

% retrieve audio data from recorder object
audio = getaudiodata(recordObj);


% save all relevant audio data to MATLAB file
save('AudioSampleF.mat','time','audio','Fs');
