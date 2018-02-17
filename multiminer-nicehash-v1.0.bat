@echo off
setlocal EnableDelayedExpansion 
rem **********************************************************************
rem *         Multi-Miner Easy Batch File  v1.0 by ne0rmatrix               *
rem *     Featuring Claymore, SGMiner, CCMiner, EBWF's Miner and more    *
rem *   Pre-Configured syntax, just update address/worker                *
rem *    Eth, Etc, Xmr, Lbry, Sia, Zcash, Pasc, Hush, DBIX, ubiq and more*
rem **********************************************************************
rem * BEST VIEWED IN FULL SCREEN 1920x1080
rem **********************************************************************


CALL my_info.bat


SET BTC_WALLET_ADDRESS=%BTC%
rem *** MUST UPDATE JSON FILE FOR NVIDIA XMR FOR USER INFO

SET MINER_WEBLOGIN=%MINER-WEBLOGIN%
SET WORKER_PASSWORD=%WORKER-PASSWORD%
SET MINER_NAME=%MINER-NAME%
SET EMAIL_ADDRESS=%EMAIL-ADDRESS%

setx GPU_FORCE_64BIT_PTR 0 >nul 2>&1
setx GPU_MAX_HEAP_SIZE 100 >nul 2>&1
setx GPU_USE_SYNC_OBJECTS 1 >nul 2>&1
setx GPU_MAX_ALLOC_PERCENT 100 >nul 2>&1
setx GPU_SINGLE_ALLOC_PERCENT 100 >nul 2>&1

SET miner=%1

IF NOT "%miner%"=="" (
    SET /A M=%miner%
    goto MinerSwitch
)
call text.bat
:MinerSwitch
:: Get input from user
SET /P M=Type 1, 2, 3, or 4 then press ENTER:
if %ERRORLEVEL% NEQ 0 goto EOF

:: Is choice a number?
SET "var="&for /f "delims=0123456789" %%i in ("%M%") do set var=%%i
if defined var goto EOF


IF %M%==1 GOTO eth-usa
IF %M%==2 GOTO eth-europe
IF %M%==3 GOTO eth-asia
IF %M%==4 GOTO nist5-usa
IF %M%==5 GOTO nist5-europe
IF %M%==6 GOTO nist5-asia
IF %M%==7 GOTO neoscrypt-usa
IF %M%==8 GOTO neoscrypt-europe
IF %M%==9 GOTO neoscrypt-asia
IF %M%==16 GOTO monero1
IF %M%==17 GOTO monero2
IF %M%==18 GOTO monero3
IF %M%==19 GOTO zcash1
IF %M%==20 GOTO zcash2
IF %M%==21 GOTO zcash3
IF %M%==22 GOTO siacoin1
IF %M%==23 GOTO pascal1
IF %M%==24 GOTO pascal2
IF %M%==25 GOTO hush1
IF %M%==26 GOTO hush2
IF %M%==27 GOTO lbry1
IF %M%==28 GOTO lbry2
IF %M%==29 GOTO dbix1
IF %M%==30 GOTO dbix2
IF %M%==31 GOTO dbix3
IF %M%==32 GOTO dbix4
IF %M%==33 GOTO ubiq2
IF %M%==34 GOTO ubiq3
IF %M%==35 GOTO ubiq4
IF %M%==36 GOTO ubiq5
IF %M%==37 GOTO ubiq6
IF %M%==38 GOTO exp1
IF %M%==39 GOTO btg1
IF %M%==40 GOTO btg2
IF %M%==41 GOTO dgb1
IF %M%==42 GOTO dgb2
IF %M%==43 GOTO ftc1
IF %M%==44 GOTO ftc2
IF %M%==45 GOTO mus1
IF %M%==46 GOTO mus2
IF %M%==47 GOTO mus3
IF %M%==48 GOTO mus4
IF %M%==49 GOTO mus5
IF %M%==50 GOTO etn1
IF %M%==51 GOTO etn2
IF %M%==52 GOTO etn3
IF %M%==53 GOTO zcl1
IF %M%==54 GOTO zcl2
IF %M%==55 GOTO xzc1
IF %M%==56 GOTO xzc2
IF %M%==57 GOTO vtc1
IF %M%==58 GOTO zen3
IF %M%==59 GOTO zen4
IF %M%==60 GOTO zen1
IF %M%==61 GOTO zen2
IF %M%==62 GOTO pirl1
IF %M%==63 GOTO pirl2
IF %M%==64 GOTO pirl3
IF %M%==65 GOTO ella1
IF %M%==66 GOTO ella2
IF %M%==67 GOTO ella3
IF %M%==68 GOTO ella4
IF %M%==69 GOTO ella5
IF %M%==70 GOTO ella6
IF %M%==71 GOTO sumo1
IF %M%==72 GOTO sumo2
IF %M%==73 GOTO sumo3
IF %M%==74 GOTO krb1
IF %M%==75 GOTO krb2
IF %M%==76 GOTO krb3
IF %M%==77 GOTO zcash4
IF %M%==78 GOTO zcash5
IF %M%==79 GOTO mona1
IF %M%==80 GOTO mona1
IF %M%==81 GOTO pirl4
IF %M%==82 GOTO pirl5
IF %M%==83 GOTO pirl6
IF %M% GTR 84 GOTO EOF

::
:: Ethereum miners
::
:eth-usa
ECHO Claymore MINER AMD and NVIDIA - Eth nicehash USA only
Miners\Claymore_Dual_Ethereum_v11.0\EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.usa.nicehash.com:3353 -ewal %BTC%.%MINER_NAME% -epsw x -esm 3 -allpools 1
if %ERRORLEVEL% NEQ 0 goto exit
pause

:eth-europe
ECHO Claymore MINER AMD and NVIDIA - Eth nicehash Europe Only
Miners\Claymore_Dual_Ethereum_v11.0\EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353  -ewal %BTC%.%MINER_NAME% -epsw x -esm 3 -allpools 1
if %ERRORLEVEL% NEQ 0 goto exit
pause


:eth-asia
ECHO Claymore MINER AMD and NVIDIA - Eth nicehash Asia Only
Miners\Claymore_Dual_Ethereum_v11.0\EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.hk.nicehash.com:3353  -ewal %BTC%.%MINER_NAME% -epsw x -esm 3 -allpools 1
if %ERRORLEVEL% NEQ 0 goto exit
pause

::
:: Nist5 Miners
::
:nist5-usa
ECHO ccminer - Nist5 for nicehash USA Only
Miners\ccminer-x64-2.2.2-cuda9\ccminer-x64.exe -a nist5 -o stratum+tcp://nist5.usa.nicehash.com:3340 -u %BTC%.%MINER_NAME% -p x 
if %ERRORLEVEL% NEQ 0 goto exit
pause

:nist5-europe
ECHO ccminer - Nist5 for nicehash europe Only
Miners\ccminer-x64-2.2.2-cuda9\ccminer-x64.exe -a nist5 -o stratum+tcp://nist5.eu.nicehash.com:3340 -u %BTC%.%MINER_NAME% -p x 
if %ERRORLEVEL% NEQ 0 goto exit
pause

:nist5-asia
ECHO ccminer - Nist5 for nicehash asia Only
Miners\ccminer-x64-2.2.2-cuda9\ccminer-x64.exe -a nist5 -o stratum+tcp://nist5.hk.nicehash.com:3340 -u %BTC%.%MINER_NAME% -p x 
if %ERRORLEVEL% NEQ 0 goto exit
pause

::
:: Neoscrypt Miners
::
:neoscrypt-usa
ECHO ccminer - Neoscrypt for nicehash USA Only
Miners\ccminer-x64-2.2.2-cuda9\ccminer-x64.exe -a neoscrypt -o stratum+tcp://neoscrypt.usa.nicehash.com:3341 -u %BTC%.%MINER_NAME% -p x 
if %ERRORLEVEL% NEQ 0 goto exit
pause

:neoscrypt-europe
ECHO ccminer - Neoscrypt for nicehash europe Only
Miners\ccminer-x64-2.2.2-cuda9\ccminer-x64.exe -a neoscrypt -o stratum+tcp://neoscrypt.eu.nicehash.com:3341 -u %BTC%.%MINER_NAME% -p x 
if %ERRORLEVEL% NEQ 0 goto exit
pause

:neoscrypt-asia
ECHO ccminer - Neoscrypt for nicehash asia Only
Miners\ccminer-x64-2.2.2-cuda9\ccminer-x64.exe -a neoscrypt -o stratum+tcp://neoscrypt.hk.nicehash.com:3341 -u %BTC%.%MINER_NAME% -p x 
if %ERRORLEVEL% NEQ 0 goto exit

:EOF
