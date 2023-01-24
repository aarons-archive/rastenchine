event_inherited()

function Tool(durability) : Item() constructor {
	MIN_DURABILITY = 0
	MAX_DURABILITY = durability
	_durability = MAX_DURABILITY
}