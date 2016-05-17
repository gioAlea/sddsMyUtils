function fileList = sddsSaveMultiplePages(fileRoot,fileEnd,counter,globalFilename,sameName)
% merges different files in a single sdds file with each page containing
% one of the original files in the order given by the user
% 
% sddsSaveMultiplePages(fileRoot,fileEnd,counter,globalFilename,sameName)
% 
% sameName [switch 0/1] if 1 the files to merge have the sameName
% fileRoot [string] rootname of the sddsfile
% fileEnd [string] extension of the sddsfile
% counter
% globalFileName
% fileList = list of merged files

fileList = [];

if sameName == 1
    for k=1:counter
        kthFile = [fileRoot '.' fileEnd ' '];
        fileList = horzcat(fileList,kthFile);
    end
else
    for k=1:counter
        kthFile = [fileRoot num2str(k) '.' fileEnd ' '];
        fileList = horzcat(fileList,kthFile);
    end
end

command = ['sddscombine ' fileList ' -pipe=out '...
    '| sddsprocess -pipe=in ' globalFilename ' -define=col,Page,i_page'];
system(command);
