# Conversor de Moedas (Money Converter)

Um aplicativo de conversão de moedas desenvolvido em Flutter que permite realizar conversões **em tempo real** entre diferentes moedas internacionais usando cotações atualizadas.

## 📋 Sobre o Projeto

O **Money Converter** é uma aplicação móvel multiplataforma que possibilita aos usuários converterem valores entre as principais moedas do mundo com **cotações reais e atualizadas**. Com uma interface intuitiva e moderna, o app oferece conversões precisas entre Real (BRL), Dólar (USD), Euro (EUR), Bitcoin (BTC), Libra Esterlina (GBP) e Iene Japonês (JPY).

## 🎯 Funcionalidades

- ✅ **Conversões em tempo real** entre 6 moedas principais
- ✅ **Cotações atualizadas** via API externa
- ✅ Interface moderna com tema escuro
- ✅ Campo "DE" para entrada de valor e seleção de moeda origem
- ✅ Campo "PARA" para resultado da conversão (somente leitura)
- ✅ **Botão de troca** para inverter moedas rapidamente
- ✅ **Validação de entrada** com mensagens de erro
- ✅ **Indicador de loading** durante conversões
- ✅ Suporte multiplataforma (Android, iOS, Web, Desktop)
- ✅ Design responsivo e adaptável

## 🚀 Tecnologias Utilizadas

### Framework e Linguagem
- **Flutter 3.x** - Framework UI multiplataforma do Google
- **Dart 3.x** - Linguagem de programação moderna e orientada a objetos

### Packages e APIs
- **currency_converter 3.0.0** - Pacote para conversões de moeda em tempo real
- **http 1.6.0** - Para requisições HTTP
- **meta 1.18.0** - Anotações de metadados

### Arquitetura
- **Padrão MVC** - Model-View-Controller para organização do código
- **Service Layer** - Camada de serviço para integração com APIs externas
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
│   │   └── home_controller.dart # Controller com validações e estado
│   ├── models/                 # Modelos de dados
│   │   └── currency_model.dart # Modelo das moedas com códigos ISO
│   ├── api/                    # Camada de serviços
│   │   └── currency_converter.dart # Service para conversões reais
│   └── components/             # Componentes reutilizáveis
│       └── currency_box.dart   # Widget de seleção e entrada
```

## 📱 Como Usar

1. **Instalação das dependências**: Execute `flutter pub get`
2. **Execução**: Use `flutter run` para iniciar o app
3. **Conversão**: 
   - No campo **"DE"**: Selecione a moeda origem e digite o valor
   - No campo **"PARA"**: Selecione a moeda destino (resultado será exibido aqui)
   - Use o **botão de troca** (⇅) para inverter as moedas rapidamente
   - Toque em **"CONVERTER"** para obter a cotação atual
   - Aguarde o loading e veja o resultado atualizado

### 🔄 Funcionalidades Extras
- **Validação**: O app valida entradas vazias ou inválidas
- **Troca rápida**: Botão para inverter origem ↔ destino
- **Feedback visual**: Loading e mensagens de erro informativas

## 📈 Moedas Suportadas

| Moeda | Código | Símbolo | Região |
|-------|--------|---------|--------|
| **Real Brasileiro** | BRL | R$ | Brasil |
| **Dólar Americano** | USD | $ | Estados Unidos |
| **Euro** | EUR | € | União Europeia |
| **Bitcoin** | BTC | ₿ | Criptomoeda |
| **Libra Esterlina** | GBP | £ | Reino Unido |
| **Iene Japonês** | JPY | ¥ | Japão |

> **✨ Cotações em tempo real**: O app utiliza APIs externas para obter cotações atualizadas automaticamente, garantindo conversões precisas e confiáveis.

## 🛠️ Desenvolvimento

### Pré-requisitos
- Flutter SDK 3.12+ 
- Dart SDK 3.x
- Android Studio / VS Code
- **Conexão com internet** (para acessar APIs de cotação)
- Emulador Android / iOS ou dispositivo físico

### Dependências Principais
```yaml
dependencies:
  flutter:
    sdk: flutter
  currency_converter: ^3.0.0    # API de conversão de moedas
  http: ^1.6.0                   # Requisições HTTP
  cupertino_icons: ^1.0.8       # Ícones iOS
```

### Comandos úteis
```bash
# Instalar dependências
flutter pub get

# Executar em modo debug
flutter run

# Executar testes
flutter test

# Build para produção
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web
```

## 🧪 Testes

O projeto inclui testes unitários abrangentes:
- Validação de entrada
- Troca de moedas
- Configuração de estado
- Tratamento de erros

```bash
flutter test  # Executar todos os testes
```

## 📋 Versão Atual: 1.0.0

### ✨ Funcionalidades Implementadas
- [x] Conversões em tempo real com API externa
- [x] Interface otimizada com 6 moedas suportadas
- [x] Validações e tratamento de erros
- [x] Testes unitários completos
- [x] Botão de troca rápida de moedas

### 🚀 Próximas Versões
- [ ] Histórico de conversões
- [ ] Modo offline com cache
- [ ] Mais moedas internacionais 
- [ ] Gráficos de variação das cotações
- [ ] Personalização de temas
