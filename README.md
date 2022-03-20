![Glasnostic logo](https://avatars.githubusercontent.com/u/6260715?s=200&v=4)

# Glasnostic Charts

[![License][license-img]][license]

[license-img]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[license]: https://github.com/glasnostic/helm-charts/blob/master/LICENSE

Glasnostic Platform Helm Charts on a [Kubernetes](https://kubernetes.io) cluster using the
[Helm](https://helm.sh) package manager.

## Charts

- [glasnosticd](https://github.com/glasnostic/helm-charts/tree/main/stable/glasnosticd): Glasnostic Kubernets Data Plane Helm chart

## Prerequisites

- Kubernetes 1.16+
- Helm 3.0+

### Installing [Helm](https://helm.sh)

```sh
curl -L https://git.io/get_helm.sh | bash
helm init
```

## Installing Glasnostic Helm Repository

Add the Glasnostic repository to Helm:

```sh
helm repo add glasnostic https://glasnostic.github.io/helm-charts/
```

## Installing the Chart

Search all the repositories available

```sh
helm search repo glasnostic -l
```

Install specific helm chart

```sh
helm install glasnosticd stable/glasnosticd
helm status glasnosticd
```

## Uninstalling the Chart

To uninstall/delete the `glasnosticd` deployment:

```sh
helm delete glasnosticd
```
