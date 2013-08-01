-- config mbed physical pins
mbed.pio.configpin(mbed.pio.p28, mbed.pio.FUNCTION_1, mbed.pio.MODE_DEFAULT , mbed.pio.RES_TRISTATE)
mbed.pio.configpin(mbed.pio.p27, mbed.pio.FUNCTION_1, mbed.pio.MODE_DEFAULT , mbed.pio.RES_TRISTATE)

print("Waiting for command")

-- Prompt a 9600 baud serial device until we receive a character in reply
uartid = 2          -- Which UART should we be talking on?
timeout = 500000    -- Prompt once every half second
timerid = 0         -- Use timer 0 to measure the timeout
prompt =  "AT\r\n"      -- The prompt character (0x55 : binary 01010101)

-- Set bluetooth serial
baud = uart.setup(uartid,  115200, 8, uart.PAR_NONE, uart.STOP_1)
print("BaudRate BT: " .. baud)

enough = false

repeat
	command = io.read()
	print("Command: " .. command)
	print("Sending AT...")
	uart.write(uartid, command)

	print("Receiving AT...")
	while true do
		str = uart.getchar(uartid)
		print(string.byte(str))
	end
  answer = uart.read(uartid,'*s')
	print("Answer:", answer)
until ( enough)
