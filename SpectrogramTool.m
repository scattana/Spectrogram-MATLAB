function varargout = SpectrogramTool(varargin)
% SPECTROGRAMTOOL MATLAB code for SpectrogramTool.fig
%      SPECTROGRAMTOOL, by itself, creates a new SPECTROGRAMTOOL or raises the existing
%      singleton*.
%
%      H = SPECTROGRAMTOOL returns the handle to a new SPECTROGRAMTOOL or the handle to
%      the existing singleton*.
%
%      SPECTROGRAMTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECTROGRAMTOOL.M with the given input arguments.
%
%      SPECTROGRAMTOOL('Property','Value',...) creates a new SPECTROGRAMTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpectrogramTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpectrogramTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpectrogramTool

% Last Modified by GUIDE v2.5 27-Apr-2017 00:18:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpectrogramTool_OpeningFcn, ...
                   'gui_OutputFcn',  @SpectrogramTool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SpectrogramTool is made visible.
function SpectrogramTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpectrogramTool (see VARARGIN)

% Choose default command line output for SpectrogramTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpectrogramTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
val = handles.recordSlider.Value;
save('saveVal.mat','val');

PlotLegend(handles);

% --- Outputs from this function are returned to the command line.
function varargout = SpectrogramTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function recordSlider_Callback(hObject, eventdata, handles)
% hObject    handle to recordSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
load('saveVal.mat');
if handles.recordSlider.Value>val
    val = ceil(handles.recordSlider.Value);
    handles.recordSlider.Value = val;
    save('saveVal.mat','val');
else
    val = floor(handles.recordSlider.Value);
    handles.recordSlider.Value = val;
    save('saveVal.mat','val');
end

handles.recordEdit.String = num2str(handles.recordSlider.Value);

% --- Executes during object creation, after setting all properties.
function recordSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recordSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in recordButton.
function recordButton_Callback(hObject, eventdata, handles)
% hObject    handle to recordButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

freqTest(handles);

function recordEdit_Callback(hObject, eventdata, handles)
% hObject    handle to recordEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of recordEdit as text
%        str2double(get(hObject,'String')) returns contents of recordEdit as a double
handles.recordSlider.Value = round(str2num(handles.recordEdit.String));
handles.recordEdit.String = round(str2num(handles.recordEdit.String));



% --- Executes during object creation, after setting all properties.
function recordEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recordEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in playOriginal.
function playOriginal_Callback(hObject, eventdata, handles)
% hObject    handle to playOriginal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PlayDSPAudioF(handles)


% --- Executes on button press in specButton.
function specButton_Callback(hObject, eventdata, handles)
% hObject    handle to specButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Spec(handles)


% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ClearSpec(handles)
