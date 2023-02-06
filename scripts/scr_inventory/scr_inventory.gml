function Item() constructor {}
function Weapon() : Item() constructor {}
function Tool() : Item() constructor {}

function Crowbar() constructor {
	static Draw = function() {
		draw_sprite(spr_crowbar, 0, obj_player.x, obj_player.y)
	}
}
function Plank() constructor {
	static Draw = function() {
		draw_sprite(spr_plank, 0, obj_player.x, obj_player.y)
	}
}

function Inventory() constructor {
	inventory = [new Crowbar(), new Plank()]
	selected_item = 0
	static Draw = function() {
		var _item = inventory[| selected_item]
		_item.Draw()
	}
 }
 
