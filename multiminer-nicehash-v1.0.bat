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
IF %M%==10 GOTO equihash-nv-usa
IF %M%==10 GOTO equihash-nv-europe
IF %M%==10 GOTO equihash-nv-asia
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

::
:: Equihash Miners - Nvidia Only
::
:equihash-nv-usa
ECHO NVIDIA EWBF's CUDA Equihash for nicehash USA Only
Miners\ZEC_M0.3.4b\miner.exe --server equihash.usa.nicehash.com --user %BTC%.%MINER_NAME% --pass x --port 3357 --pec
if %ERRORLEVEL% NEQ 0 goto exit
pause

:equihash-nv-europe
ECHO NVIDIA EWBF's CUDA Equihash for nicehash Europe Only
Miners\ZEC_M0.3.4b\miner.exe --server equihash.eu.nicehash.com --user %BTC%.%MINER_NAME% --pass x --port 3357 --pec
if %ERRORLEVEL% NEQ 0 goto exit
pause

:equihash-nv-asia
ECHO NVIDIA EWBF's CUDA Equihash for nicehash Asia Only
Miners\ZEC_M0.3.4b\miner.exe --server equihash.hk.nicehash.com --user %BTC%.%MINER_NAME% --pass x --port 3357 --pec
if %ERRORLEVEL% NEQ 0 goto exit
pause
:EOF
