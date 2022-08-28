function var = importexpdata(fileName)
opts = delimitedTextImportOptions("NumVariables", 5);
opts.DataLines = [3, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["xaxis", "VarName2", "VarName3", "VarName4", "VarName5"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

var = table2array(readtable(fileName + ".csv", opts));
end