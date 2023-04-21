x = obj_player.x
y = obj_player.y - PLAYER_ORIGIN_OFFSET

light[| eLight.X] = x
light[| eLight.Y] = y
light[| eLight.Flags] |= eLightFlags.Dirty
