///@desc Move camera

// Set position if player exists
if (instance_exists(target) && active)
	camera_set_view_pos(
		camera,
		clamp(snap(target.x, size.x) + offset.x, area.y, area.x + area.w),
		clamp(snap(target.y, size.y) + offset.y, area.x, area.y + area.h))