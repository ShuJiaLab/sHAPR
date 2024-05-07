
vid = videoinput('hamamatsu', 1, 'MONO16_2048x2048_FastMode');
src = getselectedsource(vid);
src.TriggerConnector = 'bnc';
src.ExposureTime = .1;

vid.FramesPerTrigger = 1;
% vid.ROIPosition = [0 1020 2048 8];
 
% Retrieve the video resolution.
vidRes = vid.VideoResolution;

% Create a figure and an image object.
f = figure('Visible', 'off');
f.Name = ' TDD display live (press any key to exit)';

% The Video Resolution property returns values as width by height, but
% MATLAB images are height by width, so flip the values.
imageRes = fliplr(vidRes);
 
subplot(1,2,1);

hImage = imshow(zeros(imageRes));

% Set the axis of the displayed image to maintain the aspect ratio of the
% incoming frame.

axis image;

setappdata(hImage,'UpdatePreviewWindowFcn',@update_TDD_display);

% The PREVIEW function starts the camera and display. The image on which to
% display the video feed is also specified.
preview(vid, hImage);

  
pause();
% setappdata(hImage,'UpdatePreviewWindowFcn',@update_TDD_save);
setappdata(hImage,'UpdatePreviewWindowFcn',@update_TDD_display);
pause(src.ExposureTime*2)
% Stop the preview image and delete the figure.
stoppreview(vid);
delete(f);
delete(vid);
clear vid
close all
