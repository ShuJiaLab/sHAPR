function [imageProcessed] = remapStack(imageRaw, idx_top, idx_bot, imgSize, fiberSize, posOffset, mode)
%Performs TDD pixel remapping for a whole stack of frames

    remapFcn = @(im) remapImageTDD(im,idx_top,idx_bot,imgSize,fiberSize,posOffset,mode);
    
    
    temp = remapFcn(imageRaw{1});
    imageProcessed = zeros([size(temp),length(imageRaw)]);
    imageProcessed(:,:,1) = temp;
    
    for i = 2:length(imageRaw)
        imageProcessed(:,:,i) = remapFcn(imageRaw{i});
    end
    
end