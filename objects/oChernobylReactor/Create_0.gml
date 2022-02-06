;

enum REACTOR_STATE {
    SLUMBERING,
    WAIT,
    IDLE,
    RECHARGING,
    JUMPING,
    ATTACKING,
    VULNERABLE
}

state = -1
state_duration = -1
state_timer = 0
state_deferred = -1
state_deferred_duration = -1

jump_chance = 1/2
hp = 2400
hp_max = 3200
hp_death = 400
hp_damage = -20
hp_penalty = 35
difficulty = 0
attacking = false
vulnerable = false
projectile = oChernobylBossProjectile
alternation = -1
position_left = new vec2(32 + sprite_width, 358)
position_right = new vec2(529, 358)

vulnerable_duration = 0.8
recharge_duration = 2

with oHealthBar {
    target = other.id
    max_hp = other.hp_max
}

nixie = instance_create_depth(x + sprite_width / 2, y, depth + 1, oNixieClock)
nixie.create(3, abs(sprite_width))

feet = new vec2(sprite_width / 2, sprite_height)
eye = new vec2(107, 48)
hand = new vec2(54, 168)

#region jump variables
jump_direction = -1
jump_speed = fps_adjust(16)
jump_attack = -1
jump_to = new vec2(0,0)
#endregion

#region attack variables
attack_difficulty_number = 3
attack_difficulty_threshold = array_create(attack_difficulty_number - 1)
attack_difficulty_threshold[0] = 2000
attack_difficulty_threshold[1] = 1400
attack_difficulty_index = 0
attack_difficulty = array_create(attack_difficulty_number)
attack_difficulty[0] = new chernobyl_boss_attack_params(3, 0.5, 0, 5, 1, 3, fps_adjust(2), fps_adjust_2(0.1))
attack_difficulty[1] = new chernobyl_boss_attack_params(4, 0.45, 2, 9, 1, 5, fps_adjust(2) / 4, fps_adjust_2(0.08))
attack_difficulty[2] = new chernobyl_boss_attack_params(5, 0.4, 4, 22, 2, 8, fps_adjust(2) / 12, fps_adjust_2(0.05))

attack_difficulty_bg[0] = sReactorRoomHot
attack_difficulty_bg[1] = sReactorRoom
attack_difficulty_bg[2] = sReactorRoomCold

attack_number = 3
attack_rate = 0.5
attack_density = 0
attack_repetition_total = 5
attack_repetition_min   = 1
attack_repetition_max   = 3
attack_speed = fps_adjust(2)
attack_speed_incr = fps_adjust_2(0.1)

attack_repetition = array_create(attack_number)
attack_type = array_create(attack_number)
attack_index = 0
attack_timer = 0
attack_timer_tracker = 0
#endregion

#region misc functions
die = function() {
    instance_destroy()
    instance_create_depth(x, y, global.player_depth + 2, oChernobylReactorDeath).image_xscale = image_xscale
    sfx_play_sound(sndReactorDeath)
    oChernobylBackground.wobble = 0
    savedata_set_active("clear", true)
    
    var _door = instance_create_depth(room_width / 2 - 32, room_height / 2 - 32, global.player_depth + 1, oWarpDoor)
    _door.image_xscale = 2
    _door.image_yscale = 2
    _door.warp_room = rChernobylClear
    _door.destroy = true
    _door.outline = true
}

set_vulnerable = function(val) {
    vulnerable = val
    
    if val {
        image_blend = c_blue
        image_speed = 0.5
        sfx_play_sound(sndReactorVulnerable)
    }
}

reset_colors = function() {
    image_blend = c_white
    image_speed = 1
}

do_jump_windup_animation = function() {
    image_blend = c_white
    image_speed = 0
    image_index = 0
}
#endregion

#region attack functions
set_attack_number = function(num) {
    attack_number = num
    attack_repetition = array_create(attack_number)
    attack_type = array_create(attack_number)
    nixie.create(attack_number, abs(sprite_width) + 24 * (attack_number - 3))
}

set_attack_difficulty = function(diff) {
    attack_difficulty_index = diff
    set_attack_number(attack_difficulty[diff].number)
    attack_rate = attack_difficulty[diff].rate
    attack_density = attack_difficulty[diff].density
    attack_repetition_total = attack_difficulty[diff].repetition_total
    attack_repetition_min = attack_difficulty[diff].repetition_min
    attack_repetition_max = attack_difficulty[diff].repetition_max
    attack_speed = attack_difficulty[diff].speed
    attack_speed_incr = attack_difficulty[diff].speed_incr
    oChernobylBackground.sprite_index = attack_difficulty_bg[diff]
}

determine_attack_difficulty = function() {
    for (var i = 0; i < array_length(attack_difficulty_threshold); i++) {
        if hp > attack_difficulty_threshold[i] {
            return i
        }
    }
    return array_length(attack_difficulty_threshold);
}

get_attack_position = function() {
    return new vec2(x + hand.x * image_xscale, y + hand.y * image_yscale)
}

can_attack = function() {
    return attack_repetition[attack_index] > 0
}

use_next_attack_clip = function() {
    if (attack_index + 1) < attack_number {
        attack_index++
        return true
    } else {
        return false
    }
}

attack = function() {
    attack_type[attack_index]()
    do_attack_animation()
    attack_repetition[attack_index]--
    sfx_play_sound(sndReactorBlast)
}

attack_manual = function(ind) {
    __attack_type[ind]()
    do_attack_animation()
    sfx_play_sound(sndReactorBlast)
}

attacks_are_done = function() {
    return attack_index == attack_number - 1 && attack_repetition[attack_index] == 0
}

do_attack_animation = function() {
    image_index = 4
}

shuffle_attacks = function() {
    // Shuffle attack repetitions
    var _repetitions = attack_repetition_total
    attack_repetition = array_create(attack_number, attack_repetition_min)
    _repetitions -= attack_repetition_min * attack_number
    
    for (var i = 0, _add; _repetitions > 0; i = (i+1) % attack_number) {
        _add = irandom(min(_repetitions, attack_repetition_max - attack_repetition[i]))
        attack_repetition[i] += _add
        _repetitions -= _add;
    }
    
    array_randomize(attack_repetition)
    
    // Shuffle attack types (only 2)
    attack_type = array_create(attack_number)
    
    var _attack_type_num = array_length(__attack_type)
    
    for (var i = 0, _i = irandom(_attack_type_num - 1); i < 2 || i < attack_number; i++) {
        attack_type[i] = __attack_type[_i]
        _i = (_i + irandom(_attack_type_num - 2) + 1) % _attack_type_num
    }
    
    for (var i = 2; i < attack_number; i++) {
        attack_type[i] = attack_type[i - 2]
    }
}
#endregion

#region attack types
__attack_type = [
function() { // star
    var _number = 8 + attack_density, _circles = 2, _pos = get_attack_position(), _asep = random(360 / _number), _inst
    for (var i = 0; i < _circles; i++) {
        for (var ii = 0; ii < _number; ii++) {
            _inst = instance_create_depth(_pos.x, _pos.y, depth - 1, projectile)
            _inst.direction = 360 / _number * ii + 360 / _number / _circles * i + _asep
            _inst.gravity_direction = _inst.direction
            _inst.gravity = attack_speed_incr
            _inst.speed = attack_speed + i
        }
    }
},

function() { // shotgun blast
    var
    _pos = get_attack_position(),
    _number = 20 + attack_density,
    _dir = point_direction(_pos.x, _pos.y, oPlayer.x, oPlayer.y),
    _randdir = 6,
    _rotmat = mat2_create_rotation_matrix(_randdir / _number),
    _dirvec = new vec2(
        lengthdir_x(1, _dir - _randdir / 2),
        lengthdir_y(1, _dir - _randdir / 2)),
    _rand_spawndist = 64,
    _spawndist
    
    for (var i = 0; i < _number; i++) {
        // Spawn with a random distance in the shot direction
        _spawndist = irandom(_rand_spawndist)
        _inst = instance_create_depth(_pos.x + _dirvec.x * _spawndist, _pos.y + _dirvec.y * _spawndist, depth - 1, projectile)
        mult_mat2_vec2(_rotmat, _dirvec, _dirvec)
        
        _inst.direction = _dir + random_range(-_randdir, _randdir)
        _inst.gravity_direction = _inst.direction
        _inst.gravity = attack_speed_incr
        _inst.speed = attack_speed
        _inst.image_xscale = random_range(0.5, 1.2)
        _inst.image_yscale = _inst.image_xscale
    }
},

function() {
    var
    _pos = get_attack_position(),
    _number = 12 + attack_density,
    _inst,
    _asep = random(360 / _number)
    
    for (var i = 0; i < _number; i++) {
        _inst = instance_create_depth(_pos.x, _pos.y, depth - 1, projectile)
        _inst.direction = 360 / _number * i + _asep
        _inst.speed = attack_speed
        _inst.rotation_speed = fps_adjust(0.4) * alternation
        _inst.speed_increase = attack_speed_incr
    }
    
    alternation *= -1
}

// function() {
//     var
//     _number = 12,
//     _inst
    
//     for (var i = 0; i < _number; i++) {
//         _inst = instance_create_depth(oPlayer.x + random_range(-4, 4), random_range(-12, -4), depth - 1, projectile)
//         _inst.vspeed = attack_speed * 2
//         _inst.speed_increase = fps_adjust(random_range(0.09, 0.11))
//     }
// }
]
#endregion

defer_state = function(deferred_state, del = -1, dur = -1) {
    set_state(REACTOR_STATE.WAIT, del)
    state_deferred = deferred_state
    state_deferred_duration = dur
}

set_state = function(new_state, dur = -1) {
    if state != new_state {
        // Coming from a state
        switch state {
            case REACTOR_STATE.VULNERABLE:
            set_vulnerable(false)
            break
        }
        
        reset_colors()
        state = new_state
        state_timer = dur
        
        // Transitioning to a state
        switch state {
            case REACTOR_STATE.SLUMBERING:
            image_blend = c_purple
            image_speed = 0.1
            break
            
            case REACTOR_STATE.RECHARGING:
            var _diff = determine_attack_difficulty()
            if _diff != attack_difficulty_index {
                if _diff > attack_difficulty_index {
                    sfx_play_sound(sndReactorLevelUp)
                } else {
                    sfx_play_sound(sndReactorLevelDown)
                }
                set_attack_difficulty(_diff)
            }
            image_speed = -0.75
            image_blend = c_gray
            shuffle_attacks()
            nixie.set_all(attack_repetition)
            break
            
            case REACTOR_STATE.JUMPING:
            jump_direction = -1
            sfx_play_sound(sndReactorJump)
            if x == position_left.x {
                jump_to.set(position_right.x, position_right.y)
            } else {
                jump_to.set(position_left.x, position_left.y)
            }
            break
            
            case REACTOR_STATE.ATTACKING:
            attack_timer = 0
            attack_timer_tracker = 0
            break
            
            case REACTOR_STATE.VULNERABLE:
            set_vulnerable(true)
            break
        }
    }
}

// Initialize
x = position_right.x
y = position_right.y
set_state(REACTOR_STATE.RECHARGING, recharge_duration)