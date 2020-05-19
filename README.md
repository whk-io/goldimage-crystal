# [Crystal Language](https://crystal-lang.org/) : Gold Image

[Crystal Language](https://crystal-lang.org/) Linted and User Spaced Container Base Image

## Pull image

```docker pull goldimage/crystal:latest``` : current release

```docker pull goldimage/crystal:v0.34.0-1``` : specific release

```docker pull goldimage/crystal:v0.34.0-1-github``` : specific release with relaxed permissions for GitHub actions use

## Example Actions Pipeline

In file .github/workflows/crystal.yml

```yaml
name: Crystal CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:

  job1: 
    name: job
    runs-on: ubuntu-latest
    defaults:
      run:
        shell: bash
        working-directory: ./job

    container:
      image: goldimage/crystal:v0.34.0-1-github

    steps:
    - uses: actions/checkout@v2
    - name: install libraries
      run: apt update -y && apt install -y liblzma5 liblzma-dev
    - name: Install dependencies
      run: shards install
    - name: Run tests
      run: crystal spec
```
