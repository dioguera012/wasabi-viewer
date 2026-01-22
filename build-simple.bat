@echo off
echo ========================================
echo  Build Simplificado (sem assinatura)
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] Gerando icones...
call npm run generate-ico

echo.
echo [2/3] Gerando assets do instalador...
call npm run generate-installer-assets

echo.
echo [3/3] Criando instalador (sem assinatura)...
call npx electron-builder build --win --x64 --config.win.sign=null

if %errorLevel% == 0 (
    echo.
    echo ========================================
    echo  [SUCESSO] Instalador gerado!
    echo ========================================
    echo.
    
    echo [EXTRA] Gerenciando versoes...
    call node scripts/manage-setup-versions.js
    
    echo.
    echo Instalador disponivel em: setup\
    echo.
) else (
    echo.
    echo ========================================
    echo  [ERRO] Falha ao gerar instalador
    echo ========================================
    echo.
)

pause
