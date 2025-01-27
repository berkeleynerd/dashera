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

package Cell is

   pragma Preelaborate;

   protected type Cell_T is

      procedure Set (Value : in Character; Blnk, Dm, Rv, Under, Prot : in Boolean);

      procedure Get (Value : out Character; Blnk, Dm, Rv, Under, Prot : out Boolean);

      procedure Clear_To_Space;

      procedure Clear_If_Unprotected;

   private
      Char_Value                           : Character;
      Blink, Dim, Rev, Underscore, Protect : Boolean;

   end Cell_T;

   type Cell_Acc_T is access all Cell_T;

   procedure Copy (Src : in out Cell_T; Dest : out Cell_T);

end Cell;
