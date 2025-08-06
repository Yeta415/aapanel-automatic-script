# 🛠️ aaPanel Automatic Script

Script bash sederhana untuk **install** dan **uninstall** aaPanel secara otomatis melalui menu CLI interaktif.  
Dibuat dengan ❤️ oleh **Rindev** (github.com/Yeta415)

---

## 🧩 Fitur

- ✅ Instalasi otomatis aaPanel (Ubuntu / Debian / CentOS)
- ❌ Uninstall total aaPanel (termasuk file `.user.ini`, folder `/www`, crontab, dan iptables)
- 🎛 Menu CLI interaktif dengan pilihan [1] Install, [2] Uninstall
- 📜 Konfirmasi sebelum tindakan destruktif (safety)
- 🚀 Cepat, ringan, dan mudah dipakai di server manapun

---

## 💻 Cara Instalasi & Penggunaan

🧾 Jalankan script berikut di terminal server kamu:

```bash
curl -O https://raw.githubusercontent.com/Yeta415/aapanel-automatic-script/main/rindev-aapanel-tool.sh
chmod +x rindev-aapanel-tool.sh
./rindev-aapanel-tool.sh
```

Jika kamu mengalami error karena bukan user root, gunakan:

```bash
git clone https://github.com/Yeta415/aapanel-automatic-script.git
cd aapanel-automatic-script
chmod +x rindev-aapanel-tool.sh
sudo bash rindev-aapanel-tool.sh
```

---

## 🛑 Cara Keluar dari Menu

Jika kamu sudah masuk ke dalam menu script:

- Tekan `0` lalu `Enter` untuk keluar dengan aman
- Atau tekan `Ctrl + C` untuk keluar paksa dari menu

---

## ⚠️ Peringatan Penting

- 💾 **Backup semua data penting** sebelum menjalankan uninstall!
- 🧹 Proses uninstall akan:
  - Menghapus semua file dan folder panel (`/www`, `/usr/bin/bt`, dsb)
  - Membersihkan crontab
  - Menghapus port 8888 dan 7800 dari iptables
- 🚫 Tindakan ini bersifat permanen dan tidak bisa dibatalkan

---

## 📬 Kredit & Kontak

Script ini dibuat oleh [Rindev](https://github.com/Yeta415)   

Jika ada bug, pertanyaan, atau request fitur:

- 📧 Email: [fiqulyeta@gmail.com](mailto:fiqulyeta@gmail.com)
- 🐛 GitHub Issue: [Klik di sini](https://github.com/Yeta415/aapanel-automatic-script/issues)

---

© 2025 Rindev - Powerred by Elaina ❤️
