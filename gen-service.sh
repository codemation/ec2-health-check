#!/bin/bash

echo '#!/bin/bash' > /usr/local/bin/ec2-healthz
echo  $(which python3)' '$(pwd)"/webapp/server.py" >> /usr/local/bin/ec2-healthz
chmod +x /usr/local/bin/ec2-healthz

cat <<EOF | sudo tee /etc/systemd/system/ec2-healthcheck.service
[Unit]
Description=ec2-healthcheck
Documentation=https://github.com/codemation/ec2-health-check

[Service]
ExecStart=/usr/local/bin/ec2-healthz
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

#Start ec2-healthz service
{
  sudo systemctl daemon-reload
  sudo systemctl enable ec2-healthcheck
  sudo systemctl start ec2-healthcheck
}