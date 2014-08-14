-- pastebin get

--local modem=peripheral.wrap("top")
--modem.open(159)

while true do
sleep(0.1)
term.clear()
term.setCursorPos(1,1)
print("Listening on port 80...")
local id, msg, distance = rednet.receive()
print("We've got a message from computer ID #"..id.."!")
print("The message is:")
print(msg)
print("This message was received from "..distance.." blocks away!")
if msg == "forward" then
turtle.forward()
elseif msg == "back" then
turtle.back()
elseif msg == "dig" then
turtle.dig()
elseif msg == "right" then
turtle.turnRight()
elseif msg == "left" then
turtle.turnLeft()
elseif msg == "down" then
turtle.down()
elseif msg == "up" then
turtle.up()
elseif msg == "exit" then
error()
end
