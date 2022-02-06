you have to enter 3 commands

roscore

roslaunch ros_tutorials union.launch --screen

(to publish pre defined msg, enter the following command)

rostopic pub circular_motion ros_tutorials/MsgTutorial '{radius: 1.0, velocity: 2.0, direction: True}'

