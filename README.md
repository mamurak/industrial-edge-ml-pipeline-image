# Runtime Image for ML Pipeline

Runtime image for ML pipeline in [Industrial Edge validated pattern](https://hybrid-cloud-patterns.io/industrial-edge/).

## Working with pipenv

This repo utilizes [pipenv](https://pipenv.pypa.io/en/latest/) to manage packages.

If you do not have pipenv on your local machine you can install it by running the following command:

```sh
pip install pipenv
```

### Adding new packages

To add a new package run the following command:

```sh
pipenv install <my-package>==<optional-version>
```

Pipenv will add the requested package to the Pipfile and update the dependency graph with the Pipefile.lock.

## Upgrading Packages

To upgrade packages in the dependecy graph run the following command:

```sh
pipenv update
```
