# Sorteado de nomes para Daily
*Este é um projeto simples feito em ShellScript com objetivo de facilitar a ordem de quem fala nas Dailys.* 

![Examplo do projeto em execução ](https://i.imgur.com/i4gTCpe.jpeg)

## Funcionalidades
**[1] Fazer sorteio**
 irá ler o arquivo participantes.txt e de forma randomica selecionar uma linha/nome, exibir o resultado em tela, remover o nome do arquivo participantes.txt e adicionar no arquivo processados.txt . 

**[2] Ver ultimo sorteado**
 irá ler o arquivo processados.txt e retornar o ultimo valor adicionado ao arquivo.|

**[3] Recomeçar Daily**
 irá substituir o arquivo processados.txt para participantes.txt  e vice versa. 

**[9] Sair**
 encerra o script.

## Arquivos 
**participantes.txt :** deve conter o nome dos participantes da daily linha a linha
**processados.txt :** contem os nomes já processados afim de exibir o ultimo processado e quando encerrar o sorteio poder restaurar os nomes para o arquivo **participantes.txt***
