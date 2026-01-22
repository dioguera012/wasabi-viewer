# Changelog - Wasabi Viewer

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

## [1.3.0] - 2026-01-22

### ✨ Novas Funcionalidades

#### 📊 Informações Avançadas de Pastas
- **Tamanho Total de Pastas**: Agora a coluna "Tamanho" exibe o tamanho total de todos os arquivos dentro de cada pasta
  - Cálculo recursivo que percorre todos os subdiretórios
  - Indicador visual com ícone de pasta aberta
  - Cor verde Wasabi para destacar
  - Tooltip informativo ao passar o mouse
  
- **Data Mais Recente**: A coluna "Modificado" agora mostra a data do arquivo mais recente dentro de cada pasta
  - Busca recursiva por todos os arquivos da pasta
  - Tooltip explicativo
  - Facilita identificar pastas com atividade recente

#### 🔍 Melhorias na Busca
- **Persistência de Busca**: Ao navegar para dentro de uma pasta e voltar, o filtro de busca é mantido
  - Melhora significativa na experiência de navegação
  - Facilita localizar arquivos em estruturas complexas

### 🎨 Melhorias Visuais
- Removidas todas as decorações natalinas (luzes, neve, papai noel)
- Interface mais limpa e profissional
- Destaque visual para informações de pastas com tooltips

### ⚙️ Melhorias Técnicas
- Processamento paralelo de múltiplas pastas para melhor desempenho
- Paginação automática para pastas grandes (limite de 1000 objetos por requisição)
- Tratamento de erros individual por pasta
- Logs detalhados no console para debugging

### 🔧 Configurações
- Configuração completa do F5 para debug no Cursor/VSCode
- Arquivos `.vscode/` criados com launch.json, tasks.json e settings.json
- Scripts de execução otimizados

### 📝 Documentação
- `NOVAS-FUNCIONALIDADES-PASTAS.md` - Documentação completa das novas funcionalidades
- `INSTRUÇÕES-F5-ATUALIZADO.md` - Guia completo de uso do F5
- `.gitignore` - Configuração de arquivos ignorados

## [1.2.0] - 2025-12-XX

### Funcionalidades
- Sistema de múltiplas configurações de buckets
- Compartilhamento de configurações via token
- Download de arquivos com fila e progresso
- Geração de links temporários
- Tema escuro/claro
- Decorações natalinas (removidas na v1.3.0)

## [1.0.0] - 2025-XX-XX

### Lançamento Inicial
- Visualização de arquivos do Wasabi S3
- Download de arquivos
- Navegação por pastas
- Interface básica
