<div align="center">

# AppleDesignSystem

### O Design System Universal para o Ecossistema Apple

**Replicue a estética visual impressionante da Apple em QUALQUER plataforma**

![Swift](https://img.shields.io/badge/Swift-5.9+-F05138?style=for-the-badge&logo=swift)
![Plataformas](https://img.shields.io/badge/Plataformas-Windows%20|%20Linux%20|%20macOS%20|%20iOS%20|%20watchOS%20|%20visionOS-007AFF?style=for-the-badge)
![Licença](https://img.shields.io/badge/Licença-MIT-34C759?style=for-the-badge)
![SPM](https://img.shields.io/badge/SPM-Compatível-brightgreen?style=for-the-badge&logo=swift)

---

**12 Componentes • 5 Modificadores • 7 Sistemas de Tokens • Multiplataforma**

</div>

---

## Funciona em Todas as Plataformas

| Plataforma | Suportado | Observações |
|------------|:---------:|-------------|
| **Windows** | ✅ | Suporte completo via Swift for Windows |
| **Linux** | ✅ | Suporte completo via Swift for Linux |
| **macOS** | ✅ | Experiência nativa macOS |
| **iOS** | ✅ | iPhone e iPad |
| **watchOS** | ✅ | Apple Watch |
| **visionOS** | ✅ | Apple Vision Pro |

> **Nota:** O feedback háptico só está disponível no iOS/visionOS. Nas outras plataformas, os hápticos não fazem nada silenciosamente — seu aplicativo continua funcionando perfeitamente.

---

## Sumário

- [Funcionalidades](#funcionalidades)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Início Rápido](#início-rápido)
- [Design Tokens](#design-tokens)
- [Componentes](#componentes)
- [Modificadores](#modificadores)
- [Exemplos](#exemplos)
- [Arquitetura](#arquitetura)
- [Contribuindo](#contribuindo)
- [Licença](#licença)

---

## Funcionalidades

| Funcionalidade | Descrição |
|----------------|-----------|
| **Multiplataforma** | Funciona em Windows, Linux, macOS, iOS, watchOS, visionOS |
| **Design Tokens** | Cores semânticas, tipografia, espaçamento e parâmetros de animação |
| **Glassmorphism** | Materiais de desfoque nativos do iOS e efeito de vidro fosco |
| **Feedback Háptico** | Respostas táteis do sistema (apenas iOS/visionOS) |
| **Animações Spring** | Transições elásticas padrão Apple |
| **Biblioteca de Componentes** | 12+ componentes de UI prontos para produção |
| **Dynamic Type** | Suporte completo a acessibilidade |
| **Modo Escuro** | Alternância automática claro/escuro |
| **Zero Dependências** | SwiftUI puro, sem bibliotecas externas |

---

## Requisitos

| Dependência | Versão Mínima |
|-------------|---------------|
| Swift | 5.9+ |
| iOS | 17.0+ |
| macOS | 14.0+ |
| watchOS | 10.0+ |
| visionOS | 1.0+ |
| Windows | 10+ (Swift for Windows) |
| Linux | Ubuntu 20.04+ |

---

## Instalação

### Swift Package Manager (Recomendado)

1. Abra seu projeto no **Xcode** (ou qualquer IDE compatível com SPM)
2. Vá em **File → Add Package Dependencies...**
3. Cole a URL do repositório:
   ```
   https://github.com/anjggti-eng/AppleDesignSystem.git
   ```
4. Selecione **Up to Next Major Version** → **Add Package**
5. Selecione seu alvo e clique em **Add Package**

### Instalação Manual

1. Baixe ou clone o repositório:
   ```bash
   git clone https://github.com/anjggti-eng/AppleDesignSystem.git
   ```
2. Arraste a pasta `AppleDesignSystem` para seu projeto
3. Certifique-se de que **"Copy items if needed"** está selecionado
4. Clique em **Finish**

---

## Início Rápido

```swift
import SwiftUI
import AppleDesignSystem

struct ContentView: View {
    var body: some View {
        VStack(spacing: DSSpacing.lg) {
            // Botão com feedback háptico
            DSButton("Continuar", style: .filled) {
                print("Toque!")
            }
            
            // Card com glassmorphism
            DSCard {
                Text("Olá Mundo")
                    .dsTextStyle(.headline)
            }
            
            // Avatar com iniciais
            DSAvatar(name: "João Silva", size: .lg)
        }
        .padding()
    }
}
```

---

## Design Tokens

### Cores

```swift
// Cores do Sistema (Se Adaptam ao Modo Escuro)
DSColor.System.blue
DSColor.System.green
DSColor.System.red
DSColor.System.orange
DSColor.System.yellow
DSColor.System.purple
DSColor.System.pink
DSColor.System.teal
DSColor.System.indigo

// Cores Semânticas
DSColor.Background.primary
DSColor.Background.secondary
DSColor.Background.tertiary

DSColor.Label.primary
DSColor.Label.secondary
DSColor.Label.tertiary

DSColor.Fill.primary
DSColor.Fill.secondary
DSColor.Fill.tertiary

// Cor Hex Customizada
Color(hex: "#FF5733")
```

### Tipografia

```swift
// Baseado em Estilo (Recomendado)
Text("Título Grande").dsTextStyle(.largeTitle)
Text("Título 1").dsTextStyle(.title1)
Text("Título 2").dsTextStyle(.title2)
Text("Título 3").dsTextStyle(.title3)
Text("Manchete").dsTextStyle(.headline)
Text("Corpo").dsTextStyle(.body)
Text("Chamada").dsTextStyle(.callout)
Text("Subtítulo").dsTextStyle(.subheadline)
Text("Rodapé").dsTextStyle(.footnote)
Text("Legenda").dsTextStyle(.caption)

// Acesso Direto à Fonte
DSTypography.largeTitle
DSTypography.body
DSTypography.rounded(.title2, weight: .bold)
```

### Espaçamento

```swift
// Tokens de Espaçamento
DSSpacing.xxs  // 2pt
DSSpacing.xs   // 4pt
DSSpacing.sm   // 8pt
DSSpacing.md   // 12pt
DSSpacing.lg   // 16pt
DSSpacing.xl   // 20pt
DSSpacing.xxl  // 24pt
DSSpacing.xxxl // 32pt

// Tokens de Raio
DSRadius.sm   // 8pt
DSRadius.md   // 12pt
DSRadius.lg   // 14pt
DSRadius.xl   // 16pt
DSRadius.xxl  // 20pt
DSRadius.pill // Formato cápsula
```

### Animações

```swift
// Animações Spring (Padrão Apple)
DSAnimation.Spring.default   // response: 0.35, damping: 0.7
DSAnimation.Spring.snappy    // response: 0.25, damping: 0.8
DSAnimation.Spring.bouncy    // response: 0.50, damping: 0.6
DSAnimation.Spring.gentle    // response: 0.45, damping: 0.85

// Baseadas em Duração
DSAnimation.easeIn
DSAnimation.easeOut
DSAnimation.easeInOut

// Uso
.animation(DSAnimation.Spring.default, value: true)
```

### Sombras

```swift
// Estilos de Sombra
DSShadow.sm  // y=1, blur=2, opacidade=0.05
DSShadow.md  // y=2, blur=8, opacidade=0.10
DSShadow.lg  // y=4, blur=16, opacidade=0.15
DSShadow.xl  // y=8, blur=32, opacidade=0.20

// Uso
.dsShadow(DSShadow.md)
```

### Materiais

```swift
// Materiais Glassmorphism
DSMaterial.ultraThin
DSMaterial.thin
DSMaterial.regular
DSMaterial.thick
DSMaterial.ultraThick

// Uso
.background(DSMaterial.regular)
```

### Hápticos

```swift
// Feedback de Impacto
DSHaptics.impact(.light)
DSHaptics.impact(.medium)
DSHaptics.impact(.heavy)

// Feedback de Notificação
DSHaptics.notification(.success)
DSHaptics.notification(.warning)
DSHaptics.notification(.error)

// Padrões Predefinidos
DSHaptics.buttonTap()
DSHaptics.toggleSwitch()
DSHaptics.success()
```

---

## Componentes

### DSButton

```swift
// Estilos
DSButton("Preenchido", style: .filled) { }
DSButton("Com Borda", style: .bordered) { }
DSButton("Simples", style: .plain) { }
DSButton("Vidro", style: .glass) { }
DSButton("Excluir", style: .destructive) { }

// Com Ícone
DSButton("Entrar", icon: Image(systemName: "arrow.right")) { }

// Estado de Carregamento
DSButton("Carregando...", isLoading: true) { }
```

### DSCard

```swift
// Card Básico
DSCard {
    Text("Conteúdo do Card")
}

// Card com Cabeçalho
DSCardWithHeader(
    header: { Text("Configurações") }
) {
    VStack(alignment: .leading, spacing: 12) {
        Text("Opção 1")
        Text("Opção 2")
    }
}
```

### DSTextField

```swift
// Campo Básico
DSTextField("Digite aqui", text: $texto)

// Com Título e Ícone
DSTextField("Email", text: $email, title: "Endereço de Email", icon: Image(systemName: "envelope"))

// Barra de Pesquisa
DSSearchBar("Pesquisar...", text: $pesquisa)
```

### DSBadge

```swift
// Badge Preenchido
DSBadge("Novo")
DSBadge("Ativo", color: .green)

// Badge Com Borda
DSBadge("Pendente", style: .outlined, color: .orange)

// Badge de Contagem
DSCountBadge(count: 5)
```

### DSAvatar

```swift
// Tamanhos de Avatar
DSAvatar(name: "João Silva", size: .sm)
DSAvatar(name: "João Silva", size: .md)
DSAvatar(name: "João Silva", size: .lg)

// Grupo de Avatares
DSAvatarGroup(names: ["João", "Maria", "Pedro"], size: .md, maxVisible: 3)
```

### DSToggle

```swift
// Toggle Básico
DSToggle("Modo Escuro", isOn: $modoEscuro)

// Toggle Card
DSToggleCard(
    title: "Wi-Fi",
    subtitle: "Rede Doméstica",
    icon: Image(systemName: "wifi"),
    isOn: $wifiAtivado
)
```

### DSSlider

```swift
// Slider Básico
DSSlider("Volume", value: $volume)

// Stepper
DSStepper("Quantidade", value: $quantidade, in: 1...10)
```

### DSList

```swift
DSSection(header: { Text("GERAL") }) {
    DSListRowSimple("Wi-Fi", icon: Image(systemName: "wifi"))
    DSListRowSimple("Bluetooth", icon: Image(systemName: "antenna.radiowaves.left.and.right"))
}
```

### DSProgressView

```swift
// Linear
DSProgressView(value: 65, label: "Progresso do Upload")

// Circular
DSProgressView(value: 30, style: .circular)

// Segmentado
DSProgressView(value: 60, style: .segmented(5))
```

### DSAlert

```swift
@State private var mostrarAlerta = false

.dsAlert(
    type: .success,
    title: "Sucesso!",
    message: "Alterações salvas.",
    isPresented: $mostrarAlerta
)
```

### DSSheet

```swift
@State private var mostrarSheet = false

.dsSheet(title: "Opções", isPresented: $mostrarSheet) {
    Text("Conteúdo do Sheet")
}
```

### DSLoadingIndicator

```swift
DSLoadingIndicator(style: .spinner)
DSLoadingIndicator(style: .dots)
DSLoadingIndicator(style: .pulse)
DSLoadingIndicator(style: .progress)
```

---

## Modificadores

```swift
// Estilo Card
.dsCard()

// Pressionável com Hápticos
.dsPressable()

// Glassmorphism
.dsGlass()

// Shimmer de Carregamento
.dsShimmer()

// Hierarquia de Texto
.dsTextStyle(.headline)

// Sombra Customizada
.dsShadow(DSShadow.lg)
```

---

## Arquitetura

```
AppleDesignSystem/
├── Sources/AppleDesignSystem/
│   ├── Tokens/                    # Design tokens
│   │   ├── DSTokens.swift         # Cores (multiplataforma)
│   │   ├── DSTypography.swift     # Fontes
│   │   ├── DSSpacing.swift        # Espaçamento e Raio
│   │   ├── DSAnimation.swift      # Animações
│   │   ├── DSShadow.swift         # Sombras
│   │   ├── DSMaterial.swift       # Glassmorphism
│   │   └── DSHaptics.swift        # Feedback háptico (multiplataforma)
│   ├── Modifiers/                 # ViewModifiers
│   │   ├── DSCardModifier.swift
│   │   ├── DSPressableModifier.swift
│   │   ├── DSTextModifier.swift
│   │   ├── DSGlassModifier.swift
│   │   └── DSShimmerModifier.swift
│   └── Components/                # Componentes UI
│       ├── DSButton.swift
│       ├── DSCard.swift
│       ├── DSTextField.swift
│       ├── DSBadge.swift
│       ├── DSAvatar.swift
│       ├── DSToggle.swift
│       ├── DSSlider.swift
│       ├── DSList.swift
│       ├── DSProgressView.swift
│       ├── DSAlert.swift
│       ├── DSSheet.swift
│       └── DSLoadingIndicator.swift
├── Examples/                      # Telas de exemplo
├── Tests/                         # Testes unitários
├── Package.swift                  # Manifesto SPM
├── LICENSE                        # Licença MIT
└── README.md                      # Este arquivo
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

**Funciona em Windows • Linux • macOS • iOS • watchOS • visionOS**

[⬆ Voltar ao Topo](#appledesignsystem)

</div>
