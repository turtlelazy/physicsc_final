# Hanging Penguins By Ishraq Mahid and Nathan Kuo Period 2/3

## About
Our project idea was inspired by the penguin problem done in class. We hoped to make a simulation where users can hang toy penguins from bars to play around with balancing them. In addition, we allow the user to change the masses of individual penguins and the length of the beams. Through this, variables can be adjusted to observe different results and the degree to which changes in tilt occurs. This project is made in Processing. The project will has a static “frozen” state and an animated state. During the static state, the user can drag and drop bars and penguins into the environment. The bars have attachment segments to allow the user the ability to control the length of beams, rather than relying on tiny pixels. Once the user has finished setting everything up, then they can press a play button to start an animated result to see whether or not the system is balanced. There is also a reset button to quickly clear everything and start anew.

## Instructions
* To hide the instructions, click on them. 
* Click on the tiles on the bottom row to switch the cursor's mode. 
* The cursor option lets you adjust the length of the beams. 
* The penguin options places penguins of different masses. 
* On the right, the play button will animate/stop the figure. 
* On the right, the trash button will reset the figure. 
* One Blue = Two pinks 
* One yellow = Three Pinks

## Physics
In this system, there exists no friction nor air resistance. The beams are thin, long rods with no Inertia of their own (thus, the inertia is equal to the masses times the distance squared). The Euler step method is utilized each frame in order to reach the next estimated angle, with a framerate of 30 frames per second (so thirty steps per second). One flaw of this simulation is that it does not account for centripetal acceleration within the system.

