#!/bin/bash

set -euo pipefail

sudo tee /etc/yum.repos.d/elasticsearch.repo >/dev/null <<'EOF'
[elasticsearch]
name=Elasticsearch repository for 9.x packages
baseurl=https://artifacts.elastic.co/packages/9.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
type=rpm-md
EOF

sudo tee /etc/yum.repos.d/kibana.repo >/dev/null <<'EOF'
[kibana-9.X]
name=Kibana repository for 9.x packages
baseurl=https://artifacts.elastic.co/packages/9.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

sudo tee /etc/yum.repos.d/logstash.repo >/dev/null <<'EOF'
[logstash-9.x]
name=Elastic repository for 9.x packages
baseurl=https://artifacts.elastic.co/packages/9.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

echo "Update des depots";

dnf update -y

echo "Installation de Elasticsearch n'oublier pas de noter le mot de passe elastic";

dnf install --enablerepo=elasticsearch elasticsearch