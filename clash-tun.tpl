mixed-port: 7897
allow-lan: true
bind-address: '*'
mode: rule
log-level: info
unified-delay: true
tcp-concurrent: true
find-process-mode: always

hosts:
  api.xrlfreedom.top: 100.95.91.19
  rn-vless.proxy.zjoyapi.com: 23.254.220.162
  bao.infra.leyantech.com: 192.168.1.24

tun:
  enable: true
  stack: gvisor
  auto-route: true
  auto-detect-interface: true
  strict-route: false
  dns-hijack:
    - any:53
  inet4-route-exclude-address:
    - 10.0.0.0/8
    - 172.16.0.0/12
    - 192.168.0.0/16
    - 100.64.0.0/10

dns:
  enable: true
  ipv6: false
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  use-hosts: true
  default-nameserver:
    - 223.5.5.5
  proxy-server-nameserver:
    - https://223.5.5.5/dns-query
  direct-nameserver:
    - 223.5.5.5
    - 119.29.29.29
  nameserver:
    - https://dns.cloudflare.com/dns-query
  nameserver-policy:
    geosite:cn,private:
      - https://223.5.5.5/dns-query
      - https://120.53.53.53/dns-query
    +.zjoyapi.com:
      - https://223.5.5.5/dns-query
    +.tempfreeai.cc.cd:
      - https://223.5.5.5/dns-query
    +.leyantech.com:
      - https://223.5.5.5/dns-query
  fake-ip-filter:
    - geosite:private
    - geosite:cn
    - geosite:connectivity-check
    - +.zjoyapi.com
    - +.tempfreeai.cc.cd
    - +.leyantech.com
    - +.stun.*.*
    - +.stun.*.*.*
    - +.stun.*.*.*.*
