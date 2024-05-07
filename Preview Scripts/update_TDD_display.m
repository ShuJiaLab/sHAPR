function img_final = update_TDD_display(~,event,hImage)
% This callback function updates the displayed frame and the histogram.

%%
load('C:\Users\seren\Documents\TDD\IDX_top_08102021','idx_top');
load('C:\Users\seren\Documents\TDD\IDX_bot_08102021','idx_bot');

%% Display the current image frame.
set(hImage, 'CData', event.Data);

%% Select the second subplot on the figure
subplot(2,2,2);

%%
img = event.Data;
img1 = zeros(400,1);
img2 = zeros(400,1);

for i = 1:400
    img1(i) = sum(img(1021:1024,idx_top(i):(idx_top(i)+3)),'all');
end

for i = 1:400
    img2(i) = sum(img(1025:1028,idx_bot(i):(idx_bot(i)+3)),'all');
end


img1 = flipud(reshape(img1,20,20));
img1 = fliplr(img1);
img2 = flipud(reshape(img2,20,20));
img_final = cat(2, img1, img2);

imagesc(img_final);
colormap gray;
axis image;
axis off; 
colorbar;
% caxis([0 5000])

subplot(2,2,4)
plot(sum(img_final,1),'.-');

% Save

% save('TDD_display','img_final');
% Refresh the display.
drawnow

end
