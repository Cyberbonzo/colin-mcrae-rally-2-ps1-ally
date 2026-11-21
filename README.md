# Colin McRae Rally 2.0 Recompiled no ROG Ally

Esta configuração usa o port Linux x64 da edição de PlayStation americana, SLUS-01222. A versão testada no Bazzite é a 0.3.8. O inicializador usa OpenGL e passa ao jogo a pasta de cartões de memória `saves/`.

## Instalação

1. Baixe o [kit Linux x64 da versão 0.3.8](https://github.com/alexbeavs-ps1-ports/colin-mcrae-rally-2-0-recomp/releases/tag/v0.3.8). O SHA-256 do ZIP é `3241fcf2cad078b5195768638c573d66b5b6d8e4d4136e76c4c74c81bf4da733`.
2. Extraia o kit, coloque seu disco americano em BIN/CUE em `input-disc/` e a sua BIOS de varejo em `bios/SCPH1001.bin`. O inicializador espera o nome de CUE especificado no manifesto do projeto.
3. Gere e compile o jogo com o disco e a BIOS pelo assistente do kit. Use o backend SDL3 na compilação para Linux. O executável pronto fica em `build-release/`.
4. Coloque `jogar.sh` na raiz da instalação, torne-o executável com `chmod +x jogar.sh` e adicione-o como atalho na Steam.

## Atualização de uma instalação existente

Com o jogo fechado, guarde a instalação anterior e os cartões antes de gerar a nova versão. Conserve a pasta `saves/` inteira e o arquivo `build-release/input.ini` para manter os cartões e o mapeamento. Save states de versões anteriores podem ser incompatíveis. Em uma instalação migrada para a mesma pasta, o atalho existente continua válido.

## Replays

F12 inicia ou encerra a gravação. Em F7, use Tab para alternar entre save states e replays. As gravações armazenam os comandos do jogador. Gravar ou reproduzir usa o interpretador e pode reduzir o desempenho.
