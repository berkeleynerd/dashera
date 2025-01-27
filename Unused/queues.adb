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

with Ada.Containers; use Ada.Containers;

package body Queues is

   procedure Keyboard_Enqueue (BA : in Byte_Arr) is
   begin
      Keyboard_Q.Enqueue (Byte_Arrs.To_Holder (BA));
   end Keyboard_Enqueue;

   function Keyboard_Dequeue return Byte_Arr is
      BA_H : Byte_Arrs.Holder;
   begin
      Keyboard_Q.Dequeue (Element => BA_H);
      return Byte_Arrs.Element (BA_H);
   end Keyboard_Dequeue;
   
   function Keyboard_Data_Waiting return Boolean is
   begin
      return Keyboard_Q.Current_Use > 0;
   end Keyboard_Data_Waiting;
      
   
end Queues;