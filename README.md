# Building xaringan slides with Snakemake

[![Build Status](https://travis-ci.org/lachlandeer/xaringan-snakemake.svg?branch=master)](https://travis-ci.org/lachlandeer/xaringan-snakemake)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-red.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![lifecycle](https://img.shields.io/badge/version-0.1-red.svg)]()

## TLDR:

1. Install R, Snakemake and xaringan.
2. Navigate to this project's directory and then run: `snakemake all --cores 1`
   * End result is a html and pdf presentation

## Introduction

Repository provides a template to build xaringan presentations to html and pdf using the Snakemake workflow management system.
I also manage R's package dependencies with `renv`.

## Motivating Example

I use the Rmarkdown file `slides.Rmd` which contains the slide template that you would get if you created a new xaringan presentation in RStudio.

## Installation Instructions

Follow these Steps to install the necessary software on your system

You need to have the following software and packages installed:

1. Python 3 (Python 3.6 or higher)
2. Snakemake (we'll install it in a couple of lines time!)
3. R (version 4.0.x)

### Installing Python

Either:

1. Install Anaconda Python:
    - We provide instructions on how to install anaconda python [here](https://pp4rs.github.io/2020-uzh-installation-guide/python/)
2. Install Python using the deadsnakes ppa (Debian/Ubuntu flavored):
    - Here's how to add the deadsnakes ppa and install Python 3.8
    ```bash
    $ sudo apt-get install software-properties-common
    $ sudo add-apt-repository ppa:deadsnakes/ppa
    $ sudo apt-get update
    $ sudo apt-get install python3.8
    ```

### Installing Snakemake

I have included a `requirements.txt` file that we can use to install a specific version of snakemake.
This makes sure that my example runs on your machine (or at least won't break because you use a different version of snakemake than I do)

``` bash
pip3 install -r requirements.txt
```

you may need to replace `pip3` with `pip`

### Installing `R`

We provide instructions on how to install R [here](https://pp4rs.github.io/2020-uzh-installation-guide/r)

### Installing `xaringan`

Either:

1. Install it using `install.packages('xaringan')` in the R console

2. Use our renv workflow:

Open a terminal and navigate to this directory.
Then in the terminal enter the following command to install renv:

``` bash
snakemake --cores 1 renv_install
```

Then you will need to provide consent for `renv` to be able to write files to your system:

``` bash
snakemake --cores 1 renv_consent
```

Once this is complete you can use renv to create a separate R environment that contains the packages we use in our example by entering the following command into the terminal:

``` bash
snakemake --cores 1 renv_init
```

The above command will initialize a separate R environment for this project.

Now we will install the necessary packages (and their precise versions) which are stored in the `renv.lock` file:

``` bash
snakemake --cores 1 renv_restore
```

This will install all the packages we need. It may take a while.

## Running the Example:

Navigate to this project's directory, and then run the following command in the terminal:

If you want html and pdf slides:

```bash
$ snakemake all --cores 1
```

If you only want the html presentation:

```bash
$ snakemake build_html --cores 1
```

To get the pdf (you need the html), so use `snakemake all --cores 1`

## Updates to Workflow Example

Major changes are tracked in the [NEWS file](./NEWS.md) with brief descriptions of the changes implemented.

## Comments / Suggestions / Issues

I'd love to hear your comments, suggestions or installation issues encountered when running the example.
[Post an issue on Github.](https://github.com/lachlandeer/xaringan-snakemake/issues)

## Suggested Citation

Deer, Lachlan. 2021. Building Xaringan Presentations with Snakemake.
url = "https://github.com/lachlandeer/xaringan-snakemake"
