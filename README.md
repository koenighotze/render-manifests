# Kubernetes manifest render

[![CircleCI](https://circleci.com/gh/koenighotze/render-manifests/tree/master.svg?style=svg)](https://circleci.com/gh/koenighotze/render-manifests/tree/master)

This Docker image can be used as part of a build to render the manifests from `./deployment` to `./rendered`. It basically wraps [envsubst](https://linux.die.net/man/1/envsubst) in a reusable fashion.

## Usage

In case you use Google Cloudbuild, you basically add a step like this

```yaml
- name: 'eu.gcr.io/${PROJECT_ID}/build-support/render:1.0'
  env:
    - 'DEBUG=debug'
  id: render
  waitFor:
    - docker-push
```

This step will read all files in `./deployment` replace all variables with their corresponding values form the environment and dump the resulting files in `./rendered` (i.e. apply `envsubst`).

The `DEBUG` environment variable leads to output of the values that are replaced in this step.


