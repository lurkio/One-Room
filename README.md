# One-Room
A port to BBC BASIC of the TRS-80/CoCo text adventure game One Room by Jorge Mir

Play the game in your browser (or download it): http://bbcmicro.co.uk/game.php?id=2881

## Files
**oneroom.bas** — The main game file. Originally written in 32K Extended Color BASIC for the TRS-80 Color Computer and published in the Rainbow Book Of Adventures in 1983. Ported to BBC BASIC for the BBC Micro computer in 2018, and then tinkered with continually.

**data out.bas** — A program in BBC BASIC that writes the game's init data to a file that will be read in by *oneroom.bas* every time the game (re)starts.

**data in.bas** — A program in BBC BASIC to help you check that the datafile written by *data out.bas* is correct.
