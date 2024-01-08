step-1
docker login ghcr.io -u ramesh2617 -p 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

step-2
docker tag ef41c7556778 ghcr.io/ramesh2617/devops/ramesh10654/myapp:1

step-3
docker push ghcr.io/ramesh2617/devops/ramesh10654/myapp:1

grfana install
docker run -d --name=grafana -p 3000:3000 grafana/grafana-enterprise

network create
docker network create monitoring

docker network connect monitoring grafana

prometheus install
docker run -d --name prometheus -p 9090:9090 --network monitoring prom/prometheus

node exporter install
docker run -d --name node-exporter --network monitoring -p 9100:9100 prom/node-exporter

Install Prometheus Pushgateway:
docker run -d -p 9091:9091 --name pushgateway prom/pushgateway

Install Google cAdvisor
docker run -d --name cadvisor --network=monitoring --privileged -p 8080:8080 -v /:/rootfs:ro -v /var/run:/var/run:rw -v /sys:/sys:ro -v /var/lib/docker/:/var/lib/docker:ro google/cadvisor:latest
==============================================================================================================================================================
docker run -d --name=grafana -p 3000:3000 --network monitoring  grafana/grafana-enterprise

docker run -d --name prometheus -p 9090:9090 --network monitoring prom/prometheus

docker run -d --name node-exporter --network monitoring -p 9100:9100 prom/node-exporter

docker run -d --name pushgateway --network monitoring -p 9091:9091 prom/pushgateway

docker run --network=monitoring --volume=/:/rootfs:ro --volume=/var/run:/var/run:ro --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --volume=/dev/disk/:/dev/disk:ro --publish=8000:8080 --detach=true --name=cadvisor gcr.io/cadvisor/cadvisor:v0.47.2


===================================================
15798
