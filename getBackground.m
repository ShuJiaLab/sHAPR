function [backgroundImage] = getBackground(bkgdRaw, idx_top, idx_bot, imgOutSize, fiberSize, offset, mode)



backgroundArr = zeros(size(bkgdRaw{1}));
for i = 1:length(bkgdRaw)
    backgroundArr = backgroundArr + double(remapImageTDD(bkgdRaw{i}, idx_top, idx_bot, imgOutSize, fiberSize, offset, mode))/length(bkgdRaw);
end

end

