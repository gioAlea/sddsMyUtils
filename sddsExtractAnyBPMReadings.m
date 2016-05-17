function [Cx,Cy]=sddsExtractAnyBPMReadings(filename,ext,col1,col2,pag)
% function to extract any function value (centroid, twiss, etc) at the location of the
% horizontal and verical monitors
% filename = rootname of the centroid
% [Cx,Cy] = horizontal and verical signal

% N.B. = if any misalignement is present, it is NOT taken into account
%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%% horizontal
cen=sddsload([filename '.' ext]);
CENx={sddsReadCol(cen,'ElementType',pag), sddsReadCol(cen,col1,pag)};

for i=1:length(CENx{1})
     idx(i)=strcmp(CENx{1}(i),'HMON');
end

Cx=CENx{2}(idx);


%% %%%%%%%%% vertical
CENy={sddsReadCol(cen,'ElementType',pag), ...
    sddsReadCol(cen,col2,pag)};

for i=1:length(CENy{1})
    jdx(i)=strcmp(CENy{1}(i),'VMON');
end

Cy=CENy{2}(jdx);

end


