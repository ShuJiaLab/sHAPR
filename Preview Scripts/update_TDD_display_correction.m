function update_TDD_display_correction(~,event,hImage)
% This callback function updates the displayed frame and the histogram.

%%
load('C:\Users\seren\Documents\TDD\IDX_top_08102021.mat','idx_top');
load('C:\Users\seren\Documents\TDD\IDX_bot_08102021.mat','idx_bot');

%% Display the current image frame.
set(hImage, 'CData', event.Data);

%% Select the second subplot on the figure
subplot(2,2,2);

%%
img = event.Data;
img1 = zeros(400,1);
img2 = zeros(400,1);

% for i = 1:400
%     img1(i) = sum(img(1021:1024,idx_top(i):(idx_top(i)+3)),'all');
% end
% 
% for i = 1:400
%     img2(i) = sum(img(1025:1028,idx_bot(i):(idx_bot(i)+3)),'all');
% end
a = sort(idx_top);
b = sort(idx_bot);

img3 = img(1021:1028, 60:80);
img_r = zeros(8, 2048);
img_r(1:4, a(1):a(1)+3) = 1;
img_r(1:4, a(2):a(2)+3) = 1;
%img_r(5:8, b(3):b(3)+3) = 1;
%img_r(5:8, b(4):b(4)+3) = 1;
img_mark = img_r(1:8, 60:80);

img_final = cat(3, img_mark, nrm(img3), nrm(img3));

imagesc(img_final); axis image


img4 = img(1021:1028, 1960:1980);
img_r2 = zeros(8, 2048);
img_r2(5:8, a(end):a(end)+3) = 1;
img_r2(5:8, a(end-1):a(end-1)+3) = 1;
img_mark2 = img_r2(1:8, 1960:1980);

img_final2 = cat(3, img_mark2, nrm(img4), nrm(img4));
subplot(2,2,4)
imagesc(img_final2); axis image


% colormap gray;
% axis image;
% axis off; 
% colorbar;
% caxis([0 5000])


% plot(sum(img3,1),'.-');

% Refresh the display.
drawnow

end
