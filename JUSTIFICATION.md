# Assignment 2 Justification

If you think any of the questions within the sections are not applicable, please write "N/A".

## Section 1: Creation and Use of 3D Objects

### 1a: Show that you have created or imported at least one 3D object that is visible in your application. Include references to where this is implemented in your code.

In part 1, a, b, c and d are completed. The majority of the code for these is in the functions scene.cpp, scene.hpp, animator.cpp and animator.hpp. The structs animator_t, node_t and scene_t are important for these functions. One example of a created 3d object is the cube initialised on line 13 in scene.cpp, this should show when the application is started with a greenish texture and should move and jump.

### 1b: Describe your scene graph and the hierarchy within the scene. Include references to where this is implemented in your code.

The scene is organised into a scene graph. The code structures are declared from line 13 to line 190 in scene.cpp and the scene graph components are collated from line 192 to line 212 in scene.cpp. The render function renders all of the objects in the scene from line 115 in renderer.cpp, which is used in main.cpp on line 50. My scene graph includes a 'BASE' root node which holds all other nodes. For each animated object, I created a new node with no structures to take care of the animation and for the others I placed directly as children of the 'BASE' node, for example the light meshes from lines 209 to 212 in scene.cpp. Note how the object torus_one is a child of back_and_forth, which animates a back and forth motion (line 201 in scene.cpp), which is a child of floating (line 203 in scene.cpp), which animates an up and down motion, which is a child of the base node (line 207 in scene.cpp).

### 1c: Describe how your objects are moving or animating in realtime. Include code references (line numbers and function names) to use of delta time and also how this affects the scene graph.

"Without moving the camera from its starting position, you can clearly see the 'floating' animation on the three torus objects in motion. The middle object torus also clearly has the 'back and forth' animation. The code governing the relationship between the two is in the switch case in the animate function in animator.cpp from lines 78 to 84, where sin and cos are used with delta time to animate in real time. The sphere floating around and following the cube in the scene are also animating and moving in real time, as they are both children of the 'spline,' which follows the animate function on line 18 of animator.cpp, but the sphere is also rotating on the y axis in the sphereanim animation on line 70 of animator.cpp. These two animations both use delta time with trig functions to animate in real time.

### 1d: Describe how you have used parametric splines in your application. Include code references to the implementation of control point based curves in your project.

I have used one parametric spline for the animation of the cube and sphere jumping. The code for this is in the animate function on line 18 of animator.cpp. I used sin and cos functions to simulate the animation of the y axis of the objects along the x axis of delta time. I also used these functions to simulate the cube rotating 360 degrees while jumping.

## Section 2: Camera

### 2a: Describe what controls the player should use to move the camera in your scene. Include code references to the implementation of delta time control of speed and use of user input in your project.

In part 2, a and b are complete while c is not. The default camera after loading the application is the fly camera, with controls W = move forward, A = move left, S = move backwards, D = move right and E = switch to walk camera. All code relating to cameras is in the file camera.cpp, including creating and updating the camera. The two functions that deal with updating the camera are update_cam_angles on line 39 and update_cam_pos on line 53, which use delta time to control speed and user input in the 'step' on line 56. In update_cam_pos, the controls for the fly camera are from lines 59 to 74.

### 2b: Describe how your camera interacts with the scene. Is it able to "walk" on the Z-X plane or follow terrain? Include code references.

To use the walk camera, press E after loading the application. This camera makes the camera unable to move on the y axis, meaning it will be stuck on the y coordinate of the camera whenever E was pressed, creating a 'walking' feeling. The code for this camera is from lines 77 to 96 in camera.cpp.

### 2c: Describe how the view of your scene can change from player controlled to application controlled (specify user input that makes this change happen). Include code references to use of parametric curves and delta time in the application controlled camera.

I did not complete part 2c. 

## Section 3: Lighting

### 3a: Describe where Diffuse Lighting is clear to see in your application. Include code references to your implemented lighting (including where this is implemented in your shaders).

In part 3, a, b, c, d and e are complete. After loading the application, a white sphere shape should be seen in the middle top of the scene. This is the indicator of the directional light position. All objects in the scene can be seen to be lit from above. The directional light is initialised on line 155 in scene.cpp which is passed to renderer.cpp, where on lines 108 to 111 the parameters are sent to the frag shader struct dir_light on line 18 of the frag shader. The function apply_dir_light on line 50 in the frag shader calculates the ambient, diffuse and specular effects of the light with the diffuse aspect being on line 55 and passes it to the final colour value.

### 3b: Describe where Specular Lighting is clear to see in your application, including how the camera position affects the lighting. Include code references to your implemented lighting (including where this is implemented in your shaders).

After loading the application, by flying around any object it is clear to see that all objects have specular highlights depending on where the camera is in relation to them. Specular lighting is calculated for both the directional light and point lights on lines 59 to 63 and lines 86 to 90 of the frag shader respectively. The specular parameter of the directional light can also be controlled on line 158 of scene.cpp.

### 3c: Describe which of your light(s) in your scene are point light(s) and how you have placed objects in the scene to clearly show the point lights functioning. Include code references to point light implementation.

The smaller spheres above the obstacle cubes and the small sphere directly in front of the camera upon loading the application are all indicators of the location of point lights, there being 3 in total. The point light on the left emits the colour red, which can be seen from the surrounding objects, most visibly the cube right under it. The point light on the right emits the colour green, which can be seen from the surrounding objects, most visibly from the cube right under it as well. The point light right in front of the camera emits white light, which can be seen from the torus right in front of it being more lit up. The point lights applying both diffuse and specular lighting can be seen by simply moving the camera around the scene and looking at different objects from different angles.

The code for initialising the three lights is from lines 137 to 152 in scene.cpp. This is then passed to the renderer, where on lines 96 to 106 in renderer.cpp the point light parameters are passed to the fragment shader struct array point_lights on line 27 of the frag shader. Finally, the function apply_point_light calculates the diffuse and specular lighting, along with attenuation on objects from the point light and passes these to the final colour value.

### 3d: Describe all the lights in your scene and what type they are. Include code references to implementation of the capability to work with an arbitrary number of lights.

The larger sphere in the middle at the top of the scene shows the position of the directional light. The smaller sphere above the cube on the left shows the position of a red point light. The smaller sphere above the cube on the right shows the position of a green point light. The smaller sphere right in fron of the camera upon loading the application shows the position of a white point light. There are three point lights and one directional light in the scene. The code references to these are in 3a-3c.

### 3e: Explain what maps you have used and which objects they are on. Your application should clearly show the effect these maps are having on lighting. Include code references to maps on objects and vertices as well as lighting code that uses the maps.

I have used diffuse and specular maps for all the objects in the scene. The clearest example of the maps is on the moving cube, where if you move the camera close to it, you can see the textures on it changing when it flips, as the lighting is reacting to the movement. You can fly around any other object and see the maps too, but it might not be as obvious. Maps are selected in scene.cpp when making a node_t object. They are then sent to the renderer and on lines 52 to 57 in renderer.cpp, are sent to the frag shader. The frag shader calculates the maps on an object on lines 105 and 106, with diff_col and spec_col and the apply_dir_light and apply_point_light functions use these values to calculate diffuse and specular lighting.

## Section 4: Subjective Mark

### How have you fulfilled this requirement?

I did not fulfill this requirement and will not receive marks for Section 4. 
(If you would like your Section 4 to be marked, you will need to replace these lines)

### What is your vision for the scene you are showing?

I wanted to make a 3d version of geometry dash, where the cube is navigating through different obstacles like squares to jump over and portals to enter with the sphere around it. I also wanted to fit in the colourful theme of the game with different coloured lights.

### Are you referencing anything in this scene? Is this a quote or homage to any other art? Please describe it.

This is a reference to the game Geometry Dash, where the player controls a cube through different obstacles to make it to the end.

### Please give instructions for how a viewer/player should interact with this scene to see all the content you have created.

All the objects in the scene can be seen after loading the application, you can fly around to see them more in detail.

## Section 5 (optional): Code Style Feedback

### There are no marks assigned to code style in this assignment. However, if you would like to receive some feedback on your coding style, please point out a section of your code (up to 100 lines) and your tutor will give you some written feedback on the structure and readability of that code.

N/A

## Section 6 (optional): Use of External Libraries

### What does the library do?

N/A

### Why did you decide to use it?

N/A

### How does this integrate with the assignment project build system? Please include any instructions and requirements if a marker needs to integrate an external library.

N/A
