#!/bin/bash

# --- Konfigurasi ---
REPO_NAME="arsa"
USER_NAME="Dlom1"

echo "=== Memulai Setup Struktur Repositori $REPO_NAME ==="

# 1. Membuat Struktur Folder Minimalis
echo "Membuat folder assets dan data..."
mkdir -p assets/img assets/pdf assets/docs data uploads

# 2. Membuat file README.md Dasar
echo "Membuat README.md..."
cat <<EOF > README.md
# Arsa Repository
Manajemen aset digital Madrasah Al-Qur'an Ar-Risalah.

### Struktur Folder:
- \`assets/img/\`: Foto santri dan desain grafis.
- \`assets/pdf/\`: Laporan dan dokumen PDF.
- \`assets/docs/\`: Template Word (.docx).
- \`data/\`: File CSV/database santri.
EOF

# 3. Membuat file .gitignore
echo "Membuat .gitignore..."
cat <<EOF > .gitignore
# File Sistem
.DS_Store
Thumbs.db
*.log

# Folder Upload (Data Sensitif)
uploads/*
!uploads/.gitkeep

# File Temp Office
~\$*.docx
EOF

# Menjaga folder kosong agar tetap terdeteksi Git
touch uploads/.gitkeep

# 4. Inisialisasi Git LFS
echo "Mengatur Git LFS untuk file besar..."
git lfs install
git lfs track "*.png"
git lfs track "*.jpg"
git lfs track "*.pdf"
git lfs track "*.docx"
git lfs track "*.psd"

# 5. Menambahkan ke Git
echo "Menyiapkan commit pertama..."
git add .
git add .gitattributes

echo "=== Setup Selesai! ==="
echo "Langkah selanjutnya, silakan jalankan:"
echo "git commit -m 'Initial structure with LFS'"
echo "git push origin main"
