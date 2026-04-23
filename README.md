# eKirtasiye - Okul Kirtasiyesi Online Satis Platformu

Ruby on Rails 8.1 ile gelistirilmis okul kirtasiyesi online satis platformu.

## Kurulum

### Sistem Gereksinimleri

- Ruby 3.2+
- Rails 8.1
- SQLite3
- Node.js 18+ (for Tailwind CSS)
- YARN

### Adimlar

```bash
# 1. Repository'yi klonlayin
cd /home/Projeler/eKirtasiye

# 2. Bundler kurulumlari
bundle install

# 3. Database olusturma ve migration'lar
bin/rails db:create db:migrate

# 4. Seed data yukleme
bin/rails db:seed

# 5. Sunucuyu baslatma
bin/rails server -p 4000 -b 0.0.0.0
```

Tarayicinizda `http://localhost:4000` adresine gidin.

## Demo Hesaplari

| Rol | Email | Sifre |
|-----|-------|-------|
| Admin | admin@ekirtasiye.com | password123 |
| Okul Yoneticisi | okul@ekirtasiye.com | password123 |
| Musteri | musteri@ekirtasiye.com | password123 |

## Veritabani Yapisi

Tablolar (22 adet):

- users - Kullanicilar
- sessions - Oturumlar
- schools - Okullar
- school_accounts - Okul hesaplari
- classes - Sinfular
- categories - Kategoriler
- products - Urunler
- product_images - Urun resimleri
- school_class_lists - Okul sinif listeleri
- school_class_list_items - Liste kalemleri
- carts - Sepetler
- cart_items - Sepet kalemleri
- orders - Siparisler
- order_items - Siparis kalemleri
- addresses - Adresler
- coupon_codes - Kupon kodlari
- school_points - Okul puanlari
- school_point_transactions - Puan islemleri
- payments - Odemeler
- shipments - Kargolar
- reviews - Yorumlar

## Routes (Yol Haritasi)

- `GET /` - Ana sayfa
- `GET /categories` - Kategoriler
- `GET /products` - Urunler
- `GET /schools` - Okullar
- `GET /cart` - Sepet
- `GET /checkout` - Odeme
- `GET /orders` - Siparisler
- `GET /account` - Hesap paneli
- `GET /school` - Okul paneli
- `GET /admin` - Yonetici paneli

## Ozellikler

### Faz 1: Temel Altyapi
- Rails 8.1 projesi
- SQLite veritabani
- Kimlik dorulama (3 rol: musteri, okul_admin, admin)
- 22 tablo iceren veritabani semasi

### Faz 2: Mağaza On Yuzu
- Anasayfa
- Kategoriler ve urunler
- Okul ve sinif secimi

### Faz 3: Okul Listeleri ve Sepet
- Okul ihtiyac listeleri
- Tek tikla sepete ekleme
- Sepet yonetimi
- Kupon kodu uygulama
- Puan kullanma

### Faz 4: Odeme Akisi
- Adres secimi
- Odeme islemi
- Siparis olusturma

### Faz 5: Okul Puan Sistemi
- Puan kazanma
- Puan kullanma
- Puan iadesi

### Faz 6: Panel Sayfalari
- Okul yoneticisi paneli
- Yonetici (Admin) paneli

### Faz 7: Test ve Guvenlik
- Birim testleri
- Sistem testleri
- Guvenlik kontrolleri

## Gelistirme

```bash
# Testleri calistirma
bin/rails test

# Konsolu acma
bin/rails console

# Routes kontrol
bin/rails routes
```

## Katki

Bu proje egitim amacli olusturulmustur.
