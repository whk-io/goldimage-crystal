# [Crystal Language](https://crystal-lang.org/) : Gold Image

[Linted](https://github.com/hadolint/hadolint) and User Spaced Container Base Image

## Pull image

```docker pull goldimage/crystal:latest``` : current release

```docker pull goldimage/crystal:v0.34.0-1``` : specific release


## CVE Comparisons (Provided by [Trivy](https://github.com/aquasecurity/trivy))

goldimage/crystal:v0.34.0-1

Vulnerability Count: 133

TARGETS: 1 : LOW = 22 : MEDIUM = 86 : HIGH = 23 : CRITICAL = 2 : UNKNOWN = 0

COUNT:133

crystallang/crystal

Vulnerability Count: 464

TARGETS: 1 : LOW = 45 : MEDIUM = 359 : HIGH = 57 : CRITICAL = 3 : UNKNOWN = 0

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
      image: goldimage/crystal:v0.34.0-1

    steps:
    - uses: actions/checkout@v2
    - name: install libraries
      run: apt update -y && apt install -y [your libs here]
    - name: Install dependencies
      run: shards install
    - name: Run tests
      run: crystal spec
```
