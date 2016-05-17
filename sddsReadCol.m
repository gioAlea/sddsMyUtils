function value = sddsReadCol(filename,col,pag)
% col = column name

switch class(filename)
		case 'char'
			val = sddsload(filename);
		case 'struct'
			val = filename;
end

page1 = ['page' num2str(pag)];
value = val.column.(col).(page1);

end