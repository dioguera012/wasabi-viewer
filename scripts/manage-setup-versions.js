const fs = require('fs');
const path = require('path');

// Função para comparar versões semânticas
function compareVersions(a, b) {
    const partsA = a.split('.').map(Number);
    const partsB = b.split('.').map(Number);
    
    for (let i = 0; i < Math.max(partsA.length, partsB.length); i++) {
        const numA = partsA[i] || 0;
        const numB = partsB[i] || 0;
        
        if (numA > numB) return 1;
        if (numA < numB) return -1;
    }
    
    return 0;
}

// Ler versão atual do package.json
const packagePath = path.join(__dirname, '..', 'package.json');
const packageJson = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
const currentVersion = packageJson.version;

console.log(`\n[Setup Manager] Versão atual: ${currentVersion}`);

// Caminhos
const distSetupsPath = path.join(__dirname, '..', 'dist', 'setups', currentVersion);
const setupFolderPath = path.join(__dirname, '..', 'setup');
const installerName = `Wasabi Viewer Setup ${currentVersion}.exe`;
const sourceInstallerPath = path.join(distSetupsPath, installerName);
const destInstallerPath = path.join(setupFolderPath, installerName);

// Verificar se o instalador foi gerado
if (!fs.existsSync(sourceInstallerPath)) {
    console.error(`[Setup Manager] ❌ Instalador não encontrado: ${sourceInstallerPath}`);
    process.exit(1);
}

// Criar pasta setup se não existir
if (!fs.existsSync(setupFolderPath)) {
    fs.mkdirSync(setupFolderPath, { recursive: true });
    console.log('[Setup Manager] ✓ Pasta setup/ criada');
}

// Copiar instalador para a pasta setup
console.log(`[Setup Manager] Copiando instalador para setup/...`);
fs.copyFileSync(sourceInstallerPath, destInstallerPath);
console.log(`[Setup Manager] ✓ ${installerName} copiado com sucesso`);

// Listar todos os instaladores na pasta setup
const setupFiles = fs.readdirSync(setupFolderPath)
    .filter(file => file.startsWith('Wasabi Viewer Setup ') && file.endsWith('.exe'))
    .map(file => {
        const versionMatch = file.match(/Wasabi Viewer Setup (\d+\.\d+\.\d+)\.exe/);
        return {
            filename: file,
            version: versionMatch ? versionMatch[1] : '0.0.0',
            path: path.join(setupFolderPath, file)
        };
    })
    .sort((a, b) => compareVersions(b.version, a.version)); // Mais recente primeiro

console.log(`\n[Setup Manager] Instaladores encontrados: ${setupFiles.length}`);
setupFiles.forEach((file, index) => {
    console.log(`  ${index + 1}. v${file.version}`);
});

// Manter apenas as 2 versões mais recentes
if (setupFiles.length > 2) {
    console.log(`\n[Setup Manager] Removendo versões antigas (mantendo as 2 mais recentes)...`);
    
    const filesToRemove = setupFiles.slice(2); // Pega da terceira em diante
    
    filesToRemove.forEach(file => {
        try {
            fs.unlinkSync(file.path);
            console.log(`[Setup Manager] ✓ Removido: v${file.version}`);
        } catch (error) {
            console.error(`[Setup Manager] ❌ Erro ao remover v${file.version}:`, error.message);
        }
    });
}

// Versões mantidas
const keptVersions = setupFiles.slice(0, 2);
console.log(`\n[Setup Manager] ✓ Versões mantidas na pasta setup/:`);
keptVersions.forEach((file, index) => {
    const label = index === 0 ? '(ATUAL)' : '(ANTERIOR)';
    console.log(`  - v${file.version} ${label}`);
});

console.log(`\n[Setup Manager] ✅ Gerenciamento de versões concluído!\n`);
