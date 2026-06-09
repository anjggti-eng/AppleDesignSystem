<div align="center">

# AppleDesignSystem

### O Design System Universal para TODAS as Stacks

**Replicue a estética visual impressionante da Apple em QUALQUER plataforma, QUALQUER framework**

![Swift](https://img.shields.io/badge/Swift-5.9+-F05138?style=for-the-badge&logo=swift)
![React](https://img.shields.io/badge/React-18+-61DAFB?style=for-the-badge&logo=react)
![Vue](https://img.shields.io/badge/Vue-3+-4FC08D?style=for-the-badge&logo=vue.js)
![Angular](https://img.shields.io/badge/Angular-17+-DD0031?style=for-the-badge&logo=angular)
![Svelte](https://img.shields.io/badge/Svelte-4+-FF3E00?style=for-the-badge&logo=svelte)
![HTML/CSS](https://img.shields.io/badge/HTML%2FCSS-Vanilla-E34F26?style=for-the-badge&logo=html5)
![Licença](https://img.shields.io/badge/Licença-MIT-34C759?style=for-the-badge)

---

**6 Stacks • 50+ Componentes • AI Agent Pronto • Multiplataforma**

</div>

---

## Funciona em Todas as Plataformas

| Stack | Plataforma | Status |
|-------|------------|:------:|
| **SwiftUI** | iOS, macOS, watchOS, visionOS | ✅ |
| **React** | Web, Desktop (Electron) | ✅ |
| **Vue.js** | Web, Desktop | ✅ |
| **Angular** | Web, Desktop | ✅ |
| **Svelte** | Web, Desktop | ✅ |
| **HTML/CSS** | Qualquer navegador | ✅ |
| **Windows** | Via Swift for Windows | ✅ |
| **Linux** | Via Swift for Linux | ✅ |

---

## Sumário

- [Início Rápido](#início-rápido)
- [Stacks](#stacks)
- [Design Tokens](#design-tokens)
- [Componentes](#componentes)
- [AI Agent](#ai-agent)
- [Arquitetura](#arquitetura)
- [Contribuindo](#contribuindo)
- [Licença](#licença)

---

## Início Rápido

### SwiftUI
```swift
import SwiftUI
import AppleDesignSystem

struct ContentView: View {
    var body: some View {
        DSButton("Continuar", style: .filled) {}
    }
}
```

### React
```jsx
import { HapticButton, AppleWidget } from './AppleComponents';
import './AppleDesignSystem.css';

function App() {
  return (
    <AppleWidget>
      <HapticButton variant="primary">Continuar</HapticButton>
    </AppleWidget>
  );
}
```

### Vue
```vue
<script>
import { HapticButton, AppleWidget } from './AppleDesignSystem';
</script>

<template>
  <AppleWidget>
    <HapticButton variant="primary">Continuar</HapticButton>
  </AppleWidget>
</template>
```

### Angular
```typescript
import { HapticButtonComponent } from './haptic-button.component';

@Component({
  imports: [HapticButtonComponent],
  template: `<app-haptic-button variant="primary">Continuar</app-haptic-button>`
})
```

### Svelte
```svelte
<script>
  import HapticButton from './HapticButton.svelte';
  import AppleWidget from './AppleWidget.svelte';
</script>

<AppleWidget>
  <HapticButton variant="primary">Continuar</HapticButton>
</AppleWidget>
```

### HTML/CSS
```html
<link rel="stylesheet" href="AppleDesignSystem.css">
<link rel="stylesheet" href="AppleComponents.css">

<div class="apple-widget">
  <button class="apple-button apple-button--primary">Continuar</button>
</div>
```

---

## Stacks

### SwiftUI (`Sources/`)
| Componente | Descrição |
|------------|-----------|
| DSButton | Botão com 5 estilos + hápticos |
| DSCard | Containers de card |
| DSTextField | Campos de input com estados de erro |
| DSBadge | Badges de status |
| DSAvatar | Avatares de usuário |
| DSToggle | Toggle switch |
| DSSlider | Slider com passos |
| DSList | Componentes de lista |
| DSProgressView | Indicadores de progresso |
| DSAlert | Diálogos de alerta |
| DSSheet | Bottom sheets |
| DSLoadingIndicator | Estados de carregamento |
| DSDatePicker | Seletor de data |
| DSNavigation | Barra de navegação |
| DSProfile | Componentes de perfil |
| DSChart | Gráficos (barra, linha, circular) |
| DSTimer | Timer, relógio, cronômetro |
| DSOnboarding | Telas de onboarding |
| DSNotificationBanner | Banners de notificação |

### React (`React/`)
| Componente | Descrição |
|------------|-----------|
| HapticButton | Botão com feedback háptico |
| AppleWidget | Card com glassmorphism |
| AppleInput | Campo de input |
| AppleSearch | Barra de pesquisa |
| AppleBadge | Badge de status |
| AppleAvatar | Avatar de usuário |
| AppleToggle | Toggle switch |
| AppleList | Container de lista |
| AppleListItem | Item de lista |
| AppleProgress | Barra de progresso |
| AppleCircularProgress | Progresso circular |
| AppleLoading | Indicador de carregamento |
| AppleAlert | Modal de alerta |
| AppleSheet | Bottom sheet |
| AppleBanner | Banner de notificação |
| AppleStat | Card de estatísticas |
| AppleProfile | Cabeçalho de perfil |
| AppleOnboarding | Tela de onboarding |
| AppleTooltip | Tooltip |

### Vue (`Vue/`)
| Componente | Descrição |
|------------|-----------|
| HapticButton | Botão com feedback háptico |
| AppleWidget | Container de card |
| AppleInput | Campo de input |
| AppleList | Container de lista |
| AppleListItem | Item de lista |

### Angular (`Angular/`)
| Componente | Descrição |
|------------|-----------|
| HapticButtonComponent | Botão com feedback háptico |
| WidgetComponent | Container de card |
| InputComponent | Campo de input com CVA |

### Svelte (`Svelte/`)
| Componente | Descrição |
|------------|-----------|
| HapticButton | Botão com feedback háptico |
| AppleWidget | Container de card |
| AppleInput | Campo de input |
| AppleList | Container de lista |
| AppleListItem | Item de lista |

### HTML/CSS (`Vanilla/`)
| Classe | Descrição |
|--------|-----------|
| apple-widget | Container de card |
| apple-button | Botão (primary/secondary/destructive/plain) |
| apple-input | Campo de input |
| apple-search | Barra de pesquisa |
| apple-badge | Badge de status |
| apple-avatar | Avatar de usuário |
| apple-toggle | Toggle switch |
| apple-list | Container de lista |
| apple-progress | Barra de progresso |
| apple-progress-circular | Progresso circular |
| apple-loading | Indicador de carregamento |
| apple-shimmer | Efeito shimmer |

---

## Design Tokens

### Cores (Semânticas)
```
Fundo da Ação          #007AFF    Destruição       #FF3B30
Sucesso                #34C759    Aviso            #FF9500
Erro                   #FF3B30    Informação       #007AFF
Fundo Primário         #FFFFFF    Fundo Secundário #F2F2F7
Label Primário         #000000    Label Secundário rgba(60,60,67,0.6)
```

### Espaçamento
```
2px  4px  8px  12px  16px  20px  24px  32px
xxs   xs   sm   md    lg    xl   xxl  xxxl
```

### Raios
```
8px  12px  14px  16px  20px  9999px
sm    md    lg    xl   xxl    pill
```

### Sombras
```
sm  0 1px 2px rgba(0,0,0,0.05)
md  0 2px 8px rgba(0,0,0,0.1)
lg  0 4px 16px rgba(0,0,0,0.15)
xl  0 8px 32px rgba(0,0,0,0.2)
```

### Tipografia
```
34px bold    large-title
28px bold    title1
22px bold    title2
20px semi    title3
17px semi    headline
17px regular body
15px regular subheadline
13px regular footnote
12px regular caption1
11px regular caption2
```

---

## AI Agent

Este Design System inclui **System Prompts** para transformar uma IA em gerador de UI.

### Como usar

1. Copie `SYSTEM_PROMPT_UNIVERSAL.md`
2. Cole como System Prompt no Cursor, Claude Projects ou Custom GPT
3. Pergunte: "Crie uma tela de login"
4. O agente gera o código usando seu Design System

### Prompts Disponíveis

| Arquivo | Stack |
|---------|-------|
| `SYSTEM_PROMPT_UNIVERSAL.md` | TODAS as stacks |
| `SYSTEM_PROMPT_SWIFTUI.md` | Apenas SwiftUI |
| `SYSTEM_PROMPT_REACT.md` | Apenas React |

---

## Arquitetura

```
AppleDesignSystem/
├── Sources/                 # SwiftUI (iOS/macOS)
│   ├── Tokens/              # Cores, Tipografia, Espaçamento, Animações
│   ├── Modifiers/           # ViewModifiers
│   └── Components/          # 20+ componentes SwiftUI
├── React/                   # React/JSX
│   ├── AppleDesignSystem.css
│   ├── AppleComponents.css
│   ├── HapticButton.jsx
│   └── AppleComponents.jsx
├── Vue/                     # Vue.js
│   ├── HapticButton.vue
│   ├── AppleWidget.vue
│   └── ...
├── Angular/                 # Angular
│   ├── haptic-button.component.ts
│   ├── widget.component.ts
│   └── input.component.ts
├── Svelte/                  # Svelte
│   ├── HapticButton.svelte
│   ├── AppleWidget.svelte
│   └── ...
├── Vanilla/                 # HTML/CSS
│   └── index.html
├── Examples/                # Exemplos SwiftUI
├── Demo/                    # App demo SwiftUI
├── Tests/                   # Testes unitários
├── Resources/               # tokens.json
├── SYSTEM_PROMPT_*.md       # Prompts de AI Agent
├── Package.swift            # Manifesto SPM
├── LICENSE                  # Licença MIT
└── README.md                # Este arquivo
```

---

## Contribuindo

1. **Fork** o repositório
2. **Crie** sua branch de feature:
   ```bash
   git checkout -b feature/nova-feature
   ```
3. **Commit** suas mudanças:
   ```bash
   git commit -m 'feat: adicionar nova feature'
   ```
4. **Push** para a branch:
   ```bash
   git push origin feature/nova-feature
   ```
5. **Abra** um Pull Request

---

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

<div align="center">

### Feito com paixão pelo ecossistema Apple

**Funciona em SwiftUI • React • Vue • Angular • Svelte • HTML/CSS**

**Funciona em Windows • Linux • macOS • iOS • watchOS • visionOS**

[⬆ Voltar ao Topo](#appledesignsystem)

</div>
