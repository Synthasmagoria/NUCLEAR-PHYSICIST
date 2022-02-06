;

if !instance_exists(oPlayer) && state != REACTOR_STATE.SLUMBERING && state != REACTOR_STATE.JUMPING {
    set_state(REACTOR_STATE.SLUMBERING)
}

var _state_timer_next = state_timer - f2sec(1)

// Timed state events
if state_timer >= 0 && _state_timer_next < 0 {
    switch state {
        case REACTOR_STATE.WAIT:
        if state_deferred != -1 {
            set_state(state_deferred, state_deferred_duration)
        }
        state_deferred = -1
        state_deferred_duration = -1
        break
        
        case REACTOR_STATE.RECHARGING:
        attack_index = 0
        set_state(REACTOR_STATE.ATTACKING)
        break
        
        case REACTOR_STATE.VULNERABLE:
        if can_attack() {
            set_state(REACTOR_STATE.ATTACKING)
        } else {
            if random_chance(jump_chance) {
                defer_state(REACTOR_STATE.JUMPING, 1)
                do_jump_windup_animation()
                sfx_play_sound(sndReactorBlink)
                var _eye = position_make_relative(eye)
                instance_create_depth(_eye.x, _eye.y, depth - 1, oChernobylBossTwinkle)
            } else {
                set_state(REACTOR_STATE.RECHARGING, recharge_duration)
            }
        }
        break
    }
} else {
    state_timer = _state_timer_next
}

// Constant state events
switch state {
    case REACTOR_STATE.RECHARGING:
        break
    case REACTOR_STATE.JUMPING:
    
        var _jump_step = jump_direction * jump_speed
    
        if jump_direction == -1 && y < -sprite_height {
            jump_direction = 1
            x = jump_to.x
            image_xscale = jump_to.x == position_left.x ? -1 : 1
            set_vulnerable(true)
        } else if jump_direction == 1 && y + _jump_step >= jump_to.y {
            y = jump_to.y
            attack_manual(0)
            set_vulnerable(false)
            set_state(REACTOR_STATE.RECHARGING, recharge_duration)
        } else {
            y += jump_direction * jump_speed
        }
        break
    case REACTOR_STATE.ATTACKING:
        attack_timer += f2sec(1)
        while attack_timer > attack_timer_tracker {
            attack_timer_tracker += attack_rate
            if can_attack() {
                attack()
            } else {
                nixie.set(attack_index, 0)
                use_next_attack_clip()
                set_state(REACTOR_STATE.VULNERABLE, vulnerable_duration)
            }
        }
        break
    case REACTOR_STATE.VULNERABLE:
        break
}

var _bullet = instance_place(x, y, oWeaponProjectile)
if _bullet {
    
    var _add
    
    if vulnerable {
        _add = hp_damage
        sfx_play_sound(sndReactorHit)
    } else {
        _add = hp_penalty
        sfx_play_sound(sndReactorUp)
    }
    
    hp = clamp(hp + _add, 0, hp_max)
    instance_destroy(_bullet)
    if hp <= hp_death {
        die()
    } else if hp == hp_max {
        oChernobylBackground.wobble = 0.03
        player_kill(oPlayer)
    }
}

with nixie {
    x = other.x + other.sprite_width / 2
    y = other.y
}