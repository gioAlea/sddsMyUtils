function array = sddsreadany(filename,col_par,col,pag)
% extracts string value from an sddsfile or sddsloaded variable COLUMN
% INPUT:
% filename (string)-> name of sdds file or sddsloaded variable
% col_par (string)-> switch to select wether data is on column or parameter
% of the sdds file
% col (string)-> column name
% pag (integer) -> page number
% OUTPUT:
% namearray -> array of the values of the strings read

switch class(filename)
    case 'char'
        sdds=sddsload(filename);
    case 'struct'
        sdds=filename;
end

page = ['page' num2str(pag)];

switch col_par
    case 'col'
        names = sdds.column.(col).(page);
        dataType = sdds.column.(col).type;
    case 'par'
        names = sdds.parameter.(col).data;
        dataType = sdds.parameter.(col).type;
    otherwise
        disp('Unknown method.')
end

names_size = size(names,1);

array = cell(names_size,1);

switch class(dataType)
    case 'java.lang.String'
        if dataType == 'string'
            for i=1:names_size
            array{i}=strtrim(strjoin(cellstr(char(names(i,:)))));
            end
        else
            array = names;
        end
    case 'java.lang.Char'
        array = names;
    otherwise
        disp('Unknown method.')
end

end
