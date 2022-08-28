---
title: Paradox - Minijam 113 Entry
tags: gamedev, overworld, paradox
---

<img src="/images/footer-paradox.gif" style="vertical-align: bottom; margin-right: 1em;" /> There's a new sneaki boi in the bushes and its name is *Charnel Fontaine*


It likes typing on terminals, inventing evil super intelligences, and pushing big <img src="/images/post-content/paradox-head.png" style="vertical-align: bottom;"/> pink <img src="/images/post-content/paradox-head.png" style="vertical-align: bottom;" /> heads <img src="/images/post-content/paradox-head.png" style="vertical-align: bottom;" /> around on the floor to solve puzzles. 

<br />

<div class="center">Sometimes it gets lonely, so it travels through time to hang out with its past self.</div>

<div class="center">This is the story of *Charnel Fontaine*</div>

## or more like it's the story of me

It's been 6 days since day one of <a href="https://itch.io/jam/mini-jam-113-final-boss">Minijam 113</a>, and after all six of those days, I am now able to announce: 

<br />
<div class="center">🌈✨🎉👯‍♀️🥳 **yes, it <em>does</em> seem that I have made a game** 🥳👯🎉✨🌈</div>

## So what was *that* like?

I mean it's my 3rd published game now. 

So it was pretty rad!

The biggest difference between getting through this game jam, and getting through my first Ludum Dare, was that I moved much, *much* faster. There were a few reasons. To a degree, there were assets from past projects that I could re-use, like the dialogue system. At this point, I've re-used the same dialogue system for my last three games, though it's changed wildly between Picowars and Overworld because it was a change from Lua -> GDscript, but still.. it's the same code, just translated. 

But more importantly than the reusable assets, was the fact that I just knew what I was doing. That big bad <a href="https://godotengine.org/">Godot</a> interface just isn't as spooky as it once was, and to be fair it was *never* as spooky as *Unity's* interface once was 🤮

Godot feels like home now. And I feel productive in it.


## But this jam must have presented some challenges rite

ye thts rite.

Half the time I was staring at my screen hating everything I saw, and the other half of the time I was really excited and thinking "**oh wow.. maybe this has some kind of potential!**"

Granted every time I thought that, I'd shortly after rescind the statement. 

Puzzle design is tough, and every time I'd think I had a puzzle that was somewhat cool, I would realize that it's actually pretty: 

* Linear
* Unintuitive
* and Mechanical

The first few puzzles I made have been entirely thrown out, and I actually **REALLY LIKED** them at some point too! 

Like, I shared one of them on social media. 

<iframe src="https://mastodon.gamedev.place/@Lambdanaut/108858748506309030/embed" class="mastodon-embed" style="max-width: 100%; border: 0" width="400" allowfullscreen="allowfullscreen"></iframe><script src="https://mastodon.gamedev.place/embed.js" async="async"></script>


When I finished that level, I thought it was ***so sly*** and that I was going to save it for the final level, but&hellip;

After making a few other levels, I started to learn my own game better, and learn what made fun puzzles, and what made shitty ones.

Here's what's wrong with each room of that level above that makes it a bad level:

* From the very beginning, it relied on pressing the red and green buttons a seemingly random number of times to get them just right so that you'd be able to progress to the next room. I thought this was good level design because it was hard. In reality it was bad because of *why* it was hard. 
* The second room that you progress to has 6 buttons, and it's a *little* better than the first room, but it's still bad. The idea of this room is to press the buttons in the right combination to let you safely walk through the gates of the next hallway when your dolleganger comes to copy your button-presses. It's bad because once again you're relying too much on timing, and measuring where your doppleganger will be at any point in time is hard, and not in a fun way. It's hard to know exactly when you start pressing the buttons to open up the hallway. 
* The final hallway is a repeat of the second. 

Beyond the design of each individual room, the level as an integrated whole is just *boring*.

I made this level right before I realized the intrigue of *backtracking*. 

## Backtracking

As an example of a level that heavily utilizes backtracking: 

<img src="/images/post-content/paradox-backtracking-example.png" alt="screenshot of a level in Paradox with signifiant backtracking" />

Every room in this level(other than the final room) is interacted with more than once. Heads are shuffled between rooms, and backtracking is needed to accomplish things in other rooms that you previously couldn't. 

It's weird to implement backtracking as a mechanic in a game in which nothing but the last 8 moves are significant, but it works surprisingly well, even though the implementation can be very tedious.


## What's Next?

**I'm going to finish this fucking game**

It's probably another week of dev out from a version 1.0.0, but we'll get there! I've had Overworld on hiatus for this project, and honestly I'm itching to get back to it. I've put so much work into Overworld.. and there's a lot more work left.. but I like where it's headed. 

I'll post here the results from the minijam ratings. I think there's a good chance of taking a second or third place! 


## Paradox Version 0.2.6 - Demo for Minijam 113

<div class="center">Wanna Play? <br />This is the original build for <a href="https://itch.io/jam/mini-jam-113-final-boss">Minijam 113</a>.</div>

<div class="center">
 <iframe src="/games/paradox-demo-1/index.html" width=640 height=360></iframe> 

 (pst.. for a more not <span class='rainbow-text-loop'>old-as-fuck</span> build, play the game on <a href="https://lambdanaut.itch.io/paradox" class="rainbow-text-loop">ITCH.IO</a> 🛹 )

</div>

