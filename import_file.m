function D = import_file(filename)

	D = 0;

	[fid, message] = fopen(filename);
	if (fid < 0)
		error(strcat(filename, ': ', message));
	end

	% Format: %s - string, %f - number
	D = textscan(fid, '%f%f%f%s%s', 'Delimiter', '\t', 'HeaderLines', 1);

	fclose(fid);
end
