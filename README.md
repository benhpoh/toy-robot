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
        ```
        - - - - -
        - o - - -
        - - - - -
        - - - - -
        - - - - -

        Robot is at position 1,3 and facing East
        ```
- Build sequence: 
    1. Command (to receive input) => 
    1. Robot (initialize) => 
    1. Position (so Robot is aware of where it is) => 
    1. Report (dependant on Position)

---
## Build Log
1. Created README, outlined thought process & test plans.
1. Initialized Command class, test for simulation_active? method.
1. Added command.execute method with basic input validation.
1. Inserted ASCII art for a bit of fun.
1. Clarified further thoughts with a plan of action.

---
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