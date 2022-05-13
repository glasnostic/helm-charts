![Glasnostic logo](https://avatars.githubusercontent.com/u/6260715?s=200&v=4)

# Glasnostic Helm Charts

[![License][license-img]][license]

[license-img]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[license]: https://github.com/glasnostic/helm-charts/blob/master/LICENSE

Glasnostic Platform Helm Charts on a [Kubernetes](https://kubernetes.io) cluster using the
[Helm](https://helm.sh) package manager.

## Charts

- [glasnosticd](https://github.com/glasnostic/helm-charts/tree/main/charts/glasnosticd): Glasnostic Kubernets Data Plane Helm chart

## Prerequisites

- Kubernetes 1.16+
- Helm 3.0+

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

Install specific helm chart. Make sure to create the `glasnostic-system` namespace before installing via Helm.

```sh
kubectl create namespace glasnostic-system
helm install glasnosticd glasnostic/glasnosticd \
    -n glasnostic-system
    --set networkKey="myNetworkKey"
    
helm status glasnosticd
```

## Uninstalling the Chart

To uninstall/delete the `glasnosticd` deployment:

```sh
helm delete glasnosticd
```

## Acknowledgements

The following people have contributed to Glasnostic Helm Charts:

- Maurice Faber (RedKubes)