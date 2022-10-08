# Bu araç @keyiflerolsun tarafından | @KekikAkademi için yazılmıştır.

# Docker Python İmajı
FROM python:3.10.6-slim-buster

# Gerekli Paketlerin Yüklenmesi
RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
    ffmpeg \
    opus-tools \
    && \
    rm -rf /var/lib/apt/lists/*

# Pip Güncellemesi ve Kütüphane Kurulumları
RUN python3.10 -m pip install -U pip

COPY . .

RUN python3.10 -m pip install --upgrade pip && \
    python3.10 -m pip install --no-cache-dir -Ur requirements.txt

# Botun Başlatılması
CMD ["python3.10", "main.py"]