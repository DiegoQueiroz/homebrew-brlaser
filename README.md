# homebrew-brlaser

Homebrew tap para o driver CUPS **brlaser**, empacotado a partir do fork ativo [Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser).

## O que é este tap

Este tap não mantém cópia do código-fonte do driver. Ele aponta diretamente para as releases do [Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser), então qualquer melhoria que entrar por lá chega aqui assim que o workflow de bump rodar.

## Histórico: por que o Owl-Maintain e não o original

O driver brlaser foi criado por [Peter De Wachter](https://github.com/pdewacht) em 2013, no repositório [pdewacht/brlaser](https://github.com/pdewacht/brlaser). Ele é o driver open-source CUPS para impressoras laser monocromáticas Brother (e alguns multifunções) que não falam PCL/PostScript padrão.

O repositório original está dormente: última atividade em agosto de 2023, última release oficial foi a **v6 de 2019**, e acumula 147 issues abertas. Não foi arquivado oficialmente, mas não recebe manutenção ativa.

O fork [Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser) é o que a comunidade adotou para continuar o projeto. Ele está ativo (último push em setembro de 2026), tem releases cadenciadas (v6.2.5 a v6.2.8), adicionou dezenas de modelos de impressora novos, e tem CI de macOS que valida os PPDs gerados com `cupstestppd`. Distribuições como Ubuntu e Void Linux já migraram para esse fork.

Este tap segue o mesmo caminho: instala o driver do fork ativo, não do original congelado.

## Instalação

### 1. Fazer o tap

```bash
brew tap DiegoQueiroz/brlaser
```

### 2. Confiar no tap

Como o tap não é oficial do Homebrew, é preciso autorizar o carregamento do cask uma vez:

```bash
brew trust --cask DiegoQueiroz/brlaser/brlaser
```

Sem esse passo, o Homebrew recusa o cask com o erro `Refusing to load cask ... from untrusted tap`.

### 3. Instalar

```bash
brew install --cask brlaser
```

A instalação:

- pede sua senha (necessária para gravar nos diretórios de sistema do CUPS);
- compila o driver a partir do tarball do Owl-Maintain;
- gera os arquivos PPD para as impressoras suportadas;
- reinstala o filtro em `/Library/Printers/brlaser/Filter`;
- reinicia o CUPS.

### 4. Adicionar a impressora

Abra **Ajustes do Sistema > Impressoras e Scanners**, clique em adicionar impressora e procure as entradas marcadas com `brlaser`.

## Atualização

O tap declara `livecheck` apontando para as releases do Owl-Maintain. Um workflow de GitHub Actions roda diariamente, detecta release nova e abre um PR de bump com `version` e `sha256` atualizados, já com auto-merge habilitado.

Para atualizar manualmente:

```bash
brew update
brew upgrade --cask brlaser
```

## Impressoras suportadas

Ver a lista completa no [README do Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser#supported-printers). O driver cobre impressoras laser monocromáticas Brother (DCP, HL, MFC, FAX) e alguns modelos de terceiros (Fuji Xerox, Lenovo).

## Desinstalar

```bash
brew uninstall --cask brlaser
```

Remove o filtro e os arquivos PPD, e reinicia o CUPS.

## Créditos

- Driver original: [Peter De Wachter](https://github.com/pdewacht) ([pdewacht/brlaser](https://github.com/pdewacht/brlaser))
- Fork ativo empacotado aqui: [Owl-Maintain/brlaser](https://github.com/Owl-Maintain/brlaser)
- Empacotamento Homebrew para macOS inspirado no tap [ws/homebrew-brlaser](https://github.com/ws/homebrew-brlaser)
