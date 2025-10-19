# eFootball Network Optimization on Mikrotik

# Assuming the target PC/Console IP is 192.168.0.100 with network range of 192.168.0.1-254 and bandwidth of 30mbps/10mbps
# With ether1 as WAN and ether2 as LAN

# Create Mangle for eFootball Traffic
/ip firewall mangle
add action=mark-connection chain=prerouting comment="MARK CONN KONAMI - TCP" \
    connection-state=new dst-port=30000-35000 new-connection-mark=konami_conn \
    passthrough=yes protocol=tcp src-address=192.168.0.100
add action=mark-connection chain=prerouting comment="MARK CONN KONAMI - UDP" \
    connection-state=new dst-port=30000-35000 new-connection-mark=konami_conn \
    passthrough=yes protocol=udp src-address=192.168.0.100
add action=mark-packet chain=prerouting comment="MARK PACKET PRIO - KONAMI" \
    connection-mark=konami_conn new-packet-mark=prio passthrough=yes

# Add Simple Queue for eFootball Traffic and Other
/queue simple
add limit-at=3M/3M max-limit=5M/5M name=KONAMI packet-marks=prio priority=1/1 \
    queue=pcq-upload-default/pcq-download-default target=\
    192.168.0.100/32
add limit-at=5M/25M max-limit=7M/27M name=OTHER packet-marks=prio priority=8/8 \
    queue=pcq-upload-default/pcq-download-default target=\
    192.168.0.0/24

# Optional blacklist if you want to block specific server IP
/ip firewall address-list
add address=34.87.0.0/16 list=konami-sg
add address=34.92.0.0/16 list=konami-hk
add address=34.64.0.0/16 list=konami-kr
add address=34.22.0.0/16 list=konami-kr
add address=34.143.0.0/16 list=konami-sg
add address=34.142.0.0/16 list=konami-sg
add address=34.128.0.0/16 list=konami-id
add address=34.126.0.0/16 list=konami-sg
add address=34.124.0.0/16 list=konami-sg
add address=34.101.0.0/16 list=konami-id
add address=35.185.0.0/16 list=konami-sg
add address=35.186.0.0/16 list=konami-sg
add address=35.198.0.0/16 list=konami-sg
add address=35.240.0.0/16 list=konami-sg
add address=35.247.0.0/16 list=konami-sg
add address=35.221.0.0/16 list=konami-jp
add address=34.85.0.0/16 list=konami-jp
add address=34.97.0.0/16 list=konami-jp
add address=34.96.0.0/16 list=konami-hk
add address=34.129.0.0/16 list=konami-au
add address=35.197.0.0/16 list=konami-sg
add address=34.80.0.0/16 list=konami-tw
add address=34.81.0.0/16 list=konami-tw
add address=35.220.0.0/16 list=konami-hk
add address=35.187.0.0/16 list=konami-sg
add address=35.229.0.0/16 list=konami-tw
add address=34.146.0.0/16 list=konami-jp
add address=35.201.0.0/16 list=konami-tw
add address=34.131.0.0/16 list=konami-in
add address=34.150.0.0/16 list=konami-hk
add address=35.241.0.0/16 list=konami-hk
add address=34.93.0.0/16 list=konami-in
add address=35.200.0.0/16 list=konami-in
add address=35.243.0.0/16 list=konami-jp
add address=34.84.0.0/16 list=konami-jp
add address=35.189.0.0/16 list=konami-jp
add address=172.27.100.17 list=packet_limit
add address=35.194.0.0/16 list=konami-jp
add address=35.185.0.0/16 list=konami-tw
add address=104.198.0.0/16 list=konami-jp
add address=34.82.0.0/16 list=konami-us
add address=35.221.0.0/16 list=konami-us
add address=34.150.0.0/16 list=konami-us
add address=34.126.0.0/24 list=konami-sg
add address=35.236.0.0/16 list=konami-us
add address=34.125.0.0/16 list=konami-us
add address=34.116.0.0/16 list=konami-au
add address=34.106.0.0/16 list=konami-us
add address=35.246.0.0/16 list=konami-uk
add address=35.242.0.0/16 list=konami-uk
add address=34.118.0.0/16 list=konami-pl
add address=34.116.0.0/16 list=konami-pl
add address=35.190.0.0/16 list=konami-jp
add address=34.87.243.0/24 list=konami-au

# Block all konami servers from the adress-list except konami-sg
/ip firewall filter
add action=drop chain=forward comment="DROP KONAMI AU" dst-address-list=\
    konami-au
add action=drop chain=forward comment="DROP KONAMI HK" dst-address-list=\
    konami-hk
add action=drop chain=forward comment="DROP KONAMI JP" dst-address-list=\
    konami-jp
add action=drop chain=forward comment="DROP KONAMI KR" dst-address-list=\
    konami-kr
add action=drop chain=forward comment="DROP KONAMI TW" dst-address-list=\
    konami-tw
add action=drop chain=forward comment="DROP KONAMI IN" dst-address-list=\
    konami-in
add action=drop chain=forward comment="DROP KONAMI US" dst-address-list=\
    konami-us
add action=drop chain=forward comment="DROP KONAMI UK" dst-address-list=\
    konami-uk
add action=drop chain=forward comment="DROP KONAMI PL" dst-address-list=\
    konami-pl
add action=drop chain=forward comment="DROP KONAMI ID" dst-address-list=\
    konami-id

# Optional packet rate limiter for common traffic (e.g. youtube, browsing, download etc)
# Place this rule on top or so
# Always disable this if you're not playing eFootball or you can automate all of this using Home-Assistant
/ip firewall filter
add action=accept chain=forward comment="LIMIT RATE packet DOWNLOAD" \
    disabled=yes limit=400,5:packet out-interface=ether2 protocol=tcp \
    src-port=80,443
add action=drop chain=forward comment="LIMIT RATE packet DOWNLOAD" disabled=\
    yes out-interface=ether2 protocol=tcp src-port=80,443
