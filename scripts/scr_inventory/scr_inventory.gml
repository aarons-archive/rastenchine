function Item() constructor {}
function Weapon() : Item() constructor {}
function Tool() : Item() constructor {}

function Crowbar() constructor {
	static draw = function() {
		draw_sprite(spr_crowbar, 0, obj_player.x, obj_player.y)
	}
}
function Plank() constructor {
	static draw = function() {
		draw_sprite(spr_plank, 0, obj_player.x, obj_player.y)
	}
}
function Gun() constructor {
	static draw = function() {
		draw_sprite(spr_gun, 0, obj_player.x, obj_player.y)
	}
}

function Inventory() constructor {
	items = [new Crowbar(), new Plank(), new Gun()]
	selected_item = 0
	static draw = function() {
		var _item = items[selected_item]
		_item.draw()
	}
	static change_item = function(index) {
		selected_item = index
	}
 }
 
