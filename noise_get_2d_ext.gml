// Extended Script

function noise_get_2d(x, y, scale, room_width, room_height) { // Function
    x *= scale;
    y *= scale; // multiplier to adjust the density of the noise.
	
	    // Calculate distance from the center
    var center_x = room_width * 0.5; // x * 0.5 == x / 2
    var center_y = room_height * 0.5;
    var distance_to_center = point_distance(x, y, center_x, center_y);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // Apply a center bias: closer to the center means higher values
    // (1) ::// var center_bias = 1 - distance_to_center / max(room_width, room_height); // uncomment this or (2)

//// or ///////////////////////////////////////

    // Apply a center bias: closer to the center means higher values (exponentially)
    // (2) ::// var center_bias = 1 - Math.pow(distance_to_center / max(room_width, room_height), 2);  // uncomment this or (1)
    // Exponential bias for sharper drop-off

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    // Generate noise value and combine it with the center bias
    var noise_value = (sin(x) + cos(y)) * 0.5 + 0.5;
    return noise_value * center_bias;
}
