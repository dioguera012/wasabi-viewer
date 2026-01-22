@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

echo.
echo ╔════════════════════════════════════════╗
echo ║   Wasabi Viewer - Release Manager     ║
echo ╚════════════════════════════════════════╝
echo.

:: Solicitar versão
set /p VERSION="Digite a nova versão (ex: 1.3.1): "

if "%VERSION%"=="" (
    echo [ERRO] Versão não pode ser vazia!
    pause
    exit /b 1
)

echo.
echo ════════════════════════════════════════
echo  Criando Release v%VERSION%
echo ════════════════════════════════════════
echo.

:: 1. Atualizar package.json
echo [1/7] 📝 Atualizando versão no package.json...
node -e "const fs=require('fs'); const p='package.json'; const pkg=JSON.parse(fs.readFileSync(p,'utf8')); pkg.version='%VERSION%'; pkg.build.buildVersion='%VERSION%'; fs.writeFileSync(p, JSON.stringify(pkg,null,2)+'\n');"
if %errorLevel% neq 0 (
    echo [ERRO] Falha ao atualizar package.json
    pause
    exit /b 1
)
echo ✓ Versão atualizada

:: 2. Atualizar CHANGELOG
echo.
echo [2/7] 📋 Atualize o CHANGELOG.md manualmente se necessário
timeout /t 3 >nul

:: 3. Git add
echo.
echo [3/7] 📦 Adicionando arquivos ao Git...
git add .
echo ✓ Arquivos adicionados

:: 4. Git commit
echo.
echo [4/7] 💾 Fazendo commit...
git commit -m "v%VERSION% - Nova versão"
if %errorLevel% neq 0 (
    echo [AVISO] Nada para commitar ou erro no commit
)
echo ✓ Commit realizado

:: 5. Git tag
echo.
echo [5/7] 🏷️  Criando tag v%VERSION%...
git tag -a v%VERSION% -m "Versão %VERSION%"
echo ✓ Tag criada

:: 6. Git push
echo.
echo [6/7] ⬆️  Enviando para GitHub...
git push origin master
git push origin v%VERSION%
if %errorLevel% neq 0 (
    echo [ERRO] Falha ao enviar para GitHub
    pause
    exit /b 1
)
echo ✓ Push realizado

:: 7. Build instalador
echo.
echo [7/7] 🔨 Gerando instalador...
echo.
echo ⚠️  IMPORTANTE: Uma janela será aberta solicitando privilégios de administrador
echo     Clique em "Sim" para continuar com o build
echo.
timeout /t 3 >nul

:: Criar script temporário para executar com privilégios
echo cd /d "%CD%" > "%TEMP%\wasabi-build.bat"
echo npm run dist >> "%TEMP%\wasabi-build.bat"
echo if %%errorLevel%% equ 0 ( >> "%TEMP%\wasabi-build.bat"
echo   echo. >> "%TEMP%\wasabi-build.bat"
echo   echo ════════════════════════════════════════ >> "%TEMP%\wasabi-build.bat"
echo   echo   [SUCESSO] Instalador gerado! >> "%TEMP%\wasabi-build.bat"
echo   echo ════════════════════════════════════════ >> "%TEMP%\wasabi-build.bat"
echo   echo. >> "%TEMP%\wasabi-build.bat"
echo   echo Localizacao: dist\setups\%VERSION%\ >> "%TEMP%\wasabi-build.bat"
echo   echo. >> "%TEMP%\wasabi-build.bat"
echo ) else ( >> "%TEMP%\wasabi-build.bat"
echo   echo. >> "%TEMP%\wasabi-build.bat"
echo   echo ════════════════════════════════════════ >> "%TEMP%\wasabi-build.bat"
echo   echo   [ERRO] Falha ao gerar instalador >> "%TEMP%\wasabi-build.bat"
echo   echo ════════════════════════════════════════ >> "%TEMP%\wasabi-build.bat"
echo   echo. >> "%TEMP%\wasabi-build.bat"
echo ) >> "%TEMP%\wasabi-build.bat"
echo pause >> "%TEMP%\wasabi-build.bat"

:: Executar com privilégios de administrador
powershell -Command "Start-Process cmd -ArgumentList '/c', '%TEMP%\wasabi-build.bat' -Verb RunAs"

echo.
echo ✓ Build iniciado em janela separada
echo.
echo ════════════════════════════════════════
echo  ⏳ Aguardando conclusão do build...
echo ════════════════════════════════════════
echo.
echo Após o build terminar, execute:
echo   gh release create v%VERSION% --title "Wasabi Viewer %VERSION%" --notes-file CHANGELOG.md
echo   gh release upload v%VERSION% "dist\setups\%VERSION%\Wasabi Viewer Setup %VERSION%.exe"
echo.
echo Ou acesse: https://github.com/dioguera012/wasabi-viewer/releases/new
echo.
pause
