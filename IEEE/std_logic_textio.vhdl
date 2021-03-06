-- --------------------------------------------------------------------
--
-- Copyright © 2008 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076-2008,
-- IEEE Standard VHDL Language Reference Manual. This source file may not be
-- copied, sold, or included with software that is sold without written
-- permission from the IEEE Standards Department. This source file may be
-- copied for individual use between licensed users. This source file is
-- provided on an AS IS basis. The IEEE disclaims ANY WARRANTY EXPRESS OR
-- IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY AND FITNESS FOR USE
-- FOR A PARTICULAR PURPOSE. The user of the source file shall indemnify
-- and hold IEEE harmless from any damages or liability arising out of the
-- use thereof.
--
--   Title     :  Standard multivalue logic package
--             :  (STD_LOGIC_TEXTIO package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC and IEEE P1076 Working Group
--             :
--   Purpose   :  This packages is provided as a replacement for non-standard
--             :  implementations of the package provided by implementers of
--             :  previous versions of this standard. The declarations that
--             :  appeared in those non-standard implementations appear in the
--             :  package STD_LOGIC_1164 in this standard.
--             :
--   Note      :  No declarations or definitions shall be included in,
--             :  or excluded from this package.
--             :
-- --------------------------------------------------------------------
-- $Revision: 1305 $
-- $Date: 2008-06-27 14:28:49 +0930 (Fri, 27 Jun 2008) $
-- --------------------------------------------------------------------

library ieee;
use std.textio.all;
use ieee.std_logic_1164.all;

package std_logic_textio is

  alias read  is ieee.std_logic_1164.read [line, std_ulogic];
  alias read  is ieee.std_logic_1164.read [line, std_ulogic, boolean];
  alias read  is ieee.std_logic_1164.read [line, std_ulogic_vector];
  alias read  is ieee.std_logic_1164.read [line, std_ulogic_vector, boolean];
  alias write is ieee.std_logic_1164.write [line, std_ulogic, side, width];
  alias write is ieee.std_logic_1164.write [line, std_ulogic_vector, side, width];

  alias hread  is ieee.std_logic_1164.hread [line, std_ulogic_vector];
  alias hread  is ieee.std_logic_1164.hread [line, std_ulogic_vector, boolean];
  alias hwrite is ieee.std_logic_1164.hwrite [line, std_ulogic_vector, side, width];

  alias oread  is ieee.std_logic_1164.oread [line, std_ulogic_vector];
  alias oread  is ieee.std_logic_1164.oread [line, std_ulogic_vector, boolean];
  alias owrite is ieee.std_logic_1164.owrite [line, std_ulogic_vector, side, width];

end package std_logic_textio;
