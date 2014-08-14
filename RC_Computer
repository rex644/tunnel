-- ComputerCraft Remote Control Miner http://www.youtube.com/watch?v=vow9tQmaE0k
print("ID?")
ID = tonumber(read())

map = {}
for i=1,90 do
map[i] = {}
for j=1,90 do
map[i][j] = 3
end
end

xOff = 20
yOff = 36
x = 45
prevX = 45
y = 45
prevY = 45
playerChar = 94
Ready = true

function ScreenUpdate(x, y)
term.clear()
for xa = 1,50 do
for ya = 1,18 do
mapXY = map[xa + x][ya + y]
if mapXY == 0 then
term.setCursorPos(xa,ya)
term.write("#")
end
if mapXY == 1 then
term.setCursorPos(xa,ya)
term.write(string.char(playerChar))
end
if mapXY == 2 then
term.setCursorPos(xa,ya)
term.write("-")
end 
end
end
 for xa = 46,50 do
  for ya = 15,18 do
   term.setCursorPos(xa,ya)
   if Ready == true then
    term.write("!")
    else
    term.write(" ")
   end
  end
 end
end

function matrixUpdate()
map[prevX][prevY] = 2
map[x][y] = 1
prevX = x
prevY = y
end


function parse(s)
if s:sub(1,1) == "0" then
map[tonumber(s:sub(2,3))][tonumber(s:sub(4,5))] = tonumber(s:sub(6,6))
end

if s:sub(1,1) == "1" then
Ready = true
ScreenUpdate(xOff,yOff)
end

if s:sub(1,1) == "2" then
xOff = tonumber(s:sub(2,3))
yOff = tonumber(s:sub(4,5))
x = tonumber(s:sub(6,7))
y = tonumber(s:sub(8,9))
matrixUpdate()
end
end

rednet.open("back")
term.setCursorBlink(false)
matrixUpdate()
ScreenUpdate(0,0)
repeat
local Event, key, key2 = os.pullEvent()
if Event == "rednet_message" then
parse(key2)
end

if Event == "key" and Ready == true then
 if key == 17 then
  if playerChar == 94 then
   rednet.send(ID, "1")
  else
   rednet.send(ID, "00")
   playerChar = 94
  end
 Ready = false
 end
 if key == 30 then
  if playerChar == 60 then
   rednet.send(ID, "1")
  else
   rednet.send(ID, "03")
   playerChar = 60
  end
 Ready = false
 end
 if key == 31 then
  if playerChar == 118 then
   rednet.send(ID, "1")
  else
   rednet.send(ID, "02")
   playerChar = 118
  end
 Ready = false
 end
 if key == 32 then
  if playerChar == 62 then
   rednet.send(ID, "1")
  else
   rednet.send(ID, "01")
   playerChar = 62
  end
 Ready = false
 end
 if key == 57 then
  rednet.send(ID, "2")
 Ready = false
 end
 if key == 18 then
  rednet.send(ID, "3")
 Ready = false
 end
 if key == 16 then
  rednet.send(ID, "4")
 Ready = false
 end
 ScreenUpdate(xOff, yOff)
end
until Event == "key" and key == 25
term.clear()
rednet.close("back")
