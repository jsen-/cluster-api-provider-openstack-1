apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: default
resources:
- ci-artifacts-source-template.yaml
patchesStrategicMerge:
- platform-kustomization.yaml
patchesJson6902:
- path: kubeadmcontrolplane-patch.yaml
  target:
    group: controlplane.cluster.x-k8s.io
    kind: KubeadmControlPlane
    name: "{{ .KubeadmControlPlaneName }}"
    version: v1alpha4
- path: kubeadmconfigtemplate-patch.yaml
  target:
    group: bootstrap.cluster.x-k8s.io
    kind: KubeadmConfigTemplate
    name: "{{ .KubeadmConfigTemplateName }}"
    version: v1alpha4
