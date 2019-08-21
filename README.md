# KVM
1) Instalujemy: sudo apt-get install qemu-kvm libvirt-bin bridge-utils virt-manager qemu virt-viewer spice-vdagent

2) W BIOS wlączyć virtualizację: Virtualization Technology (VT)

3) Jeśli masz dysk SSD, dodaj parametr discard=unmap do sekcji `--disk ${WIN_VDA_FILE}`

4) zaleca się pobranie sterowników „VirtIO” produkowanych przez Red Hat. Te sterowniki są instalowane w systemie Windows i znacznie poprawiają wydajność sieci i dysków systemu Windows (https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.171-1/)

5) W celu dostępu przez GUI użyj `virt-viewer` lub `virt-manager`

6) Podczas instalacji Win10 wybrać VirtIO CDROM i przejść do `VirtIO drive/viostor/w10/amd64` w celu załadowania sterownika

7) Komunikat: WARNING  KVM acceleration not available, using 'qemu' oznacza, że nie masz włączonej w biosie virtualizacji

