---
title: AI Pathfinding In a Platformer
tags: gamedev, overworld, project
---

In order to learn the [Godot Game Engine](https://godotengine.org/) I decided to challenge myself by implementing the [A* Pathfinding Algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm) with a caveat: instead of pathfinding on a top-down grid, the world would be a 2D platformer with jumping, gravity, and collisions.

The result is *okay*. It's not the most scalable and if I pathfind on 10 characters simultaneously there is a noticable flicker in frame-rate. That could be fixed up by just running the pathfinding in its own thread, but I'm content with treating this project as a neat proof-of-concept learning experience and wrapping it up here.

An interesting aspect to the A* pathfinding here was that by introducing jumping, we were effectively pathfinding in a 3D world rather than a 2D world. By this I mean that there were three dimensions that needed by kept track of: The `X`, `Y`, and `J`, coordinates, where `J` is nth jump that was searched through. Along with the extra dimension of jump counts that had to be recorded, we also had to record how high we were in any one jump, increasing the jump value until we had reached the jump height limit.

It's a deciptively difficult problem to get perfect, and it's why I'm wrapping this up here rather than turning it into a full-blown game. There are too many edge cases where the little dudes can't reach the path they've found. They'll miss the jump by a couple pixels, or knock their heads on a block above, or who knows what else. The pathfinding itself is pretty good, but getting the little guys to follow the path without falling is **tuff**.


Play in your browser
--------------------

You can play the demo right here in your browser.

Click anywhere in the world and the little dudes will find a way to get there:

 <iframe src="/games/side-track/side-track.html" width=720 height=360></iframe>
