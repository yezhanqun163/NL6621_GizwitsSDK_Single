c:\Keil\ARM\BIN40\fromelf.exe --bin -o OUTPUT OUTPUT\OBJ\SdkFw.axf
c:\Keil\ARM\BIN40\fromelf.exe -c -s -o OUTPUT\SdkFw.lst OUTPUT\OBJ\SdkFw.axf
copy OUTPUT\LIST\SdkFw.map OUTPUT\SdkFw.map /B/Y

copy ..\..\Tool\GenBootBins.exe OUTPUT\GenBootBins.exe
cd OUTPUT
GenBootBins.exe fwCodeSRAM
del GenBootBins.exe

set Hardver=NL6621
set Softver=04010001
set Time_h=%TIME:~0,2%
if /i %Time_h% LSS 10 (set Time_h=0%TIME:~1,1%)
set DTM=%DATE:~2,2%%DATE:~5,2%%DATE:~8,2%%Time_h%
set Pro=ROM
set FLAG=DBG
set Firmware=GAgent_%Hardver%_%Softver%_%DTM%_%Pro%%FLAG%.bin
copy nft_sd_uapsta.bin ..\..\..\Tool\%Firmware%
