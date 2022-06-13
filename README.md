# SideShooterThing
## Design Document:
https://docs.google.com/document/d/1wr5vTpkA18upivIGFO0skhP4k2avfyIlNml0PnDjmQI/edit?usp=sharing
## Work Logs:
### Zawad:
https://docs.google.com/document/d/1eQDanTAmWGuViX0hnX_lZ6ulbXNILXu2EAxGVa20U4M/edit?usp=sharing <br />
### Lee:
https://docs.google.com/document/d/1JeTxHqtyIXsqVbmJ-_464eSk-00j4uKGOLzbNU33GYE/edit?usp=sharing


Requires processing Sound library

## Overview
Originally, we were planning on modeling this game after Gradius. However, as we went on in the project, we began to add more and more things that weren't modeled after elements from Gradius, culminating in this side shooter that isn't really a copy of anything. We went along adding things we felt we would want in a game such as this, and this is the final result.

## Controls
'w', 'a', 's', 'd': Move up, left, down, and right respectively
Shift: Dash in the direction you are currently moving
Left Click or Spacebar: Fire primary weapon
Right Click or 'f': Fire secondary weapon if enough super meter is present
'e': Fire super if super meter is full

## Gameplay
The goal of the game is to fire at enemy ships to destroy them while keeping yourself alive. You have a primary weapon that you can always fire, a secondary weapon that consumes a little of your super meter, and a super weapon that consumes a full super meter. You can get super meter from killing enemy ships.

Each level consists of a wave of enemies that slowly move towards you while firing. If they reduce your HP to 0 or reach the left side of the screen, you lose. If you destroy all enemies before either of these happen, you will advance a level, and the cycle will repeat. Extra strong Bosses will spawn every 5 levels. Each time you advance a level, the health of your enemies will increase a little, making it difficult to survive much later in the game.

### Powerups
Every time an enemy dies, they have a chance to drop one of three powerups:
The cyan box gives the player a temporary shield, which prevents all damage. It is shown by the player being tinted blue.
The green box instantly restores 10 of the player's missing hitpoints.
The purple box increases the range of the player's dash, and also removes its cooldown.


## Cheat Codes
'1': Set player health to full (100)
'2': Set player health to 0, killing them
'3': Set player super meter to full (100)
'4': Skips current wave
'5': Gives player infinite shield powerup
'6': Gives player infinite dash powerup
'7': Removes all active powerups from player
