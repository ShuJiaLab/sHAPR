function [normArr] = getNormalization(matrixIn,maxPrc,minPrc)
%Produces intensity multiplication matrix to normalize light quantities
%Includes a thresold cutoff so values don't go to infinity

normtemp = matrixIn;
normtemp = normtemp - min(normtemp,[],'all');
normtemp = normtemp./prctile(normtemp(:),maxPrc);

minthresh = prctile(normtemp(:),minPrc);

normtemp(normtemp<minthresh) = minthresh;
normArr = 1./normtemp;

end