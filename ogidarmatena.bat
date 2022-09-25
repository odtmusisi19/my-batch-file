@echo off
dir /b /a:h /a "D:\" > hasil.txt
setlocal enabledelayedexpansion
echo Enter password to Unlock folder

set /p "pass=>"
if NOT %pass%==ogidarmatena goto FAIL

echo WELLCOME IN OGI CODE
echo keyword : show
echo keyword : hidden
echo input keyword

set/p "cho=>"

if %cho%==show (

:SHOW
@echo off
REM MENGAMBIL HASIL DARI DIR DAN MEMASUKANNYA KE "hasil.txt"
set count=0
for /f "tokens=*" %%x in (hasil.txt) do (
    set /a count+=1
    set var[!count!]=%%x
    echo ogi darma tena SUKSES %%x
    attrib -h -s "D:\%%x"
)

rem echo %var[1]%
goto TERLIHAT
) else if %cho%==hidden (

:HIDDEN
@echo off

REM MENGAMBIL HASIL DARI DIR DAN MEMASUKANNYA KE "hasil.txt"

set count=0

for /f "tokens=*" %%x in (hasil.txt) do (
    set /a count+=1
    set var[!count!]=%%x
    echo ogi darma tena SUKSES %%x
    attrib +h +s "D:\%%x"
)

rem echo %var[1]%
goto TERSEMBUNYI
) else ( goto FAIL )

:FAIL
msg * GAGAL
goto END

:TERLIHAT
msg * TERLIHAT
goto END

:TERSEMBUNYI
msg * TERSEMBUNYI
goto END

:END
del hasil.txt
rem attrib +h +s hasil.txt
attrib +h +s "D:\$RECYCLE.BIN"
attrib +h +s "D:\msdownld.tmp"