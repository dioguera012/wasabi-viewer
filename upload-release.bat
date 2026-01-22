@echo off
chcp 65001 >nul

echo.
echo ╔════════════════════════════════════════╗
echo ║   Upload Release para GitHub          ║
echo ╚════════════════════════════════════════╝
echo.

:: Solicitar versão
set /p VERSION="Digite a versão (ex: 1.3.0): "

if "%VERSION%"=="" (
    echo [ERRO] Versão não pode ser vazia!
    pause
    exit /b 1
)

set INSTALLER_PATH=setup\Wasabi Viewer Setup %VERSION%.exe

:: Verificar se o instalador existe
if not exist "%INSTALLER_PATH%" (
    echo.
    echo [ERRO] Instalador não encontrado:
    echo %INSTALLER_PATH%
    echo.
    echo Execute 'build-installer.bat' primeiro!
    echo.
    pause
    exit /b 1
)

echo.
echo ════════════════════════════════════════
echo  Fazendo upload da v%VERSION%
echo ════════════════════════════════════════
echo.

:: Criar release
echo [1/3] 🏷️  Criando release no GitHub...
gh release create v%VERSION% --title "Wasabi Viewer %VERSION%" --notes-file CHANGELOG.md
if %errorLevel% neq 0 (
    echo [AVISO] Release já existe ou erro ao criar
)

:: Upload do instalador
echo.
echo [2/3] ⬆️  Fazendo upload do instalador...
gh release upload v%VERSION% "%INSTALLER_PATH%" --clobber
if %errorLevel% neq 0 (
    echo [ERRO] Falha ao fazer upload
    pause
    exit /b 1
)

echo.
echo [3/3] 🌐 Abrindo release no navegador...
gh release view v%VERSION% --web

echo.
echo ════════════════════════════════════════
echo  ✅ Release v%VERSION% publicada!
echo ════════════════════════════════════════
echo.
echo URL: https://github.com/dioguera012/wasabi-viewer/releases/tag/v%VERSION%
echo.
pause
