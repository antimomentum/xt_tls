apt install -y linux-headers-$(uname -r)
wait
sleep 1
apt install -y libxtables-dev libip6tc-dev libip4tc-dev make gcc pkg-config git
# apt install -y iptables-dev make gcc pkg-config git
wait
sleep 1
apt install dkms
wait
sleep 1
git clone https://github.com/Lochnair/xt_tls.git
cd xt_tls/
make
wait
make install
wait
sleep 1
make dkms-install
wait
echo "done:"
echo "curl -v --tlsv1.3 https://www.facebook.com/"
echo 'iptables -A OUTPUT -p tcp --dport 443 -m tls --tls-host "*.facebook.com" -j DROP'
echo 'iptables -A OUTPUT -p tcp --dport 443 -m tls --tls-host "*.googlevideo.com" -j DROP'
echo 'iptables -A OUTPUT -p tcp --dport 443 -m tls --tls-host "*.fbcdn.net" -j DROP'
