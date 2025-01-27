-- Copyright ©2021,2022 Steve Merrony

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

with Logging; use Logging;

package body Session_Logger is

   function Start_Logging (Filename : in String) return Boolean is
   begin
      Create (Log_File, Out_File, Filename);
      Logging := True;
      return True;
   exception
      when others =>
         Log (WARNING, "Could not open file for logging - " & Filename);
         return False;
   end Start_Logging;   
   
   procedure Stop_Logging is
   begin
      Logging := False;
      Close (Log_File);
   end Stop_Logging;

   procedure Log_Char (Char : in Character) is
   begin
      Put (Log_File, Char);
   end Log_Char;   

end Session_Logger;
