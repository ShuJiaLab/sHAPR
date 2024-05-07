function [] = writeTiff(fileName,folderName,data)
    fileNameOut = [folderName,fileName(1:end-4),'_Processed','.tif'];

    fTIF = Fast_Tiff_Write(fileNameOut,0.125,0);
    for i = 1:size(data,3)
        fTIF.WriteIMG(permute(data(:,:,i),[2,1,3]));
    end

    fTIF.close;
end


