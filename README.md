# Toy Robot Simulator

## Thinking out loud
- Tabletop of 5 x 5. Should make this a parameter so the playing field is scaleable.
- Allow for STDIN to accept commands from REPL.
- What classes do I need?
    - Robot
    - Position
    - Command? Use command pattern?
        - Validate command (PLACE, MOVE, LEFT, RIGHT, REPORT)
- How to REPORT position?
    - Would love to do a graphical map

## Build Log
1. Created README, outlined thought process & test plans
1. Initialized Command class, test for simulation_active? method
1. Added command.execute method with basic input validation
1. Inserted ASCII art for a bit of fun

## Tests
- Feedback / throw error when robot falls off table.
- Validate position. Throw error if:
    - Robot is placed in unacceptable location.
    - LEFT / RIGHT returns incorrect direction
- Validate commands.  Throw error if:
    - Command is invalid (PLUCE).
    - Commands entired prior to a `PLACE X,Y,F`


---
## Credits

Brought to you by an Anonymous Racoon

⠠⠄⠄⠄⠠⠄⠠⠄⠄⠄⠄⠄⠄⠄⠄⣬⣽⣬⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠄⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠄⠠⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣤⠋⠠⣤⣬⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⣤⠠⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠟⠄⠄⠄⠠⠟⠟⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠋⠟⣬⣤⠟⣬⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⣬⠄⠠⠠⠄⠄⣬⠟⠟⣬⣤⣤⣤⣤⠠⠠⠠⠄⠄⠠⣤⣬⠟⠋⠄⠄⠄⠄⣽⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣬⣤⠄⠠⠠⠄⠋⠟⣬⠟⠟⠟⠟⠟⠟⠟⠟⠟⠟⠟⠟⠟⠠⠄⠄⠠⠄⠠⠟⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠟⣤⠄⠄⣬⠟⣬⠋⠋⣤⣬⣬⣬⣬⣬⣬⣬⣬⠟⣬⠟⠠⠄⠄⠄⠠⣽⣤⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠟⠋⠟⣬⠠⠄⠄⠄⠄⠄⣤⠟⠟⣤⠄⠄⠄⠠⣤⣬⠟⠄⠄⣤⣽⣤⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣤⠟⠠⠄⠠⠋⠠⣤⠟⣽⠄⠠⠠⠠⣬⣬⣤⠠⠄⠄⡜⠟⣬⠟⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠠⠄⠄⠠⠠⠄⣤⠟⣽⠄⣤⣽⣬⣽⣤⠄⠄⣽⣽⣤⣬⠠⠟⠠⠄⠠⠟⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠠⠠⠠⠄⠄⠄⠄⠠⠠⣤⣤⡜⠟⠟⠟⠟⠠⠟⣽⠟⣬⠄⠄⠄⣬⣽⣽⣽⠄⣬⣽⣬⠠⠄⠠⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠋⠋⠟⠟⣽⠟⠠⠄⠄⠄⠠⠄⠄⠄⣬⣽⣽⠟⠟⠟⣽⣽⣬⠠⠄⠄⠄⠠⠄⠄⣤⣬⣬⡜⠟⠟⠟⣽⣬⠠⠠⠠⠠⠠⠄⠄⠄⠄⠄⠄
⣬⠟⣽⣽⠟⠄⠄⠄⠠⠟⣽⠟⣤⠄⠄⠠⠟⣽⣽⣽⠟⣤⠄⠄⠄⠟⣽⣽⣽⠠⠄⠄⣤⣽⣽⠟⠟⠟⣽⣽⡜⠠⠠⠄⠋⠄⠄⠠⠠⠄
⠄⠄⠋⣽⣤⠄⠄⣬⣽⠟⠟⠟⣽⠟⠠⠄⠄⠠⠠⠠⠄⠄⠄⠠⠠⠄⣤⡜⣤⠄⠠⠄⠄⠠⣬⠟⠟⠟⣬⠠⠄⠄⠄⠄⣽⠋⣤⠟⣬⣤
⠠⠄⠄⠄⠠⠠⣬⣽⠟⠟⠟⠟⠟⣽⣽⠋⠄⠄⠄⠄⠄⠄⠄⠄⠠⠟⣤⣤⣬⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠟⠟⣽⣽⠟⠋
⠠⠄⠄⠄⠄⠄⠟⠟⠟⣽⣽⠟⠟⣬⠟⣽⣤⠄⠄⠄⠄⠄⠠⠠⠄⣤⠟⠟⣬⠄⠄⠄⠄⠄⠄⠠⠠⠠⠠⠠⣤⣤⣬⠟⠟⣬⣤⠠⠄⠄
⠠⠄⠄⠄⠄⠄⠠⣽⣬⣤⠄⠄⠄⠄⠄⠄⠠⠠⠄⠄⠠⣬⣤⠠⠠⠠⠠⠠⠠⠠⠠⠠⣬⠟⣬⠟⣬⣬⣬⠟⠟⠟⠟⣬⠠⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠋⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⣬⠟⡜⠄⠄⠄⠄⠠⠠⠠⠄⠄⠄⣤⠟⣬⣬⣬⣬⣬⠟⠟⣬⠠⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠟⣬⣬⣤⠄⠄⠠⠠⠄⠄⠄⠠⠄⠄⠠⣬⣬⣬⣬⠟⣬⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⣤⣤⠋⣬⠟⠟⠟⠟⠟⣬⣬⣬⡜⣬⣬⠠⠄⠄⠠⠠⠄⠠⠄⠠⠄⣤⣬⣬⠟⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⣽⣽⣽⠟⠟⠟⠟⠟⠟⣬⡜⡜⣬⡜⣬⣬⠠⠄⠠⠠⠠⠠⠠⠄⠄⣤⠟⠟⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⣬⣽⣽⣽⣽⣽⣽⠟⠟⣬⠋⡜⣬⣬⣬⣬⠟⣤⠄⠄⠠⠠⠠⠠⠠⠄⠄⣤⠟⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⣽⠟⠋⣤⣤⣤⠠⠠⣬⣬⣬⠟⡜⣤⠟⣬⣬⠠⠄⠠⠠⠠⠠⠠⠠⠠⠄⠄⠠⣽⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠠⣤⠄⠄⠄⠄⠄⠄⠠⣬⣬⠋⣤⠄⠄⠟⠟⣤⠄⠄⠄⠠⠠⠠⠄⠠⠄⠠⠄⠄⠠⣬⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⣤⠠⠄⠄⠄⠄⠠⣤⠟⠟⣤⠄⠄⠄⠄⠟⣬⠄⠄⠄⠠⠠⠠⠠⠠⠠⠠⠠⠠⠄⠄⠠⣬⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⣤⠠⠄⠄⣤⠟⠟⣬⣬⣬⣤⠠⠄⠄⠠⣽⣤⠄⠄⠠⠠⠠⠠⠠⠄⠠⠠⠠⠠⠠⠄⠄⠠⠟⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠋⣽⣽⣽⠟⠟⠟⠟⣽⠟⣽⣤⠄⠄⣬⠟⠄⠄⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠄⠄⠋⣽⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠠⣽⠟⠟⠟⣽⣽⠟⣬⣬⣬⠄⠄⣤⠟⣬⠄⠄⠄⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠄⠠⠟⠟⣤⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⣤⣽⣽⠟⣤⠄⠄⠄⠄⠄⣤⣤⣬⣬⣬⠄⠄⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠠⠄⠄⠠⣬⣬⠟⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⣤⣽⠠⠄⠄⠄⠄⠋⣽⣽⣽⣬⡜⠟⣤⠄⠄⠠⠠⠠⠠⠠⠠⠠⠠⠠⠄⠠⠄⠄⠄⣤⣬⣬⠟⠠⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠠⠠⣤⠠⣬⣽⣽⣽⠟⠟⡜⣬⣬⠠⠄⠄⠄⠄⠠⠄⠠⠠⠠⠄⠠⠄⠄⠄⣤⣬⣬⣬⠟⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠠⠠⣤⠠⠄⠄⠋⠟⣬⣬⣬⣤⠠⠄⠄⠄⠄⠄⠠⠄⠄⠄⠄⠠⣤⣬⣬⡜⠟⣬⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣤⠟⣬⣬⠟⣬⣤⠠⠠⠄⠠⠠⠠⠠⠠⣤⣬⠟⣬⣬⠟⠟⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠠⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⠠⠠⣤⣬⣬⣬⣬⠟⠟⠟⠠⠠⠠⠠⠠⠄⣤⣬⣬⣬⣬⣬⡜⠠⣤⣤⣤⣤⣤⠠⠄⠄