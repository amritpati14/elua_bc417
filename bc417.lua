--[[
The MIT License (MIT)

Copyright (c) 2013 Gabriel Duarte (gduarte.costa@globomail.com)
Copyright (c) 2013 Thuener Silva (thuener@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]



module("bc417", package.seeall)

-- setup UART connection to bc415 module, must be called before any other function related to the module
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
    return baud

    end
end




function bc417_set_pin()
end


function bc417_set_baud()
end

function bc417_set_name()
end

function bc417_listen()
end
