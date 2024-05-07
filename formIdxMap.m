function [idxMap] = formIdxMap(idxMap,offset,fiberSize)
%Creates the index map of the system given the fiber top and bottom
%indices, offset, and fiber size.

%fiberSize - double - square length of the number of pixels per fiber.
%offset - [x,y] - pixel offset


temp.v= [1 + offset(2) : 1 + offset(2) + (fiberSize-1)];
hmap = repmat(idxMap'+offset(1),[fiberSize,1]) + [0:fiberSize-1]';
temp.h = hmap(:)';

idxMap = temp;
end

