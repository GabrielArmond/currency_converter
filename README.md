# Conversor de Moedas

Um aplicativo de conversão de moedas desenvolvido em Flutter que permite realizar conversões rápidas e precisas entre diferentes moedas internacionais.

## 📋 Sobre o Projeto

O **Currency Converter** é uma aplicação móvel multiplataforma que possibilita aos usuários converterem valores entre as principais moedas do mundo. Com uma interface intuitiva e moderna, o app oferece conversões em tempo real entre Real (BRL), Dólar (USD), Euro (EUR) e Bitcoin (BTC).

## 🎯 Funcionalidades

- ✅ Conversão entre Real, Dólar, Euro e Bitcoin
- ✅ Interface moderna com tema escuro
- ✅ Campos de entrada intuitivos para valores
- ✅ Botão de conversão dedicado
- ✅ Suporte multiplataforma (Android, iOS, Web, Desktop)
- ✅ Design responsivo e adaptável

## 🚀 Tecnologias Utilizadas

### Framework e Linguagem
- **Flutter 3.x** - Framework UI multiplataforma do Google
- **Dart 3.x** - Linguagem de programação moderna e orientada a objetos

### Arquitetura
- **Padrão MVC** - Model-View-Controller para organização do código
- **Widgets Stateful** - Para gerenciamento de estado da interface
- **Material Design** - Sistema de design do Google para UI consistente

### Estrutura do Projeto
```
lib/
├── main.dart                    # Ponto de entrada da aplicação
├── app/
│   ├── views/                   # Telas da aplicação
│   │   └── home_view.dart      # Tela principal do conversor
│   ├── controllers/            # Lógica de negócio
│   │   └── home_controller.dart
│   ├── models/                 # Modelos de dados
│   │   └── currency_model.dart # Modelo das moedas
│   └── components/             # Componentes reutilizáveis
│       └── currency_box.dart   # Widget de seleção de moeda
```

## 📱 Como Usar

1. **Instalação das dependências**: Execute `flutter pub get`
2. **Execução**: Use `flutter run` para iniciar o app
3. **Conversão**: 
   - Selecione a moeda de origem no campo superior
   - Digite o valor a ser convertido
   - Selecione a moeda de destino no campo inferior
   - Toque em "CONVERTER" para obter o resultado

## 📈 Cotações Suportadas

- **Real Brasileiro (BRL)**
- **Dólar Americano (USD)**  
- **Euro (EUR)**
- **Bitcoin (BTC)**

> **Nota**: As cotações utilizadas são valores fixos para demonstração. Em uma versão de produção, seria recomendado integrar com APIs de cotação em tempo real.

## 🛠️ Desenvolvimento

### Pré-requisitos
- Flutter SDK 3.12+ 
- Dart SDK 3.x
- Android Studio / VS Code
- Emulador Android / iOS ou dispositivo físico

### Comandos úteis
```bash
# Instalar dependências
flutter pub get

# Executar em modo debug
flutter run

# Build para produção
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web
```

## 📄 Licença

Este é um projeto de demonstração desenvolvido para fins educacionais e de aprendizado do framework Flutter.
