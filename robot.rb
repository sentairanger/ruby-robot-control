# Import the packages and constants
require "pigpio"
require "tty-reader"
include Pigpio::Constant

# Define the pi and exit if not found
pi=Pigpio.new
unless pi.connect
   exit -1
end

# Define our motor pins
pin1 = pi.gpio(7)
pin2 = pi.gpio(8)
pin3 = pi.gpio(9)
pin4 = pi.gpio(10)
eye = pi.gpio(25)

# Set them as outputs and with pull down off
pin1.mode = PI_OUTPUT
pin2.mode = PI_OUTPUT
pin3.mode = PI_OUTPUT
pin4.mode = PI_OUTPUT
pin1.pud = PI_PUD_OFF
pin2.pud = PI_PUD_OFF
pin3.pud = PI_PUD_OFF
pin4.pud = PI_PUD_OFF

# Blink the eye four times
4.times do |i|
   eye.write 1
   sleep 1
   eye.write 0
   sleep 1
end

#Define our reader
reader = TTY::Reader.new

# Each cursor will move the robot forwards, backwards, left or right
# Up moves the robot forwards, down moves it backwards, and left and right move that direction
reader.on(:keyup) {   pin1.write 0
                      pin2.write 1
                      pin3.write 1
                      pin4.write 0  }
      .on(:keydown) { pin1.write 1
                      pin2.write 0
                      pin3.write 0
                      pin4.write 1}
      .on(:keyleft) { pin1.write 1
                      pin2.write 0
                      pin3.write 1
                      pin4.write 0}
      .on(:keyright) {pin1.write 0
                      pin2.write 1
                      pin3.write 0
                      pin4.write 1}
      .on(:keyspace) { pin1.write 0  
                       pin2.write 0 
                       pin3.write 0
                       pin4.write 0}
# Escape the code when finished with escape or CTRL+X
reader.on(:keyctrl_x, :keyescape) do
   puts "Exiting..."
   exit
end

# Read the line and then add another line after a key is pressed
answer = reader.read_line
# Stop the pi when the code stops running
pi.stop

