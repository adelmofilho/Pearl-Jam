<p align="center"><img src="https://vignette.wikia.nocookie.net/jjba/images/4/49/PearlJam_KeyArt.png/revision/latest?cb=20160603183904" align="center" height=220/>
</p>

<h2 align="center">Pearl Jam</h2>

<p align="center">
<a href="http://www.repostatus.org/#active"><img alt="Project Status: Active – The project has reached a stable, usable state and is being actively developed." src="https://www.repostatus.org/badges/latest/active.svg"></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img alt="License" src="https://img.shields.io/badge/License-GPLv3-blue.svg"></a>

<br>

<h3 align="center">Estrutura de projetos de ciência de dados com a linguagem R</h3>

<br>

### Pré-requisitos

Instale o cookiecutter em sua máquina conforme [documentação oficial](https://cookiecutter.readthedocs.io/en/1.7.0/installation.html).

<br>

### Instalação

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

### Premissas

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

### Estrutura de diretórios

A instalação desse cookiecutter resultará no seguinte template:

```
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
│
└── tox.ini            <- tox file with settings for running tox; see tox.testrun.org
```
