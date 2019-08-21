# kvm
0) sudo apt-get install qemu-kvm libvirt-bin bridge-utils virt-manager qemu virt-viewer spice-vdagent

1) W BIOS wlączyć virtualizację: Virtualization Technology (VT)

2) Jeśli masz dysk SSD, dodaj parametr discard=unmap do sekcji --disk ${WIN_VDA_FILE}

3) zaleca się pobranie sterowników „VirtIO” produkowanych przez Red Hat. Te sterowniki są instalowane w systemie Windows i znacznie poprawiają wydajność sieci i dysków systemu Windows

4) W celu dostępu przez GUI użyj `virt-viewer` lub `virt-manager`

5) Podczas instalacji Win10 wybrać VirtIO CDROM i przejść do `VirtIO drive/viostor/w10/amd64` w celu załadowania sterownika

6) Komunikat: WARNING  KVM acceleration not available, using 'qemu' oznacza, że nie ma włączonej virtualizacji w biosie

