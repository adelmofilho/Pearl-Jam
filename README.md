<p align="center"><img src="https://vignette.wikia.nocookie.net/jjba/images/4/49/PearlJam_KeyArt.png/revision/latest?cb=20160603183904" align="center" height=220/>
</p>

<h2 align="center">Pearl Jam</h2>

<p align="center">
<a href="http://www.repostatus.org/#active"><img alt="Project Status: Active – The project has reached a stable, usable state and is being actively developed." src="https://www.repostatus.org/badges/latest/active.svg"></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img alt="License" src="https://img.shields.io/badge/License-GPLv3-blue.svg"></a>

<br>

<h3 align="center">Estrutura de projetos de ciência de dados com a linguagem R</h3>

<br>

## Pré-requisitos

- Instale o `git` conforme [documentação oficial](https://git-scm.com/downloads).

- Instale o `cookiecutter` em sua máquina conforme [documentação oficial](https://cookiecutter.readthedocs.io/en/1.7.0/installation.html).

### Opcional

- Instale o `docker` e `docker compose` conforme [documentação oficial](https://docs.docker.com/compose/install/)

- Instale o `DVC` (Data Version Controle) pelo [site oficial](https://dvc.org/)

<br>

## Instalação

Para iniciar um novo projeto com este template, execute:

```sh
cookiecutter gh:adelmofilho/Pearl-Jam
```

Ou, use uma das seguintes alternativas:

```sh
cookiecutter https://github.com/adelmofilho/Pearl-Jam.git

cookiecutter git+ssh://git@github.com/adelmofilho/Pearl-Jam.git
```
<br>

## Proposta

A proposta desse template cookiecutter é de atender projetos de ciência de dados que envolvam a criação e experimentação de modelos estatisticos e de machine learning com R.

Para isso, é fornecida uma imagem docker que encapsula todo o ambiente de desenvolvimento do projeto e ferramentas para versionar pacotes e dados.

É esperado que o processo de modelagem, seja acompanhado da construção de um pacote R que encapsule as funções referentes a treinamento, *data preparation* e avaliação do modelo. Desta forma, é possível desenvolver o código seguindo boas práticas de programação: testes unitários, ajuste de estilo e forma.

Finalmente, para fins de experimentação ou produtização, as funções nesse pacote R poderão ser estruturadas na forma de um workflow *schedulavel*.

<br>

## Premissas

A estrutura de diretórios e arquivos criados na execução deste cookiecutter possui as seguintes premissas:

- [x] Uso de controle de versão de código com git
- [x] Controle de versão de pacotes R via pacote[`{renv}`](https://rstudio.github.io/renv/articles/renv.html)
- [x] Encapsulamento de funções e códigos como um pacote R via pacote [`{usethis}`](https://usethis.r-lib.org/)
- [x] Criação de testes unitários via [`{testhat}`](https://testthat.r-lib.org/)
- [x] Documentação via pacote [`{roxygen2}`](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html)
- [x] Uso de pipelines para garantir reproduzibilidade das análises via pacote [`{drake}`](https://docs.ropensci.org/drake/)
- [x] Versionamento de dados via software [`dvc`](https://dvc.org/)
- [x] Ajuste de forma e estilo de código via pacote [`lintR`](https://github.com/jimhester/lintr)
- [x] Containerização da solução criada através de imagem `docker`

<br>

## Estrutura de diretórios

A instalação desse cookiecutter resultará no seguinte template:

```
.
├── artifacts
├── data
│   ├── raw
│   ├── interim
│   └── processed
├── docs
├── man
├── R
├── scripts
├── renv
│   ├── library
│   ├── staging
│   ├── activate.R
│   └── settings.dcf
├── tests
│   ├── testthat
│   └── testthat.R
├── workflow
├── {project_name}.Rproj
├── DESCRIPTION
├── docker-compose.yml
├── Dockerfile
├── NAMESPACE
└── renv.lock
```

`artifacts` deve conter arquivos serializados (`.rds`, `.Rdata`), chaves de acesso (`.pub`, `.oath`), mapas (`.shp`) e outros tipos de arquivos não relacionados a códigos e dados.

`data` deve conter base dados (`.csv`, `.parquet`, `.png`). A divisão em `raw`, `interim`, `processed` se refere ao grau de trabalho, qualidade dos dados.

`docs` está associado a textos, notas, papers, apresentações utéis no contexto do projeto sendo executado.

`man` é o diretório que contém a documentação gerada de forma automática pelo `roxygen2`.

`R` contém funções do pacote R criado em conjunto com o projeto.

`scripts` contem scripts e notebooks R utilizados para experimentação e prototipação de funções que farão parte do pacote R.

`renv` é o diretório criado de forma automática para o versionamento dos pacotes R.

`tests` deve conter testes unitários para o pacote R conforme padrão do pacote `{testthat}`.

`workflow` contém as [dags](https://en.wikipedia.org/wiki/Directed_acyclic_graph) (pipelines) de código a partir do pacote `{drake}`.

### Arquivos

`{project_name}.Rproj` é o arquivo de configurações de projeto do Rstudio

`DESCRIPTION` é o arquivo de metadados do pacote R criado com esse projeto.

`Dockerfile` contém as instruções para criação de um container docker onde será desenvolvido o projeto.

`docker-compose.yml` contém as instruções para execução do container docker criado pelo arquivo DOckerfile.

`NAMESPACE` é o arquivo que define o namespace do pacote R criado com esse projeto.

`renv.lock` contém a versão dos pacotes utilizados nesse projeto.

<br>

## Baby Steps

### Executando o Cookiecutter

Execute o seguinte comando para iniciar a execução deste Cookiecutter.

```sh
cookiecutter gh:adelmofilho/Pearl-Jam
```

Você será questionado de forma interativa sobre alguns parâmetros e nomes para associar ao seu projeto:

`{project_slug}`: nome do projeto  
`{username}`: username do autor do projeto  
`{email}`: email do autor do projeto  
`{license}`: licensa a ser associada ao projeto (MIT ou GPL3)  

### Acessando o RStudio Server

Após instalar este template cookiecutter, acesse o diretório raiz do projeto e execute o seguinte comando.

```sh
docker-compose up -d
```

O *build* de uma imagem docker iniciará (may take some time, make a coffee :coffee:).

Após concluido a etapa de *build* acesse seu navegador com a seguinte url:

`localhost:8787`

A tela de login RStudio Server surgirá. Por padrão, acesse usando `rstudio` para ambos, login e senha.

### Iniciando seu projeto

No menu do RStudio Server, selecione os campos: `File > Open Project`.

Na caixa de diálogo que abrirá, entre com o caminho para o diretório de seu projeto, por padrão, `/{project_slug}`.

### Conecte seu projeto ao Github

Seu projeto por padrão já é um repositório git. Contudo, não está conectado ao Github. 

Para adicionar seu projeto a um repositório no Github, execute os seguintes comandos substituindo `{gituser}` pelo seu usuário no github e `{project_slug}` por aquele informado na criação do Cookiecutter.

```sh
git remote add origin git@github.com:{gituser}/{project_slug}.git
```

```sh
git push -u origin master
```