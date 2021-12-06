Cave System - Yu-Chia Shen
I implemented a 3D Perlin function to generate cave systems underground. I also created a post-process pipeline to deal with the play's situation inside the water or lava. I moved the output of the original shaders from the default frame buffer, which is the display hardware, to another frame buffer and then converted it to a texture. Later, I used a post-process shader to read that teature and applied some underwater effects. Then, I modified the player's physics so that I could dive into water and lava. First, I treated water and lava as empty blocks. Then, I set up the if-else statement to check if the player's surrounding blocks are water or not. If so, then decrease the player's speed and also reduce the gravity so that the player can swim upwards.
One difficulty I encountered was that the output size did not match, so everything I saw was zoomed up. Then, I noticed that I should resize the frame buffer after the initialization of MyGL. After that, the scene seemed normal. 

Multithreaded Terrain Generatio: Jong Min
I implemented multithreading using a thread-pool like architecture.
There were 4 workers each for chunk block generation and VBO generation.
A shared queue was used to notify the workers.

Textures: Zohar Singer
I added textures which included making the water transparrent and move using two seperate VBOs

I also started part of my ms3 implementation which is porting it to the web using
webassembly. You can access it in the following [link](https://mystifying-swirles-c918bc.netlify.app/)

Help Log:
Jong Min: I referenced
https://emscripten.org/index.html: for webassembly documentation
https://learnopengl.com/Advanced-OpenGL/Framebuffers: when porting framebuffer to opengl es2

Yu-Chia
To see how frame buffer works
https://en.wikibooks.org/wiki/OpenGL_Programming/Post-Processing


ms3:

Shadow mapping:
I implemented shadow mapping by creating a new shader program with new shaders that will render an orthographic rendering of the entire world, this is then stored in a texture that is passed into a new shader texture that that will lookup the depth of each fragment, compare it against its distance from the light source and then shade appropriately.