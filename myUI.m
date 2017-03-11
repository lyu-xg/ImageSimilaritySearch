function varargout = myUI(varargin)
% MYUI MATLAB code for myUI.fig
%      MYUI, by itself, creates a new MYUI or raises the existing
%      singleton*.
%
%      H = MYUI returns the handle to a new MYUI or the handle to
%      the existing singleton*.
%
%      MYUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYUI.M with the given input arguments.
%
%      MYUI('Property','Value',...) creates a new MYUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myUI

% Last Modified by GUIDE v2.5 10-Aug-2015 09:42:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myUI_OpeningFcn, ...
                   'gui_OutputFcn',  @myUI_OutputFcn, ...
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


% --- Executes just before myUI is made visible.
function myUI_OpeningFcn(hObject, eventdata, handles, varargin)

global LBPFeatures
global LBPTable
global ColorCorrelograms
global ColorCorrelogramsTable
global ColorFeatures
global ColorFeaturesTable
global Fouriers
global FouriersTable
global allNames
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myUI (see VARARGIN)

% Choose default command line output for myUI
handles.output = hObject;

load result.mat



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global filename
global pathname
[filename, pathname] = uigetfile( ...
    {'*.bmp;*.jpg;*.png;*.jpeg', 'Image Files (*.bmp, *.jpg, *.png,*.jpeg)'...
    ;'*.*','All Files (*.*)'},'Pick an image');
if isequal(filename,0) || isequal(pathname,0),
    return; 
end
imshow(imread([pathname filename]));



% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
global filename
global pathname
global LBPFeatures
global LBPTable
global ColorCorrelograms
global ColorCorrelogramsTable
global ColorFeatures
global ColorFeaturesTable
global Fouriers
global FouriersTable
global allNames
[pathname filename]
r = search([pathname filename],LBPFeatures,LBPTable,ColorCorrelograms,ColorCorrelogramsTable,...
    ColorFeatures,ColorFeaturesTable,Fouriers,FouriersTable,allNames);
posx = 0;
posy = 0;
for i=1:20       
    if mod(i,5)==1
        posx = 0;
        poxy = 1-ceil(i/5)*0.25;
    end
    subplot('position',[posx,poxy,.2,.24]);
    posx = posx + 0.2;
    strname = strcat('data/images/',allNames(r(i)).name);
    imshow(imresize(imread(strname),[512,512]));
    %imshow(imread('data/images/PlayingGuitar_0007.jpg'))
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
global filename
global pathname
global LBPFeatures
global LBPTable
global ColorCorrelograms
global ColorCorrelogramsTable
global ColorFeatures
global ColorFeaturesTable
global Fouriers
global FouriersTable
global allNames
[filename, pathname] = uigetfile( ...
    {'*.bmp;*.jpg;*.png;*.jpeg', 'Image Files (*.bmp, *.jpg, *.png,*.jpeg)'...
    ;'*.*','All Files (*.*)'},'Pick an image');
if isequal(filename,0) || isequal(pathname,0),
    return; 
end

%imshow(imread([pathname filename]));
%r = search([pathname filename],LBPFeatures,LBPTable,ColorCorrelograms,ColorCorrelogramsTable,...
%    ColorFeatures,ColorFeaturesTable,Fouriers,FouriersTable,allNames);

im = imread([pathname filename]);
im = imresize(im,[128,128]);
l = LBP(im)';
cc = ColorCorrelogram(im,6);
cf = yanseju(im)';
f = fourier(im);
getsize = 20;
rank1234 = zeros(4,getsize);
[rank1234(1,:),~] = lshlookup(l,LBPFeatures',LBPTable,'k',getsize,'distfun','lpnorm','distargs',{2});
[rank1234(2,:),~] = lshlookup(cc,ColorCorrelograms',ColorCorrelogramsTable,'k',getsize,'distfun','lpnorm','distargs',{2});
[rank1234(3,:),~] = lshlookup(cf,ColorFeatures',ColorFeaturesTable,'k',getsize,'distfun','lpnorm','distargs',{2});
[rank1234(4,:),~] = lshlookup(f,Fouriers',FouriersTable,'k',getsize,'distfun','lpnorm','distargs',{2});

nnlsh = union(union(rank1234(1,:), rank1234(2,:)),union(rank1234(3,:),rank1234(4,:)));


d_lbp=sum(abs(bsxfun(@minus,l,LBPFeatures(nnlsh,:)')))/45000;
d_color=sum(abs(bsxfun(@minus,cc,ColorCorrelograms(nnlsh,:)')))/6;
d_colorfeatures=sum(abs(bsxfun(@minus,cf,ColorFeatures(nnlsh,:)')))/4;
d_fouriers=sum(abs(bsxfun(@minus,f,Fouriers(nnlsh,:)')))/10000;
d = d_lbp + d_color + d_colorfeatures + d_fouriers;
[~,ind]=sort(d);


posx = 0;
for i=1:20       
    if mod(i,5)==1
        posx = 0;
        poxy = 1-ceil(i/5)*0.25+0.05;
    end
    subplot('position',[posx,poxy,.2,.24]);
    posx = posx + 0.2;
    
    strname = strcat('data/images/',allNames(nnlsh(ind(i))).name);
    imshow(imresize(imread(strname),[512,512]));
    %imshow(imread('data/images/PlayingGuitar_0007.jpg'))
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
