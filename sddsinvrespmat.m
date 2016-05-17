function [hM,vM] =  sddsinvrespmat(filename)
% function to read the inverse response matrix from elegant

% filename [string] = rootname of the simulation containing the inverse
% response matrices

% Note: the utility assumes that
%   .hirm = extension of horizontal inv resp mat file
%   .virm = extension of vertical inv resp mat file

%% horizontal response matrix
try
    hrm = sddsload([filename '.hirm']);
catch
    disp('No file with the .hirm extension found').
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

%figure(1);
%surf(hM);
%ylabel('# BPM'); xlabel('# corrector'); zlabel('orbit response (m/rad)');

%% vertical response matrix
try
vrm = sddsload([filename '.virm']);
catch
disp('No file with .virm extension found.')
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

%figure(2);
%surf(vM);
%ylabel('# BPM'); xlabel('# corrector'); zlabel('orbit response (m/rad)');



end