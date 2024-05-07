function imOut = remapImageTDD(imgRaw, mapTables, subImSize, mode)
%remapPixelsTDD - Taskes raw images from the TDD system, which are long rows
%of pixels, and remaps them to an image with a predetermined size.
%
%It does this by using a mapTable to determine the locations of the top-left
%corners of a square of pixels belongong to one fiber, and then sums the
%pixels in this group, and assigns the value to the correspsonding pixel in
%the output image.
%
%INPUT PARAMETERS
%imgRaw - double(:,:), uint16(:,:), uint32(:,:) - matrix representation of
%the raw image data
%mapTable - double(2,:) - array whose elements which correspond to the
%pixel of the top-left of the square of pixels belonging to a fiber
%that should be grouped and assigned to the corresponding output index

%DON'T CHANGE THESE
%imgOutSize - [w,h] - desired output image dimensions
%fiberSize - double - square length of the number of pixels per fiber.
%offset - [x,y] - pixel offset

%OUTPUT PARAMETERS
%imgOut - double(:,:) - remapped image output

for i = 1:length(mapTables)

    extractBlock = imgRaw(mapTables(i).v,mapTables(i).h,:);

    if strcmpi(mode,'4x4 Sum') %Summation image formation
        sumfun = @(block) sum(block.data,[1,2]);
        tmp = blockproc(extractBlock,[4,4],sumfun);
        imPart{i} = reshape(tmp,[subImSize,size(extractBlock,3)]);

    elseif strcmpi(mode,'4x4 Tile')
        tmp = reshape(extractBlock,[16,numel(extractBlock)/16]);
        imPart{i} = col2im(tmp,[4,4],[4*subImSize],'distinct');

    elseif strcmpi(mode,'2x2 Tile')
        sumfun = @(block) sum(block.data,[1,2]);
        tmp = blockproc(extractBlock,[2,2],sumfun);
        tmp = reshape(tmp,[4,numel(tmp)/4]);
        imPart{i} = col2im(tmp,[2,2],[2*subImSize],'distinct');

    else
        error('Invalid image assembly mode');

    end
 
end

imOut = flipud(cat(2,fliplr(imPart{1}),imPart{2}));

end

