# https://grafana.com/blog/2024/04/24/how-to-use-the-grafana-operator-managing-a-grafana-cloud-stack-in-kubernetes/

helm upgrade -i --create-namespace -n grafana-operator grafana-operator oci://ghcr.io/grafana/helm-charts/grafana-operator --version v5.7.0 \
    --set isOpenShift=true \
    --set namespaceScope=true
    #--set namespaceOverride=grafana-operator 
    #--set nodeSelector="{node-role.kubernetes.io/infra}" 
