<p align="center"><img src="https://vignette.wikia.nocookie.net/jjba/images/4/49/PearlJam_KeyArt.png/revision/latest?cb=20160603183904" align="center" height=220/>
</p>

<h2 align="center">Pearl Jam</h2>

<p align="center">
<a href="http://www.repostatus.org/#active"><img alt="Project Status: Active – The project has reached a stable, usable state and is being actively developed." src="https://www.repostatus.org/badges/latest/active.svg"></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img alt="License" src="https://img.shields.io/badge/License-GPLv3-blue.svg"></a>

<br>

<h3 align="center">Estrutura de projetos de ciência de dados com a linguagem R</h3>

Este [cookiecutter](https://cookiecutter.readthedocs.io/en/1.7.0/) tem como objetivo reunir melhores práticas para desenvolvimento de projetos de ciência de dados que utilizam a linguagem R.

<br>

### Pré-requisitos

Instale o cookiecutter em sua máquina conforme [documentação oficial](https://cookiecutter.readthedocs.io/en/1.7.0/installation.html)


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
