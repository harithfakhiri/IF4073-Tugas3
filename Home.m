function varargout = Home(varargin)
% HOME MATLAB code for Home.fig
%      HOME, by itself, creates a new HOME or raises the existing
%      singleton*.
%
%      H = HOME returns the handle to a new HOME or the handle to
%      the existing singleton*.
%
%      HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME.M with the given input arguments.
%
%      HOME('Property','Value',...) creates a new HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Home

% Last Modified by GUIDE v2.5 11-Nov-2022 18:30:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_OutputFcn, ...
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


% --- Executes just before Home is made visible.
function Home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Home (see VARARGIN)

% Choose default command line output for Home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Home_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in soal__uploadBtn.
function soal__uploadBtn_Callback(hObject, eventdata, handles)
[rawname, rawpath] = uigetfile(({'*.png';'*.jpg';'*.tiff'}), 'Select Image');
fullname = [rawpath rawname];
set(handles.soal__directory, 'String', fullname);



function soal__directory_Callback(hObject, eventdata, handles)
% hObject    handle to soal__directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of soal__directory as text
%        str2double(get(hObject,'String')) returns contents of soal__directory as a double


% --- Executes during object creation, after setting all properties.
function soal__directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soal__directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in soal__dropdown.
function soal__dropdown_Callback(hObject, eventdata, handles)
% hObject    handle to soal__dropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns soal__dropdown contents as cell array
%        contents{get(hObject,'Value')} returns selected item from soal__dropdown


% --- Executes during object creation, after setting all properties.
function soal__dropdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soal__dropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in soal__executeBtn.
function soal__executeBtn_Callback(hObject, eventdata, handles)
fullname = get(handles.soal__directory, 'String');
img = imread(fullname);

axes(handles.soal__inputImg);
imshow(img);
title('Input Image');

idx = get(handles.soal__dropdown,'Value');
items = get(handles.soal__dropdown,'String');
selectedItem = items{idx};

disp(selectedItem);

switch selectedItem
    case "Laplace"
        edgeImg = laplace(img);
        type = "laplace";
    case "Log"
        edgeImg = log_edge(img);
        type = "log_edge";
    case "Sobel"
        edgeImg = sobel(img);
        type = "sobel";
    case "Prewitt"
        edgeImg = prewitt(img);
        type = "prewitt";
    case "Roberts"
        edgeImg = roberts(img);
        type = "roberts";
    case "Canny"
        edgeImg = canny(img);
        type = "canny";
    otherwise
        edgeImg = sobel(img);
        type = "sobel";
end

axes(handles.soal__edgeImg);
imshow(edgeImg);
title('Edge Detection');

outputImg = segmentation(img, edgeImg, type);
axes(handles.soal__outputImg);
imshow(outputImg);
title('Output Image');
