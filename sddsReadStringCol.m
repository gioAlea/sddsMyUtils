function namearray = sddsReadStringCol(filename,col,pag)
% extracts string value from an sddsfile or sddsloaded variable COLUMN
% INPUT:
% filename (string)-> name of sdds file or sddsloaded variable
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
	
    names = sdds.column.(col).(page);
	
    names_size=size(names,1);
	
    namearray = cell(names_size,1);
   
    if sdds.column.(col).type == 'string'
          for i=1:names_size
            namearray{i}=strtrim(strjoin(cellstr(char(names(i,:)))));
          end   
    else
        namearray = names;
    end
    
end
