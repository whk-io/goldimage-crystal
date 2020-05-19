# [Crystal Language](https://crystal-lang.org/) : Gold Image

[Crystal Language](https://crystal-lang.org/) Linted and User Spaced Container Base Image

## Pull image

```docker pull goldimage/crystal:latest``` : current release

```docker pull goldimage/crystal:v0.34.0-1``` : specific release

```docker pull goldimage/crystal:v0.34.0-1-github``` : specific release with relaxed permissions for GitHub actions use

## CVE Comparisons (Provided by [Trivy](https://github.com/aquasecurity/trivy))

goldimage/crystal:v0.34.0-1

Vulnerability Count: 125

TARGETS: LOW = 18 : MEDIUM = 82 : HIGH = 23 : CRITICAL = 2 : UNKNOWN = 0

COUNT:125

crystallang/crystal

Vulnerability Count: 464

TARGETS: LOW = 45 : MEDIUM = 359 : HIGH = 57 : CRITICAL = 3 : UNKNOWN = 0

COUNT:464

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
        working-directory: ./job # monorepo subfolder

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
