function varargout = ImageCapture(varargin)
% IMAGECAPTURE MATLAB code for ImageCapture.fig
%      IMAGECAPTURE, by itself, creates a new IMAGECAPTURE or raises the existing
%      singleton*.
%
%      H = IMAGECAPTURE returns the handle to a new IMAGECAPTURE or the handle to
%      the existing singleton*.
%
%      IMAGECAPTURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGECAPTURE.M with the given input arguments.
%
%      IMAGECAPTURE('Property','Value',...) creates a new IMAGECAPTURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageCapture_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageCapture_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageCapture

% Last Modified by GUIDE v2.5 11-Sep-2018 21:56:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageCapture_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageCapture_OutputFcn, ...
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
global colorImg;



% --- Executes just before ImageCapture is made visible.
function ImageCapture_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageCapture (see VARARGIN)

% Choose default command line output for ImageCapture
handles.output = hObject;
axes(handles.axes1);
global colorVid;
colorVid = videoinput('kinect',1);
himage = image(zeros(640,480,3),'parent',handles.axes1);
preview(colorVid,himage);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageCapture wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageCapture_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in capture.
function capture_Callback(hObject, eventdata, handles)
% hObject    handle to capture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global colorVid;
global colorImg;
colorImg = getsnapshot(colorVid);
axes(handles.axes1);
imshow(colorImg);


% --- Executes on button press in savee.
function savee_Callback(hObject, eventdata, handles)
% hObject    handle to savee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global colorImg;
selpath = uigetdir('C:\Users\Ahmad\Pictures\project Pictures','Select the Folder to Save the Image');
 x = get(handles.name,'String'); %edit1 being Tag of ur edit box
 if isempty(x)
   fprintf('Error: Enter Text first\n');
 else
   path = [selpath '\' x '.jpg'];
   imwrite(colorImg,path);
 end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
global colorVid;
colorVid = videoinput('kinect',1);
himage = image(zeros(640,480,3),'parent',handles.axes1);
preview(colorVid,himage);



function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
