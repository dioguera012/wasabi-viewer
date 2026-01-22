# 🚀 Como Usar F5 para Executar o Wasabi Viewer

## ✅ CONFIGURAÇÃO COMPLETA!

As configurações do F5 foram criadas e as dependências instaladas com sucesso!

## 🎯 COMO USAR AGORA

### **Opção 1: Pressione F5 (RECOMENDADO)**
1. **Pressione F5** no Cursor
2. O Wasabi Viewer será executado automaticamente
3. A aplicação abrirá em uma nova janela

### **Opção 2: Menu de Debug**
1. Clique no ícone de debug na barra lateral (Ctrl+Shift+D)
2. Selecione "🚀 Wasabi Viewer - Dev (F5)" no menu superior
3. Clique no botão verde ▶️ ou pressione F5

### **Opção 3: Scripts Batch**
- Execute `run-dev.bat` para desenvolvimento
- Execute `run-start.bat` para produção

## 🔧 CONFIGURAÇÕES CRIADAS

### **Arquivos de Configuração (.vscode/)**
- ✅ `launch.json` - Configurações de debug com F5
- ✅ `tasks.json` - Tarefas automáticas (instalação de dependências)
- ✅ `settings.json` - Configurações do workspace

### **Opções de Execução Disponíveis**
1. **🚀 Wasabi Viewer - Dev (F5)** - Modo desenvolvimento (padrão)
2. **🔧 Wasabi Viewer - Debug Detalhado** - Com logs detalhados
3. **📦 Wasabi Viewer - Produção** - Modo produção

## ⌨️ ATALHOS ÚTEIS

- **F5** - Iniciar/Executar o aplicativo
- **Shift+F5** - Parar a execução
- **Ctrl+Shift+F5** - Reiniciar o aplicativo
- **Ctrl+Shift+D** - Abrir painel de debug

## 🐛 SOLUÇÃO DE PROBLEMAS

### **Se o F5 não funcionar:**
1. Feche e reabra o Cursor
2. Verifique se está na pasta raiz do projeto
3. Execute manualmente: `npm run dev` no terminal

### **Se der erro de dependências:**
1. Execute no terminal: `npm install`
2. Tente F5 novamente

### **Para verificar se está tudo OK:**
```powershell
# Verificar Node.js
node --version

# Verificar NPM
npm --version

# Verificar dependências
Test-Path "node_modules"
```

## 📋 O QUE ACONTECE AO PRESSIONAR F5

1. ✅ Verifica se as dependências estão instaladas
2. ✅ Instala dependências automaticamente (se necessário)
3. ✅ Inicia o Electron
4. ✅ Abre o Wasabi Viewer
5. ✅ Conecta o console de debug

## 🎉 PRONTO PARA USAR!

**Agora você pode:**
- Pressionar **F5** para executar o Wasabi Viewer
- Fazer alterações no código
- Pressionar **Ctrl+Shift+F5** para reiniciar e ver as mudanças
- Usar **Shift+F5** para parar

## 💡 DICAS

- Use **Ctrl+Shift+D** para abrir o painel de debug
- Use **Ctrl+`** para abrir o terminal integrado
- Use **Ctrl+B** para alternar a barra lateral
- O console de debug mostrará logs e erros em tempo real

**Teste agora pressionando F5!** 🚀
