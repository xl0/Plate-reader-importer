function ind = pos2ind(letter, number)
	
	if (~isletter(letter))
		error('First argument must be a letter');
	end

	if (~isnumeric(number))
		error('Second argument must be numeric');
	end

	% Convert the letter to upper case
	letter = upper(letter);


	% From A to H.
	ind = (letter - 'A') * 8 + number;

end
