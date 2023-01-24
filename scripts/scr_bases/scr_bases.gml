function Entity(health_, speed_, stamina) constructor {
	MIN_HEALTH = 0
	MAX_HEALTH = health_
	_health = MAX_HEALTH
	
	MAX_SPEED = speed_
	_speed = MAX_SPEED
	
	MAX_STAMINA = stamina
	_stamina = MAX_STAMINA
	
	static heal = function(amount) { _health = min(_health + amount, MAX_HEALTH) }
	static damage = function(amount) { _health = max(_health - amount, MIN_HEALTH) }
	static reset_health = function() { _health = MAX_HEALTH }
	
	static do_movement = function() {}
}

function Player(health_, speed_, stamina) : Entity(health_, speed_, stamina) constructor {
	static do_movement = function() {
		other.x += _speed
		other.y += _speed
	}
}
