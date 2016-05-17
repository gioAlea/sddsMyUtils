function [Cx,Cy] = sddsReadCentroidAtBpm(filename)
% function to extract the centroid position at the location of the
% horizontal and verical monitors
% filename = rootname of the centroid
% [x,y] = horizontal and verical centroi

% N.B. = it takes into account eventually misaligned monitors

%% %%%%%%%% horizontal position
cen=sddsload([filename '.cen']);
CENx={sddsReadCol(cen,'ElementType',1), sddsReadCol(cen,'Cx',1)};

for i=1:length(CENx{1})
     idx(i)=strcmp(CENx{1}(i),'HMON');
end

%
try
    erslog = sddsload([filename '.erl']);
    
    xOfs={sddsReadCol(erslog,'ElementType',1),sddsReadCol(erslog,'ElementParameter',1),...
        
    sddsReadCol(erslog,'ParameterValue',1)};

for i=1:length(xOfs{1})
    
    HofsIdx(i)= and(strcmp(xOfs{1}(i),'HMON'),strcmp(xOfs{2}(i),'DX'));
    
end

Cx = CENx{2}(idx)-xOfs{3}(HofsIdx); %because if offset = 1 and beam passing through 0, reading is -1

catch
    
    Cx=CENx{2}(idx);

end


%% %%%%%%%%% vertical position
CENy={sddsReadCol(cen,'ElementType',1), ...
    sddsReadCol(cen,'Cy',1)};

for i=1:length(CENy{1})
  
    jdx(i)=strcmp(CENy{1}(i),'VMON');

end

try

    yOfs={sddsReadCol(erslog,'ElementType',1),sddsReadCol(erslog,'ElementParameter',1),...
    
    sddsReadCol(erslog,'ParameterValue',1)};
    
for i=1:length(yOfs{1})

    VofsIdx(i)=and(strcmp(yOfs{1}(i),'VMON'),strcmp(yOfs{2}(i),'DY'));
    
end

Cy=CENy{2}(jdx)-yOfs{3}(VofsIdx);

catch
    
    Cy=CENy{2}(jdx);

end


end


