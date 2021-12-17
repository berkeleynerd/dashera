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

with Ada.Text_IO;
with GNAT.Sockets;

package body Telnet is

	function New_Connection (Host_Str : in String; 
                            Port_Num : in Integer;  
                            Term : in Terminal.Terminal_Acc_T) return Session_Acc_T is
      Sess : aliased constant Session_Acc_T := new Session_T;
      Address : GNAT.Sockets.Sock_Addr_Type;
   begin
      GNAT.Sockets.Create_Socket (Sess.Conn);
      Ada.Text_IO.Put_Line ("DEBUG: Host: " & Host_Str & ", Port: " & Port_Num'Image);
      Address.Addr := GNAT.Sockets.Addresses (GNAT.Sockets.Get_Host_By_Name (Host_Str), 1);
      Address.Port := GNAT.Sockets.Port_Type (Port_Num);
      GNAT.Sockets.Connect_Socket (Sess.Conn, Address);
      Sess.Term := Term;
      return Sess;
   end New_Connection;

   procedure Send (Sess : in out Session_T; BA : in Byte_Arr) is
   begin
null;
   end Send;

	procedure Close_Connection (Sess : in out Session_T) is
   begin
      GNAT.Sockets.Close_Socket (Sess.Conn);
   end Close_Connection;

end Telnet;