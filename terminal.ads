-- Copyright (C) 2021 Steve Merrony

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

package Terminal is

   type Emulation_T is (D200, D210);
   type Connection_T is (Disconnected, Serial, Telnet);

   type Terminal_T is record
      Emulation : Emulation_T;
      Connection : Connection_T;
      Cursor_X, Cursor_Y : Natural;
      Roll_Enabled, Blink_Enabled, Protection_Enabled : Boolean;
      Blink_State : Boolean;
      Holding, Logging, Scrolled_Back : Boolean;
      Expecting : Boolean;
      Raw_Mode : Boolean; -- in rawMode all host data is passed straight through to rawChan
      -- Selection_Region...
      -- Log_File : File;
      -- Display : Display_Acc_T;
      Updated : Boolean;
   end record;

   type Terminal_Acc_T is access all Terminal_T;

   function Create (Emul : in Emulation_T) return Terminal_Acc_T;

end Terminal;