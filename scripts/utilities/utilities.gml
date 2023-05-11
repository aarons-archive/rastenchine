function wrap(value, _max) {
	return (value + _max) % _max
}

function instances_of(object) {
    var instances = []
	for (var i = 0; i < instance_number(object); ++i){
		instances[i] = instance_find(object, i)
	}
	return instances
}

function random_instance_of(object) {
	var instances = instances_of(object)
 	return (array_length(instances) <= 0) ? (undefined) : (instances[irandom_range(0, array_length(instances) - 1)])
}

function collision_line_point(x1, y1, x2, y2, qi, qp, qn) {
	var rr, rx, ry
	rr = collision_line(x1, y1, x2, y2, qi, qp, qn)
	rx = x2
	ry = y2
	if (rr != noone) {
	    var p0 = 0
	    var p1 = 1
	    repeat (ceil(log2(point_distance(x1, y1, x2, y2))) + 1) {
	        var np = p0 + (p1 - p0) * 0.5
	        var nx = x1 + (x2 - x1) * np
	        var ny = y1 + (y2 - y1) * np
	        var px = x1 + (x2 - x1) * p0
	        var py = y1 + (y2 - y1) * p0
	        var nr = collision_line(px, py, nx, ny, qi, qp, qn)
	        if (nr != noone) {
	            rr = nr
	            rx = nx
	            ry = ny
	            p1 = np
	        } else p0 = np
	    }
	}
	var r
	r[0] = rr
	r[1] = rx
	r[2] = ry
	return r
}