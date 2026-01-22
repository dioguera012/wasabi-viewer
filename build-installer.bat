@echo off
echo ========================================
echo  Wasabi Viewer - Build Installer
echo ========================================
echo.

:: Verificar se está rodando como administrador
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Executando como Administrador
    goto :build
) else (
    echo [AVISO] Solicitando privilegios de Administrador...
    echo.
    
    :: Solicitar elevação de privilégios
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:build
cd /d "%~dp0"
echo.
echo [1/4] Instalando dependencias...
call npm install
echo.
echo [2/4] Gerando icones...
call npm run generate-ico
echo.
echo [3/4] Gerando assets do instalador...
call npm run generate-installer-assets
echo.
echo [4/4] Criando instalador...
call npx electron-builder --publish=never
echo.
if %errorLevel% == 0 (
    echo ========================================
    echo  [SUCESSO] Instalador gerado!
    echo ========================================
    echo.
    echo Localização: dist\setups\
    echo.
    call node scripts/post-dist.js
) else (
    echo ========================================
    echo  [ERRO] Falha ao gerar instalador
    echo ========================================
)
echo.
pause
