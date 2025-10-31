   ARGU$ = COMMAND$
   OPEN "it.ini" FOR OUTPUT AS #1
   PRINT #1,"vga_resolution = 2"
   PRINT #1,"cga_mapcolors = 0"
   PRINT #1,"hgc_mapcolors = 0"
   PRINT #1,"force_bios_chargen_g = 0"
   PRINT #1,"force_greyscale = 0"
   PRINT #1,"greyscale = 0,5,34,29,13,25,30,42,21,20,46,50,38,55,63"
   PRINT #1,"kct_int_number = 63"
   PRINT #1,"radiodrv_int_numbr = 64"
   PRINT #1,"nasa_checksum = 1"
   PRINT #1,"check_amsat_checksum = 1"
   PRINT #1,"fast_forward_delay = 100"
   PRINT #1,"printer_lines_per_page = 59"
   PRINT #1,"printer_formfeed_at_end = 1"
   PRINT #1,ARGU$
   PRINT #1,"orthographic_latlon = 1"
   PRINT #1,"win98_idledetect_workaround = 20"
   CLOSE 1
