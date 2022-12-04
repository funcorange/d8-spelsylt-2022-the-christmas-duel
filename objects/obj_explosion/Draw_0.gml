/// @description Explosion draw

var _time = global.time;

var _fraction = (_time - startTime) / effectTime;
var _radius = _fraction * explosionRadius;
var _alpha = 1 - _fraction;

draw_set_color(c_yellow);
gpu_set_blendmode(bm_add);
draw_set_alpha(_alpha);
draw_circle(x, y, _radius, false);
draw_set_color(c_white);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
