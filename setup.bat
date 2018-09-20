wget --referer=http://support.amd.com https://www2.ati.com/drivers/linux/ubuntu/18.04/amdgpu-pro-18.30-641594.tar.xz
tar -Jxvf amdgpu-pro-18.30-641594.tar.xz
cd amdgpu-pro-18.30-641594
./amdgpu-pro-install -y
sudo usermod -a -G video $LOGNAME

a. Edit /etc/default/grub as root and modify GRUB_CMDLINE_LINUX_DEFAULT in order to add "amdgpu.vm_fragment_size=9" (without the quotes). The line may look something like this after the change:

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.vm_fragment_size=9"

b. Update grub and reboot as root
  update-grub;reboot

wget https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v11.8/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v11.8.-.LINUX.tar.gz
tar -xzvf Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v11.8.-.LINUX.tar.gz -C /usr/local/claymore11/
cd /usr/local/claymore11