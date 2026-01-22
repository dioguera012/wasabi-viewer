# 🚀 Como Gerar e Publicar Nova Versão

## 📋 Processo Completo

### **Passo 1: Gerar o Instalador**

#### **Opção A: Script Automático (RECOMENDADO)**
1. **Clique com botão direito** em `build-installer.bat`
2. Selecione **"Executar como administrador"**
3. Aguarde a conclusão do build
4. O instalador estará em: `dist/setups/<versão>/`

#### **Opção B: PowerShell como Administrador**
1. Abra **PowerShell como Administrador**
2. Navegue até a pasta do projeto:
   ```powershell
   cd "C:\Projetos\Cursor\wasabi-viewer-master"
   ```
3. Execute o build:
   ```powershell
   npm run dist
   ```

#### **Opção C: Se der erro de privilégios**
Se continuar dando erro de links simbólicos, use este comando que ignora a assinatura:
```powershell
npx electron-builder build --win --x64 --config.win.sign=null
```

---

### **Passo 2: Verificar o Instalador Gerado**

O instalador deve estar em:
```
dist/setups/1.3.0/Wasabi Viewer Setup 1.3.0.exe
```

**Tamanho esperado:** ~150-200 MB

---

### **Passo 3: Criar Release no GitHub**

#### **Opção A: GitHub CLI (gh)**
```powershell
# Criar a release
gh release create v1.3.0 --title "Wasabi Viewer 1.3.0" --notes-file CHANGELOG.md

# Fazer upload do instalador
gh release upload v1.3.0 "dist/setups/1.3.0/Wasabi Viewer Setup 1.3.0.exe"

# Abrir a release no navegador
gh release view v1.3.0 --web
```

#### **Opção B: Interface Web do GitHub**
1. Acesse: https://github.com/dioguera012/wasabi-viewer/releases/new
2. **Tag version**: `v1.3.0`
3. **Release title**: `Wasabi Viewer 1.3.0`
4. **Description**: Copie o conteúdo de `CHANGELOG.md`
5. **Attach files**: Arraste o arquivo `.exe` de `dist/setups/1.3.0/`
6. Clique em **"Publish release"**

---

## 🔄 Automatização Futura

### **Script de Release Completo**

Crie um arquivo `release-new-version.bat`:

```batch
@echo off
setlocal enabledelayedexpansion

:: Solicitar versão
set /p VERSION="Digite a nova versao (ex: 1.3.1): "

echo ========================================
echo  Release v%VERSION%
echo ========================================
echo.

:: 1. Atualizar package.json
echo [1/6] Atualizando versao no package.json...
node -e "const fs=require('fs'); const p='package.json'; const pkg=JSON.parse(fs.readFileSync(p,'utf8')); pkg.version='%VERSION%'; pkg.build.buildVersion='%VERSION%'; fs.writeFileSync(p, JSON.stringify(pkg,null,2));"

:: 2. Commit
echo [2/6] Fazendo commit...
git add .
git commit -m "v%VERSION% - Nova versao"

:: 3. Tag
echo [3/6] Criando tag...
git tag -a v%VERSION% -m "Versao %VERSION%"

:: 4. Push
echo [4/6] Enviando para GitHub...
git push origin master
git push origin v%VERSION%

:: 5. Build (requer admin)
echo [5/6] Gerando instalador (requer privilegios de admin)...
echo Clique em 'Sim' na janela de UAC que aparecerá...
powershell -Command "Start-Process npm -ArgumentList 'run', 'dist' -Verb RunAs -Wait"

:: 6. Upload release
echo [6/6] Criando release no GitHub...
gh release create v%VERSION% --title "Wasabi Viewer %VERSION%" --notes "Release %VERSION%"
gh release upload v%VERSION% "dist/setups/%VERSION%/Wasabi Viewer Setup %VERSION%.exe"

echo.
echo ========================================
echo  [SUCESSO] Release v%VERSION% publicada!
echo ========================================
echo.
echo URL: https://github.com/dioguera012/wasabi-viewer/releases/tag/v%VERSION%
echo.
pause
```

---

## 🛠️ Solução de Problemas

### **Erro: "Cannot create symbolic link"**
- **Causa**: Falta de privilégios de administrador
- **Solução**: Execute o PowerShell ou CMD como Administrador

### **Erro: "gh: command not found"**
- **Causa**: GitHub CLI não instalado
- **Solução**: 
  1. Baixe em: https://cli.github.com/
  2. Ou use a interface web do GitHub

### **Build muito lento**
- **Normal**: O primeiro build baixa o Electron (~100MB)
- **Próximos builds**: Serão mais rápidos (usam cache)

### **Instalador não funciona**
- Verifique se o antivírus não está bloqueando
- Teste em uma VM ou outro computador
- Verifique os logs em `dist/builder-debug.yml`

---

## 📝 Checklist de Release

- [ ] Versão atualizada no `package.json`
- [ ] `CHANGELOG.md` atualizado
- [ ] Código testado localmente (F5)
- [ ] Commit realizado
- [ ] Tag criada e enviada
- [ ] Build do instalador concluído com sucesso
- [ ] Instalador testado
- [ ] Release criada no GitHub
- [ ] Instalador anexado à release
- [ ] Notas de release preenchidas
- [ ] Link da release compartilhado (se necessário)

---

## 🎯 Próxima Versão

Quando for fazer uma nova release, siga este fluxo:

1. **Desenvolva as alterações**
2. **Teste com F5**
3. **Execute:** `build-installer.bat` (como Admin)
4. **Suba para o GitHub** (git + gh cli ou web)
5. **Pronto!** ✅

---

**Criado em:** 22/01/2026  
**Versão atual:** 1.3.0
