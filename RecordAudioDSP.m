function RecordAudioDSP(handles)

time = handles.recordSlider.Value;

% sample at 44,100 times per second
sampleRate = 44100;

% create object for recording (16 channels, and '0' is the device ID (mic))
recordObj = audiorecorder(sampleRate,16,1,0);

% update the GUI to let user know when the program is recording
handles.recordStaticText.String = 'Recording in progress...';
recordblocking(recordObj, time);
handles.recordStaticText.String = ' ';

% retrieve audio sample from recording object
audio = getaudiodata(recordObj);

% save the audio sample, time, and sample rate to a MATLAB file
save('AudioSampleF.mat','audio','time','sampleRate');