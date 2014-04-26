function result = import_plate(directory)

	% If the user gave no directory,
	if (~exist('directory'))
		% open a dialog to select one.
		directory = uigetdir([], 'Feed me plates');
	end


	% Check that it is indeed a directory
	if(~isdir(directory))
		error(strcat('''', directory, ''' is not a directory, or does not exist'));
	end

	% Get a list of the contents of the directory
	files = dir(directory);

	data = [];

	% loop through the directory entries
	for file = files'
		% If an entry in the list is not a directory
		if(~file.isdir)
			% Get its contents
			D = import_file(fullfile(directory, file.name));

			% If we did not get 96 readings, something went wrong
			if(length(D{1}) ~= 96)
				error(strcat('file ', fullfile(directory, file.name), ' looks corrupt - did not get 96 entries'));
			end

			% Append the new data to the matrix
			data = [ data ; D ];
		end
	end


	% Number of entries (gfp, rfp, OD, etc) and number of scans.
	[scans, rows] = size(data);

	% Rearrange the data for easier access

	result = [];

	% For each measure type
	for row = 1:rows
		% We only work with numbers. If the the row contains
		% strings (for example, 'A10'), go to the next one.
		if (iscellstr(data{1, row}))
			continue
		end

		new_entry = [];
		for scan = 1:scans
			new_entry = [ new_entry,  data{scan, row}];
		end

		result = cat(3, result, new_entry);

	end

end
