# ruby-robot-control


## Introduction

This project controls a robot using the CamJam EduKit 3 Motor Board and the Ruby Programming language. It uses two gems pigpio which is the wrapper for the pigpio library and tty-reader. You can learn more by clicking [here](https://github.com/piotrmurach/tty-reader) and [here](https://github.com/nak1114/ruby-extension-pigpio).

## Getting Started

First build your robot or prepare your preassembled robot. This code is meant for the CamJam Edukit 3 motor board but you can use any board you want. Then you can either SSH into the Pi remotely or you can add an HDMI cable to access the desktop. Then install Ruby with `sudo apt install ruby-full -y`. Next, you can check the ruby version with `ruby -v`. If you are running Pi OS Lite install pigpio with `sudo apt install pigpio`. Then install the two gems pigpio and tty-reader. Then enable pigpiod with `sudo pigpiod` and then run the code with `ruby robot.rb`. Then you can move the robot with the cursor keys and use the Space bar to stop. I used the space bar since the enter key stops the code entirely. You can exit with Escape or CTRL+X.
