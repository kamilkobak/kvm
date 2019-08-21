#!/bin/bash
#
# 0) sudo apt-get install qemu-kvm libvirt-bin bridge-utils virt-manager qemu virt-viewer spice-vdagent
#
# 1) W BIOS wlączyć virtualizację: Virtualization Technology (VT)
#
# 2) Jeśli masz dysk SSD, dodaj parametr discard=unmap do sekcji
#    --disk ${WIN_VDA_FILE}
#
# 3) zaleca się pobranie sterowników „VirtIO” produkowanych przez Red Hat. 
#    Te sterowniki są instalowane w systemie Windows i znacznie poprawiają 
#    wydajność sieci i dysków systemu Windows 
#    (https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.171-1/) 
#
# 4) W celu dostępu przez GUI użyj `virt-viewer` lub `virt-manager`
#
# 5) Podczas instalacji Win10 wybrać VirtIO CDROM i przejść do 
#    VirtIO drive/viostor/w10/amd64 w celu załadowania sterownika
#
# 6) Komunikat: WARNING  KVM acceleration not available, using 'qemu'  
#    oznacza, że nie ma włączonej virtualizacji w biosie.

# debug?
#set -x


WIN_VDA_FILE="/home/kamil/VM/images/Win10-vda.qcow2"
WIN_VDA_SIZE="30"
WIN_ISO="/home/kamil/Pobrane/iso/Win10_1903_V1_Polish_x64.iso"
VIRTIO_ISO="/home/kamil/Pobrane/iso/virtio-win-0.1.171.iso"

virt-install \
  --name Win10 \
  --metadata title="Windows 10 Pro" \
  --os-variant win10 \
  --cpu core2duo \
  --vcpus 2 \
  --ram 4096 \
  --graphics spice \
  --rng /dev/urandom \
  --network network=default,model=virtio \
  --controller type=scsi,model=virtio-scsi \
  --disk path=${WIN_VDA_FILE},size=${WIN_VDA_SIZE},format=qcow2,bus=virtio,discard=unmap \
  --disk ${WIN_ISO},device=cdrom,bus=ide \
  --disk ${VIRTIO_ISO},device=cdrom,bus=ide


