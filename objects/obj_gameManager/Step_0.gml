/// @description Game step

// Update time
var _realDeltaTime = delta_time / 1000000;
var _deltaTime = _realDeltaTime;
global.realDeltaTime = _realDeltaTime;
global.deltaTime = _deltaTime;
global.time += global.deltaTime;
global.realTime += global.realDeltaTime;
