# Bíblia Ave Maria Católica

Um aplicativo Flutter completo para leitura e estudo da Bíblia Sagrada (versão Ave Maria), 100% offline, leve e com uma interface moderna, serena e minimalista.

## ✝️ Características

- **100% Offline**: Funciona sem conexão com a internet
- **Interface Moderna**: Design limpo e inspirador
- **Leitura em Voz Alta**: Text-to-Speech integrado
- **Busca Avançada**: Encontre versículos e palavras instantaneamente
- **Favoritos e Destaques**: Marque versículos importantes
- **Planos de Leitura**: Estruturas espirituais pré-definidas
- **Reflexões Diárias**: Mensagens inspiradoras diárias
- **Modo Escuro/Claro**: Adapta-se ao seu gosto
- **Monetização Ética**: AdMob e versão premium

## 🏗️ Arquitetura

O aplicativo segue os princípios da **Clean Architecture** e **Atomic Design**:

```
lib/
├── core/                 # Configurações e utilitários
│   ├── constants/        # Constantes da aplicação
│   ├── theme/           # Temas claro e escuro
│   └── di/              # Injeção de dependências
├── data/                # Camada de dados
│   ├── models/          # Modelos de dados
│   └── repositories/    # Repositórios de dados
├── domain/              # Camada de domínio
│   ├── entities/        # Entidades de negócio
│   └── usecases/        # Casos de uso
├── presentation/        # Camada de apresentação
│   ├── atoms/           # Componentes básicos
│   ├── molecules/       # Componentes compostos
│   ├── organisms/       # Componentes complexos
│   ├── templates/       # Templates de layout
│   └── screens/         # Telas da aplicação
└── bloc/               # Gerenciamento de estado
    ├── bible_bloc/     # Estado da Bíblia
    ├── favorites_bloc/ # Estado dos favoritos
    ├── theme_bloc/     # Estado do tema
    └── tts_bloc/       # Estado do TTS
```

## 🚀 Funcionalidades

### 📖 Leitura da Bíblia
- Navegação fluida por livros, capítulos e versículos
- Interface otimizada para leitura
- Controles de navegação intuitivos
- Suporte completo ao Antigo e Novo Testamento

### 🔍 Busca Inteligente
- Busca instantânea por palavras ou frases
- Resultados organizados por relevância
- Funciona totalmente offline
- Histórico de buscas

### ❤️ Favoritos e Destaques
- Marque versículos como favoritos
- Sistema de destaques coloridos
- Organização por categorias
- Sincronização local

### 📅 Planos de Leitura
- Planos pré-definidos:
  - "Caminho da Fé" (7 dias)
  - "Evangelhos em 15 dias"
  - "Sabedoria e Paz" (30 dias)
- Acompanhamento de progresso
- Notificações de lembretes

### 💭 Reflexões Diárias
- Mensagens inspiradoras diárias
- Versículos selecionados cuidadosamente
- Comentários espirituais
- Compartilhamento fácil

### 🎨 Personalização
- Modo claro e escuro
- Ajuste de tamanho da fonte
- Escolha de fonte (Merriweather, Noto Serif)
- Configurações de TTS

### 🔊 Leitura em Voz Alta
- Text-to-Speech integrado
- Controle de velocidade
- Pausa e retomada
- Voz natural em português

## 💰 Monetização

### Google AdMob
- Banners discretos nas telas secundárias
- Interstitials leves ao trocar de testamento
- Anúncios não intrusivos

### Versão Premium (R$ 14,90)
- Remove todos os anúncios
- Favoritos ilimitados
- Modo de leitura sem distrações
- Recursos exclusivos

## 🛠️ Tecnologias

- **Flutter**: Framework principal
- **Dart**: Linguagem de programação
- **Bloc**: Gerenciamento de estado
- **GetIt**: Injeção de dependências
- **Hive**: Armazenamento local
- **Google Fonts**: Tipografia
- **Flutter TTS**: Leitura em voz alta
- **Google AdMob**: Monetização
- **In-App Purchase**: Compras na loja

## 📱 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/biblia-ave-maria-catolica.git
cd biblia-ave-maria-catolica
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Gere os arquivos necessários:
```bash
flutter packages pub run build_runner build
```

4. Execute o aplicativo:
```bash
flutter run
```

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🤝 Contribuição

Contribuições são bem-vindas! Por favor, leia as diretrizes de contribuição antes de enviar um pull request.

## 📞 Suporte

Para suporte ou dúvidas, entre em contato através do email: suporte@bibliaavemaria.com

---

**Desenvolvido com ❤️ para a comunidade católica**