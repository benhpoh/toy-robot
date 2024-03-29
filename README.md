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
- Build sequence: 
    1. ~~Command (to receive input)~~ =>
    1. Robot (initialize) => 
    1. Position (so Robot is aware of where it is) => 
    1. Report (dependant on Position)
- Need to create a response to inform the user about invalid command or argument entered
- How should I initialize Robot?
    - Robot needs to know what the table dimension is.
    - Does robot need to be placed upon initialization? No. It can be issued commands (that will be ignored) before being placed.
    - Init with table boundaries, then reference the table boundary when being placed or moved.
- Robot now knows PLACE method. Should have some unit tests on ROBOT class.
    - Robot's methods are PLACE, LEFT, RIGHT, MOVE, REPORT
    - Will first need to test REPORT, as I will depend on the output of REPORT to validate PLACE, LEFT, RIGHT is working.
    - MOVE will need to correctly return an error when falling off the table.
- I've broken the Command_Validation unit tests because it was written assuming commands can be provided prior to a PLACE command.
    - Resolved it by checking if Robot has been placed. If not, invalidates command and returns an error.
- How to code the Move method?
    - First determine where the robot is in relation to the table
    - What direction is the robot facing? (East => position.x += 1, South => position.y -= 1)
    - Is the resulting coordinate still within table confines? TODO: Validation.

---
## Build Log
1. Created README, outlined thought process & test plans.
1. Initialized Command class, test for simulation_active? method.
1. Added command.execute method with basic input validation.
1. Inserted ASCII art for a bit of fun.
1. Clarified further thoughts with a plan of action.
1. Added tests to Command class to validate PLACE arguments.
1. Added control flow to command.execute method.
1. Created Robot class & Position class.
1. Completed robot.place method.
1. Completed robot.report method and tests.
1. Wrote unit tests to verify robot.left & robot.right functions as intended.
1. Added an all_tests script.
1. Created more tests to confirm commands issued prior to PLACE is rejected.
1. Wrote unit tests for Position class.
1. Wrote unit tests for all robot.move scenarios.
1. Completed robot.move method with all tests passing
1. Wrote acceptance test to validate code passes examples.

---
## Tests
- ~~Feedback / throw error when robot falls off table.~~
- ~~Validate position. Throw error if:~~
    - ~~Robot is placed in unacceptable location.~~
    - ~~LEFT / RIGHT returns incorrect direction~~
- ~~Validate commands.  Throw error if:~~
    - ~~Command is invalid (PLUCE).~~
    - ~~Commands entired prior to a `PLACE X,Y,F`~~
- ~~Test to confirm Examples A, B, C from problem is achieved~~

---

## TODO
- ~~Methods to be called by Command class upon valid input (use case statement?)~~
- Robot class methods
    - ~~robot.place~~
    - ~~robot.move~~
    - ~~robot.left~~
    - ~~robot.right~~
    - ~~robot.report~~
- ~~Robot class unit test~~
- ~~If...else block to disregard commands before robot is placed~~
- ~~Validation method to block MOVE command if robot falls off table~~
- Implement PLACE_OBJECT command
    - ~~Where would object be placed? Assume coordinate directly ahead of robot~~
    - ~~Check position of robot, verify if position directly ahead is a valid position~~
    - ~~Place object if position is valid~~
- MOVE command needs to be refactored. Check if robot will fall off table / into object
- ~~How to store location of OBJECTs~~ (Array containing list of object locations)

---
## Credits

Brought to you by an Anonymous Racoon
```
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
```