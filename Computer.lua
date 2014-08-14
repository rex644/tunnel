print("Type 'forward' to move turtle forward, 'back' to move turtle back, etc.")
while true do
  sleep(0.1)
  term.clear()
  term.setCursorPos(1,1)
  write("Command: ")
  input = read()
  rednet.broadcast(input)
end
