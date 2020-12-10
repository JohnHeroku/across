Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@JohnHeroku 
Learn Git and GitHub without any code!
Using the Hello World guide, you’ll start a branch, write comments, and open a pull request.


mixool
/
across
3
3563
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
across/dockershc/ura3y.sh
@mixool
mixool Rename vra3y.sh to ura3y.sh
Latest commit 8c36744 on 20 Oct
 History
 1 contributor
37 lines (36 sloc)  1.2 KB
  
#!/bin/sh
## 用于https://github.com/mixool/dockershc项目安装运行v2ray的脚本

if [[ ! -f "/workerone" ]]; then
    # install and rename
    wget -qO- https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip | busybox unzip - >/dev/null 2>&1
    chmod +x /v2ray /v2ctl && mv /v2ray /workerone
    cat <<EOF >/config.json
{
    "inbounds": 
    [
        {
            "port": "3000","listen": "0.0.0.0","protocol": "vmess",
            "settings": {"clients": [{"id": "3d48e6f3-a19e-4a69-b547-16040b9a63a3"}, "level": 1, "alterId": 64]},
            "streamSettings": {"network": "ws","wsSettings": {"path": "/ry"}}
        }
    ],
    "outbounds": 
    [
        {"protocol": "freedom","tag": "direct","settings": {}},
        {"protocol": "blackhole","tag": "blocked","settings": {}}
    ],
    "routing": 
    {
        "rules": 
        [
            {"type": "field","outboundTag": "blocked","ip": ["geoip:private"]},
            {"type": "field","outboundTag": "block","protocol": ["bittorrent"]},
            {"type": "field","outboundTag": "blocked","domain": ["geosite:category-ads-all"]}
        ]
    }
}
EOF
else
    # start 
    /workerone -config /config.json >/dev/null 2>&1
fi
© 2020 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
