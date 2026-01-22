# 🚀 Guia Rápido de Release - Wasabi Viewer

## ⚡ Release Rápida (Automatizada)

### **Para a v1.3.0 ATUAL:**

1. **Aguarde o build terminar** na janela do PowerShell que foi aberta
2. Quando terminar, execute:
   ```batch
   upload-release.bat
   ```

### **Para PRÓXIMAS versões:**

```batch
release-new-version.bat
```

Este script faz TUDO automaticamente:
- ✅ Atualiza versão no package.json
- ✅ Faz commit e push
- ✅ Cria tag
- ✅ Gera instalador (pede admin)
- ✅ Instrui sobre upload

---

## 📋 Scripts Disponíveis

### **1. `build-installer.bat`**
Gera apenas o instalador (requer admin)
```batch
build-installer.bat
```

### **2. `release-new-version.bat`**
Processo completo de release
```batch
release-new-version.bat
```

### **3. `upload-release.bat`**
Faz upload para GitHub após build
```batch
upload-release.bat
```

---

## 🎯 Fluxo Recomendado

### **Opção A: Totalmente Automatizado**
```batch
release-new-version.bat
```
- Digite a nova versão (ex: 1.3.1)
- Clique em "Sim" quando pedir privilégios de admin
- Aguarde o build terminar
- Execute os comandos finais mostrados

### **Opção B: Passo a Passo**
```batch
# 1. Gerar instalador
build-installer.bat

# 2. Fazer upload
upload-release.bat
```

---

## ✅ Checklist Rápido

- [ ] Código testado (F5)
- [ ] CHANGELOG.md atualizado
- [ ] Execute: `release-new-version.bat` OU
- [ ] Execute: `build-installer.bat` + `upload-release.bat`
- [ ] Verifique a release no GitHub

---

## 🛠️ Troubleshooting

### **Erro de privilégios ao gerar instalador**
**Solução:** Clique com botão direito em `build-installer.bat` → "Executar como administrador"

### **GitHub CLI não encontrado**
**Solução:** Use a interface web do GitHub:
1. https://github.com/dioguera012/wasabi-viewer/releases/new
2. Tag: v1.3.0
3. Anexe: `dist\setups\1.3.0\Wasabi Viewer Setup 1.3.0.exe`

### **Build falhou**
**Solução:** Execute manualmente:
```powershell
# Como Administrador
npm run dist
```

---

## 📁 Estrutura de Arquivos

```
wasabi-viewer/
├── build-installer.bat          # Gera instalador
├── release-new-version.bat      # Release completa automática
├── upload-release.bat           # Upload para GitHub
├── GERAR-RELEASE.md            # Guia completo detalhado
└── README-RELEASE.md           # Este arquivo (guia rápido)
```

---

## 🎊 Status Atual

**Versão:** 1.3.0  
**Status:** ✅ Código commitado e enviado para GitHub  
**Pendente:** Aguardar build do instalador terminar e fazer upload

---

**Última atualização:** 22/01/2026
