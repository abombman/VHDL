package textio is

	-- Type definitions for text I/O:

	--```
	-- A line is a pointer to a string value.
	--
	-- The predefined operations for this type are as follows:
	--
	-- function "="  (anonymous, anonymous: line) return boolean;
	-- function "/=" (anonymous, anonymous: line) return boolean;
	--
	-- procedure deallocate (p: inout line);
	--```
	type line is access string;

	--```
	-- A file of variable-length ASCII records.
	--
	-- The predefined operations for this type are as follows:
	--
	-- procedure file_open  (file f: text; external_name: in string; open_kind: in file_open_kind := read_mode);
	-- procedure file_open  (status: out file_open_status; file f: text; external_name: in string; open_kind: in file_open_kind := read_mode);
	-- procedure file_close (file f: text);
	-- procedure read       (file f: text; value: out string);
	-- procedure write      (file f: text; value: in string);
	-- procedure flush      (file f: text);
	-- function endfile     (file f: text) return boolean;
	--```
	type text is file of string;

	--```
	-- For justifying output data within fields.
	--
	-- The predefined operations for this type are as follows:
	--
	-- function "="  (anonymous, anonymous: side) return boolean;
	-- function "/=" (anonymous, anonymous: side) return boolean;
	-- function "<"  (anonymous, anonymous: side) return boolean;
	-- function "<=" (anonymous, anonymous: side) return boolean;
	-- function ">"  (anonymous, anonymous: side) return boolean;
	-- function ">=" (anonymous, anonymous: side) return boolean;
	--
	-- function minimum (l, r: side) return side;
	-- function maximum (l, r: side) return side;
	--
	-- function to_string (value: side) return string;
	--```
	type side is (RIGHT, LEFT);

	-- For specifying widths of output fields.
	subtype width is natural;

	function justify(value     : string;
		             justified : side  := RIGHT;
		             field     : width := 0) return string;

	-- Standard text files:

	file input : text open READ_MODE is "STD_INPUT";
	file output : text open WRITE_MODE is "STD_OUTPUT";

	-- Input routines for standard types:

	procedure readline(file f : text; l : inout line);

	procedure read(l : inout line; value : out bit; good : out boolean);
	procedure read(l : inout line; value : out bit);
	procedure read(l : inout line; value : out bit_vector; good : out boolean);
	procedure read(l : inout line; value : out bit_vector);
	procedure read(l : inout line; value : out boolean; good : out boolean);
	procedure read(l : inout line; value : out boolean);
	procedure read(l : inout line; value : out character; good : out boolean);
	procedure read(l : inout line; value : out character);
	procedure read(l : inout line; value : out integer; good : out boolean);
	procedure read(l : inout line; value : out integer);
	procedure read(l : inout line; value : out real; good : out boolean);
	procedure read(l : inout line; value : out real);
	procedure read(l : inout line; value : out string; good : out boolean);
	procedure read(l : inout line; value : out string);
	procedure read(l : inout line; value : out time; good : out boolean);
	procedure read(l : inout line; value : out time);

	procedure sread(l : inout line; value : out string; strlen : out natural);
	alias string_read is sread [ line, string, natural ];

	alias bread is read [ line, bit_vector, boolean ];
	alias bread is read [ line, bit_vector ];
	alias binary_read is read [ line, bit_vector, boolean ];
	alias binary_read is read [ line, bit_vector ];

	procedure oread(l : inout line; value : out bit_vector; good : out boolean);
	procedure oread(l : inout line; value : out bit_vector);
	alias octal_read is oread [ line, bit_vector, boolean ];
	alias octal_read is oread [ line, bit_vector ];

	procedure hread(l : inout line; value : out bit_vector; good : out boolean);
	procedure hread(l : inout line; value : out bit_vector);
	alias hex_read is hread [ line, bit_vector, boolean ];
	alias hex_read is hread [ line, bit_vector ];

	-- Output routines for standard types:

	procedure writeline(file f : text; l : inout line);

	procedure tee(file f : text; l : inout line);

	procedure write(l : inout line; value : in bit; justified : in side := RIGHT; field : in width := 0);
	procedure write(l : inout line; value : in bit_vector; justified : in side := RIGHT; field : in width := 0);
	procedure write(l : inout line; value : in boolean; justified : in side := RIGHT; field : in width := 0);
	procedure write(l : inout line; value : in character; justified : in side := RIGHT; field : in width := 0);
	procedure write(l : inout line; value : in integer; justified : in side := RIGHT; field : in width := 0);
	procedure write(l : inout line; value : in real; justified : in side := RIGHT; field : in width := 0; digits : in natural := 0);
	procedure write(l : inout line; value : in real; format : in string);
	procedure write(l : inout line; value : in string; justified : in side := RIGHT; field : in width := 0);
	procedure write(l : inout line; value : in time; justified : in side := RIGHT; field : in width := 0; unit : in time := ns);

	alias swrite is write [ line, string, side, width ];
	alias string_write is write [ line, string, side, width ];

	alias bwrite is write [ line, bit_vector, side, width ];
	alias binary_write is write [ line, bit_vector, side, width ];

	procedure owrite(l : inout line; value : in bit_vector; justified : in side := RIGHT; field : in width := 0);
	alias octal_write is owrite [ line, bit_vector, side, width ];

	procedure hwrite(l : inout line; value : in bit_vector; justified : in side := RIGHT; field : in width := 0);
	alias hex_write is hwrite [ line, bit_vector, side, width ];

end textio;
