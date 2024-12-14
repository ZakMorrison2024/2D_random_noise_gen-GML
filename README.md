# noise_2d_get Script

The `noise_2d_get` script generates 2D noise values and uses them to control entity spawning in a game. It calculates noise based on a given position, scales it using a specified factor, and biases the result toward the center of the room. Entities are spawned when the noise value exceeds a defined threshold, and the script ensures entities aren't spawned too close to each other.

## Features

- **2D Noise Generation:** Creates noise values based on sine and cosine functions.
- **Center Bias:** Higher spawn probability near the center of the room.
- **Dynamic Entity Spawning:** Spawns entities only when the noise value exceeds a threshold.
- **Random Positioning:** If the spawn condition isn't met, the script generates a new random position.

## How It Works

1. **Noise Calculation:** 
   - The noise value is calculated for the given position `(px, py)` with a scaling factor. The function generates a noise value using sine and cosine functions and applies a center bias based on the distance from the center of the room. This ensures entities are more likely to spawn near the center.

2. **Entity Spawning:**
   - If the generated noise value exceeds a preset threshold, an entity is spawned at the position `(px, py)`.
   - If the noise value does not meet the threshold, a new random position within the room boundaries is chosen for the next spawn attempt.

3. **Valid Position Flag:**
   - After an entity is spawned, the `valid_position` flag is set to `false` to prevent further spawns at the same position. If the noise condition isn’t met, the position is updated randomly, ensuring that new spawn locations are checked.

## Parameters

- **`x`, `y`:** The current coordinates to calculate noise for.
- **`scale`:** A multiplier that adjusts the density of the noise pattern.
- **`room_width`, `room_height`:** The dimensions of the room to calculate the center and distance from it.
- **`spawn_threshold`:** The threshold value that must be exceeded for an entity to spawn.
- **`valid_position`:** A flag to track whether the current position is valid for spawning.

## How to Use

1. **Integrate the Script:** Include the `noise_get_2d` function into your game logic.
2. **Configure Parameters:** Adjust the `scale`, `spawn_threshold`, and room dimensions based on your game’s needs.
3. **Use in Spawn Logic:** Implement the spawning logic to check the noise value and spawn entities at positions with valid values.
4. **Fine-tune Behavior:** Experiment with the scale and threshold to control the density and distribution of spawned entities in your room.

## Example Implementation


### In the **'Create Event'**: // defining variables and what they do

- noise_scale = random_range(0.01, 0.02); // Adjust for larger/smaller clumps (I use random float to increase unpredictablity)
- spawn_threshold = 0.4; // Adjust for density
- noise_value = 0; // declarative



### During **'Step Event'**: // call when spawning

- if valid_position  // Position checking for PX and PY (declared in my generation scripts px == position_x, py == position_y
- noise_value = noise_get_2d(px, py, noise_scale, room_width, room_height); // Define noise_value
- if (noise_value > spawn_threshold) { // If noise_value exceeds the spawn threshold
- instance_create_depth(px,py,0,obj_spawn_entity); // Create your object
- spawned ++; // Increment spawn tally
- valid_position = false; // Reset position
- noise_value = 0; // Reset noise_value
- }
- else {valid_position = false; px = irandom(room_width); py = irandom(room_height);} // This is a loop break, incase noise_value doesn't exceed threshold, will find a new position in ROOM
- }




## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
