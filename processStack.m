function imageExport = processStack(f,idxMap,baseSize,backgroundArr,normalizeArr,outputSize,mode)
    %f = full filename string
    %saveDir = directory to save the output batch
    %outputSize = true size of each output image frame
    %mode = image reconstruction method


    imageraw = imread_big(f{1});

    imageraw = double(remapImageTDD(imageraw, idxMap, baseSize, mode));

    if ~isempty(backgroundArr)
        imtemp = imageraw - backgroundArr;
        %imtemp = imtemp - min(imtemp,[],'all');
    else
        tempbkgd = mean(imageraw(:,:,5:9),3);
        imtemp = imageraw - tempbkgd;
    end

    if ~isempty(normalizeArr)
        imtemp = double(imtemp).*normalizeArr;
    end

    imtemp = imtemp - min(imtemp,[],'all');
    oallMax = max(imtemp(:,:,10:end),[],'all');
    imageExport = uint16(65535*(imtemp./oallMax));  

    imageExport(:,:,1:5) = 0;
end

