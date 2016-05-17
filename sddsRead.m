function value = sddsRead(filename,col_par,col_par_name,pag)
% stores the values of a custom sdds file column or parameter into a matlab
% variable
%
% filename [string] rootname.extension of the sdds file from which to read
% col_par [switch] use 'col' to read a column, 'par' for a parameter
% col_par_name [string] name of the column/parameter to read
% pag [double] number of the page for the col/par to read
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

if col_par=='col'
    col_par='column';
    page1 = ['page' num2str(pag)];
else
    col_par='parameter';
    page1='data';
end
val = sddsload(filename);
value = val.(col_par).(col_par_name).(page1);
if pag~=0
    value=value(pag);
end