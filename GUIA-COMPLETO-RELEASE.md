# 📦 Guia Completo de Release - Wasabi Viewer

## ✅ Sistema Implementado

### 📂 Estrutura da Pasta Setup

```
wasabi-viewer/
├── setup/                          # Pasta com instaladores
│   ├── Wasabi Viewer Setup 1.3.0.exe  # Versão ATUAL
│   └── Wasabi Viewer Setup 1.2.0.exe  # Versão ANTERIOR (quando houver)
```

**Funcionamento:**
- ✅ Mantém sempre as **2 últimas versões**
- ✅ Remove automaticamente versões mais antigas
- ✅ Não vai para o Git (apenas .gitkeep)

---

## 🚀 Como Gerar e Publicar Nova Versão

### **Método 1: Totalmente Automatizado (RECOMENDADO)**

```batch
release-new-version.bat
```

**O que faz:**
1. ✅ Pergunta a nova versão (ex: 1.3.1)
2. ✅ Atualiza `package.json`
3. ✅ Faz commit e push para GitHub
4. ✅ Cria tag
5. ✅ Gera instalador (pede privilégios de admin)
6. ✅ Copia para pasta `setup/`
7. ✅ Remove versões antigas (mantém 2 últimas)
8. ℹ️ Mostra comandos para upload

**Depois execute:**
```batch
upload-release.bat
```
- Cria release no GitHub
- Faz upload do instalador
- Abre no navegador

---

### **Método 2: Passo a Passo**

#### **Passo 1: Build do Instalador**

**Opção A - Com assinatura (requer admin):**
```batch
build-installer.bat
```
Clique em "Sim" quando pedir privilégios de administrador.

**Opção B - Sem assinatura (mais rápido):**
```batch
build-simple.bat
```
Não requer privilégios de administrador, mas o instalador não será assinado.

**Resultado:**
- ✅ Instalador gerado em `dist/setups/<versão>/`
- ✅ Copiado para `setup/`
- ✅ Versões antigas removidas automaticamente

#### **Passo 2: Upload para GitHub**

```batch
upload-release.bat
```
- Digite a versão
- Cria release
- Faz upload
- Abre no navegador

---

## 🔧 Scripts Disponíveis

| Script | Descrição | Quando Usar |
|--------|-----------|-------------|
| `release-new-version.bat` | Release completa automatizada | **Nova versão completa** |
| `build-installer.bat` | Gera instalador com assinatura | Build com assinatura |
| `build-simple.bat` | Gera instalador sem assinatura | Build rápido sem admin |
| `upload-release.bat` | Upload para GitHub | Após gerar instalador |

---

## 📊 Gerenciamento Automático de Versões

### **Como Funciona:**

O script `scripts/manage-setup-versions.js` é executado automaticamente após cada build:

1. **Copia** o instalador de `dist/setups/<versão>/` para `setup/`
2. **Lista** todos os instaladores em `setup/`
3. **Ordena** por versão (mais recente primeiro)
4. **Mantém** apenas as 2 versões mais recentes
5. **Remove** versões antigas automaticamente

### **Exemplo:**

```
Antes do build da v1.3.1:
setup/
├── Wasabi Viewer Setup 1.3.0.exe  (atual)
└── Wasabi Viewer Setup 1.2.0.exe  (anterior)

Depois do build da v1.3.1:
setup/
├── Wasabi Viewer Setup 1.3.1.exe  (atual)   ← NOVO
├── Wasabi Viewer Setup 1.3.0.exe  (anterior)
└── [1.2.0 removido automaticamente]
```

---

## ✅ Status Atual - v1.3.0

### **Implementado:**
- ✅ Pasta `setup/` criada
- ✅ Instalador v1.3.0 gerado
- ✅ Copiado para `setup/`
- ✅ Release v1.3.0 criada no GitHub
- ✅ Instalador disponível para download
- ✅ Scripts automatizados funcionando

### **Links:**
- 🔗 **Release:** https://github.com/dioguera012/wasabi-viewer/releases/tag/v1.3.0
- 📥 **Download:** Wasabi Viewer Setup 1.3.0.exe
- 📦 **Repositório:** https://github.com/dioguera012/wasabi-viewer

---

## 🎯 Fluxo Rápido para Próximas Versões

### **Versão Nova (ex: 1.3.1):**

```batch
# 1. Desenvolva as alterações e teste com F5

# 2. Execute o script de release
release-new-version.bat
# Digite: 1.3.1
# Clique em "Sim" quando pedir admin
# Aguarde o build terminar

# 3. Faça o upload
upload-release.bat
# Digite: 1.3.1

# 4. Pronto! ✅
```

**Tempo total:** 5-10 minutos (dependendo do tamanho do build)

---

## 🛠️ Solução de Problemas

### **Build falha por falta de privilégios**
**Solução:** Use `build-simple.bat` (sem assinatura) ou execute como administrador

### **Erro "GitHub CLI não encontrado"**
**Solução 1:** Instale GitHub CLI: https://cli.github.com/  
**Solução 2:** Use a interface web do GitHub para criar release

### **Versão antiga não foi removida**
**Solução:** Execute manualmente: `node scripts/manage-setup-versions.js`

### **Instalador não está em setup/**
**Solução:** Execute: `node scripts/manage-setup-versions.js`

---

## 📝 Checklist de Release

- [ ] Código desenvolvido e testado (F5)
- [ ] `CHANGELOG.md` atualizado
- [ ] Execute `release-new-version.bat`
- [ ] Build concluído com sucesso
- [ ] Instalador em `setup/`
- [ ] Execute `upload-release.bat`
- [ ] Release criada no GitHub
- [ ] Instalador disponível para download
- [ ] Testado o download

---

## 🎉 Vantagens do Sistema

✅ **Automatizado** - Scripts fazem quase tudo  
✅ **Organizado** - Instaladores na pasta `setup/`  
✅ **Limpo** - Remove versões antigas automaticamente  
✅ **Versionado** - Mantém histórico das 2 últimas  
✅ **Rápido** - Processo simplificado  
✅ **Confiável** - Tratamento de erros robusto  

---

**Criado em:** 22/01/2026  
**Versão atual:** 1.3.0 ✅  
**Status:** Totalmente funcional e testado
