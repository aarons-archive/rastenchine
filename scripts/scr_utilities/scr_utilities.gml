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

function random_instance_of(instance) {
	var instances = []
	for (var i = 0; i < instance_number(instance); ++i){
		instances[i] = instance_find(instance, i)
	}
 	return instances[irandom_range(0, array_length(instances) - 1)]
}