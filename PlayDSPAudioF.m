% PlayDSPAudioF.m
%
% A function that plays the recorded sound from the AudioRecogTool GUI
%
% EE-10114 Audio DSP Final Project
% Author: Seth Cattanach

function PlayDSPAudioF(handles)

% load audio data and play back recorded audio sample
load('AudioSampleF.mat');

% calculate Fn just to set axes appropriately
Fn = Fs/2;

% set axes
axes(handles.specGraph);
axis([0 time 0 Fn]);

% update GUI to say 'Playing audio...'
handles.updateStatic.String = 'Playing audio...';
drawnow;
sound(audio,Fs);
pause(time);
handles.updateStatic.String = ' ';
drawnow;

