function array_min(array) {
	var _min = array[0]
	for (var i = 0; i < array_length(array); i++) {
		_min = min(_min, array[i])
	}
	return _min
}

function array_max(array) {
	var _max = array[0]
	for (var i = 0; i < array_length(array); i++) {
		_max = max(_max, array[i])
	}
	return _max
}

function wrap_value(value, _max) {
	return (value + _max) % _max
}