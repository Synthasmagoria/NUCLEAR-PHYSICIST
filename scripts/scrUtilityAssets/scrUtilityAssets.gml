/*
	Asset dependent utility functions
*/

///@desc Checks if a section in the config exists
///@func config_section_exists(section)
///@arg {string} section
function config_section_exists(section) {
	var val
	ini_open(CONFIG_FILENAME)
	val = ini_section_exists(section)
	ini_close()
	return val
}

///@desc Draws an arrow indicating that an interaction can be made
///@func draw_interaction_arrow()
function draw_interaction_arrow() {
draw_sprite_ext_outline(
	sInteractionArrow,
	(get_timer() / 100000) % sprite_get_number(sInteractionArrow),
	oPlayer.x - camera_get_view_x(view_camera[0]),
	oPlayer.y - 24 - camera_get_view_y(view_camera[0]),
	1, 1, 0, c_white, 1, 1, c_black);
}

///@desc Creates a spawner with the specified parameters
///@func spawner_create(x, y, obj, xoff, yoff, spd, rate, ahead, [ahead_off], [ahead_len])
///@arg {real} x
///@arg {real} y
///@arg {real} obj
///@arg {real} hs
///@arg {real} vs
///@arg {real} xoff
///@arg {real} yoff
///@arg {real} rate
///@arg {real} off
///@arg {real} ahead
function spawner_create(xx, yy, obj, hs, vs, xoff, yoff, rate, off, ahead) {

	var spawner = instance_create_layer(xx, yy, layer, oSpawner)
	
	with (spawner) {
		spawner.object = obj
		spawner.hs = hs
		spawner.vs = vs
		spawner.xoffset = xoff
		spawner.yoffset = yoff
		spawner.rate = rate
		spawner.offset = off
		spawner.ahead = ahead
		
		event_user(0)
		event_user(1)
	}

	return spawner
}

///@desc Creates a field that will destroy the specified object that enters it
///@func spawner_create_destroyer(x, y, obj, xscale, yscale)
///@arg {real} x
///@arg {real} y
///@arg {real} w
///@arg {real} y
///@arg {real} obj
function spawner_create_destroyer(xx, yy, w, h, obj) {
	var destroyer = instance_create_layer(xx, yy, layer, oDestroyer)
	instance_set_width(destroyer, w)
	instance_set_height(destroyer, h)
	destroyer.object = obj
	return destroyer
}

enum TRIGGERABLE {
	DIRECTIONAL,
	LINEAR,
	PATH,
	__MAX
}

function triggerable_data() constructor {
	type = -1
	i = 0
	directional = function(_ind, _dir, _spd) {
		i = _ind;
		v1 = _dir;
		v2 = fps_adjust(_spd);
		type = TRIGGERABLE.DIRECTIONAL
	}
	linear = function(_ind, _hs, _vs) {
		i = _ind;
		v1 = fps_adjust(_hs);
		v2 = fps_adjust(_vs);
		type = TRIGGERABLE.LINEAR
	}
	path = function(_ind, _pth, _spd, _enda, _abso) {
		i = _ind;
		v1 = _pth;
		v2 = fps_adjust(_spd);
		v3 = _enda;
		v4 = _abso;
		type = TRIGGERABLE.PATH
	}
}

function trigger(index) {
	var _triggerables = [
		oTriggerKiller,
		oTriggerBlock,
		oTriggerPlatform]
	
	for (var i = array_length(_triggerables) - 1; i >= 0; i--) {
		with _triggerables[i] {
			if tdata.i == index {
				switch tdata.type {
					case TRIGGERABLE.DIRECTIONAL: 
						direction = tdata.v1
						speed = tdata.v2
						break
					case TRIGGERABLE.LINEAR:
						hspeed = tdata.v1
						vspeed = tdata.v2
						break
					case TRIGGERABLE.PATH:
						if path_index == -1
							path_start(tdata.v1, tdata.v2, tdata.v3, tdata.v4)
						break
				}
			}
		}
	}
}
