"# Spectrogram-MATLAB" 

Spring 2017: EE-10114 (Microprocessors & Multimedia) at Notre Dame

This project implements a spectrogram with a MATLAB GUI, and allows
the user to easily visualize the contents of a recorded audio sample.

-----------------------
USAGE AND INSTRUCTIONS
-----------------------

1. MATLAB must have access to a microphone to record an audio sample.
Check your computer's audio settings to ensure a microphone is enabled
and working (built-in is fine).

2. With all project files in the same directory, open and run the "SpectrogramTool.m"
MATLAB file. The graphical user interface should appear.

3. Select an audio duration to record for using the slider (between 5-20 seconds).

4. Click "RECORD" to begin recording an audio sample. The program will
automatically stop recording after the specified duration has passed.

5. To hear the most recently recorded sample, click "PLAY RECORDED AUDIO"

6. Click "SPECTROGRAM!" to plot the spectrogram of the recorded audio sample.
This may take a few seconds (roughly O(n) time complexity based on the length
of the recorded audio sample). The program will automatically plot to the
provided axes.

7. To clear the axes, click "CLEAR" in the bottom right corner.

--------------------------
ANALYZING THE SPECTROGRAM
--------------------------

This spectrogram provides three pieces of information to the user: the frequency,
time, and amplitude of a given audio sample. The frequency of the tone is measured
in Hertz, and plotted on the y-axis in the GUI. The frequencies present in the
audio sample are plotted in the time domain in seconds (x-axis). The magnitude
response of every tone is color-coded to indicate what frequencies are most prevalent
at a given time.

Use the legend on the right side of the GUI to match signal amplitude (volume)
with a particular frequency.

This tool is especially useful for analyzing the contents of a song excerpt or
other short audio sample. It can easily be adapted to compute larger audio samples,
although this project implements a max duration of 20 seconds for the purpose of
fast project demonstrations.

Computing a spectrogram based on an audio sample is the basis upon which tools
like "Shazam!" are founded; though this project doesn't have the functionality
to map a particular spectrogram to a database of songs, the underlying implementation
of the spectrogram algorithm is very similar.




