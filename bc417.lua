module("bc417", package.seeall)


function bc417_setup(uartid, baud)
  -- mbed has a special conf for pins
  if pb.board() == "MBED" then
    if uartid == 1 then 
      pin0 = mbed.pio.p15
      pin1 = mbed.pio.p16
    elseif uartid == 2 then
      pin0 = mbed.pio.p27
      pin1 = mbed.pio.p28
    else
      print("UART ID do not match!")
      return
    end
    
    mbed.pio.configpin(pin0, mbed.pio.FUNCTION_1, mbed.pio.MODE_DEFAULT , mbed.pio.RES_TRISTATE)
    mbed.pio.configpin(pin1, mbed.pio.FUNCTION_1, mbed.pio.MODE_DEFAULT , mbed.pio.RES_TRISTATE)
  end -- end of mbed conf
    
    baud = uart.setup(uartid,  baud, 8, uart.PAR_NONE, uart.STOP_1)
    end
end
