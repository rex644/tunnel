print("ID?")
ID = tonumber(read())
x = 45
y = 45
xOff = 20
yOff = 36
dir = 0
frontx = 0
fronty = 1

function turn(s)
if s == "Right" then
turtle.turnRight()
dir = dir + 1
if dir > 3 then dir = 0 end
end
if s == "Left" then
turtle.turnLeft()
dir = dir - 1
if dir < 0 then dir = 3 end
end
Updatedif()
end

function Updatedif()
if dir == 0 then frontx = 0 fronty = -1 end
if dir == 1 then frontx = 1 fronty = 0 end
if dir == 2 then frontx = 0 fronty = 1 end
if dir == 3 then frontx = -1 fronty = 0 end
end

function Scan()
scannedx = tostring(x + frontx)
if scannedx:len() < 2 then scannedx = table.concat({"0",scannedx},"") end
scannedy = tostring(y + fronty)
if scannedy:len() < 2 then scannedy = table.concat({"0",scannedy},"") end

scan = turtle.detect()
if scan then rednet.send(ID, table.concat({"0",scannedx,scannedy,"0"},"")) end
if not scan then rednet.send(ID, table.concat({"0",scannedx,scannedy,"2"},""))end
end

function FullScan()
for i = 1,4 do
Scan()
turn("Right")
end
end

function SetDir(s)
while dir ~= s do
turn("Right")
end
end

function Dig()
turtle.dig()
os.sleep(0.40)
Scan()
end

function Place()
turtle.place()
Scan()
end

function Forward()
if not turtle.detect() then
 if dir == 0 and y > 1 then 
  turtle.forward()
  y = y - 1 
  if y > 8 and y + 1 > 8 and y < 82 and y + 1 < 82 then
   yOff = yOff - 1
  end
 end
 if dir == 1 and x < 90 then
  turtle.forward()
  x = x + 1
  if x < 66 and x - 1 < 66 and x > 24 and x - 1 > 24 then
   xOff = xOff + 1
  end 
 end
 if dir == 2 and y < 90 then
  turtle.forward()
  y = y + 1
  if y < 82 and y - 1 < 82 and y > 8 and y - 1 > 8 then
   yOff = yOff + 1
  end
 end
 if dir == 3 and x > 1 then
  turtle.forward()
  x = x - 1
  if x > 24 and x + 1 > 24 and x < 66 and x + 1 < 66 then
   xOff = xOff - 1
  end
 end
end
 local stringmat = {}
 stringmat[1] = tostring(xOff)
 stringmat[2] = tostring(yOff)
 stringmat[3] = tostring(x)
 stringmat[4] = tostring(y)
 for i = 1,4 do
  local stringeval = stringmat[i]
  if stringeval:len() == 1 then
   stringmat[i] = table.concat({"0",stringeval},"")
  end
 end
 rednet.send(ID, table.concat({"2",stringmat[1],stringmat[2],stringmat[3],stringmat[4]},""))
 Scan()
end

function Parse(s)
if s:sub(1,1) == "0" then SetDir(tonumber(s:sub(2,2))) end
if s:sub(1,1) == "2" then Dig() end
if s:sub(1,1) == "3" then FullScan() end
if s:sub(1,1) == "4" then Place() end
if s:sub(1,1) == "1" then Forward() end
end

rednet.open("right")
repeat
local event,p1,p2
event,p1,p2 = os.pullEvent()
if event == "rednet_message" then
Parse(p2)
rednet.send(ID, "1")
end
until event == "key" and p1 == 25
rednet.close("left")
