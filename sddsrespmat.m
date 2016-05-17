function [hM,vM] =  sddsrespmat(filename)
% function to read the response matrix from elegant

% filename [string] = rootname of the simulation containing the response
% matrices

% Note: the utility assumes that
%   .hrm = extension of horizontal resp mat file
%   .vrm = extension of vertical resp mat file

%% horizontal response matrix

try
hrm = sddsload([filename '.hrm']);
catch
    disp('No file .hrm found.')
end

fields = fieldnames(hrm.column);
hM=0;
for i=1:(length(fields))
    if ~or(strcmp(fields{i},'s'),strcmp(fields{i},'BPMName'))
            v = getfield(hrm.column.(fields{i}),'page1');
        if hM == 0
            hM=v;
        else
            hM = horzcat(hM,v);
        end
    else
        i=i+1;
    end
end

% figure(1);
% surf(hM);
% ylabel('# BPM'); xlabel('# corrector'); zlabel('orbit response (m/rad)');
 

%% vertical response matrix
try
    vrm = sddsload([filename '.vrm']);
catch
    dip('File .vrm not found.')
end

fields = fieldnames(vrm.column);
vM=0;
for i=1:(length(fields))
    if ~or(strcmp(fields{i},'s'),strcmp(fields{i},'BPMName'))
            v = getfield(vrm.column.(fields{i}),'page1');
        if vM == 0
            vM=v;
        else
            vM = horzcat(vM,v);
        end
    else
        i=i+1;
    end
end

% figure(2);
% surf(vM);
% ylabel('# BPM'); xlabel('# corrector'); zlabel('orbit response (m/rad)');
% 


end