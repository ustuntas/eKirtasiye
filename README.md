# eKirtasiye - Okul Kırtasiyesi Online Satış Platformu

Ruby on Rails 8.1 ile geliştirilmiş okul kırtasiyesi online satış platformu.

## Kurulum

### Sistem Gereksinimleri

- Ruby 3.2+
- Rails 8.1
- SQLite3
- Node.js 18+ (Tailwind CSS için)
- YARN

### Adımlar

```bash
# 1. Repository'yi klonlayın
cd /home/Projeler/eKirtasiye

# 2. Bağımlılıkları kurun
bundle install

# 3. Veritabanını oluşturun ve migration'ları çalıştırın
bin/rails db:create db:migrate

# 4. Örnek verileri yükleyin
bin/rails db:seed

# 5. Sunucuyu başlatın
bin/rails server -p 4000 -b 0.0.0.0
```

Tarayıcınızda `http://localhost:4000` adresine gidin.

## Demo Hesapları

| Rol | E-posta | Şifre |
|-----|---------|-------|
| Yönetici | admin@ekirtasiye.com | password123 |
| Okul Yöneticisi | okul@ekirtasiye.com | password123 |
| Müşteri | musteri@ekirtasiye.com | password123 |

## Veritabanı Yapısı

Tablolar (22 adet):

- users - Kullanıcılar
- sessions - Oturumlar
- schools - Okullar
- school_accounts - Okul hesapları
- classes - Sınıflar
- categories - Kategoriler
- products - Ürünler
- product_images - Ürün resimleri
- school_class_lists - Okul sınıf listeleri
- school_class_list_items - Liste kalemleri
- carts - Sepetler
- cart_items - Sepet kalemleri
- orders - Siparişler
- order_items - Sipariş kalemleri
- addresses - Adresler
- coupon_codes - Kupon kodları
- school_points - Okul puanları
- school_point_transactions - Puan işlemleri
- payments - Ödemeler
- shipments - Kargolar
- reviews - Yorumlar

## Routes (Yol Haritası)

- `GET /` - Ana sayfa
- `GET /categories` - Kategoriler
- `GET /products` - Ürünler
- `GET /schools` - Okullar
- `GET /cart` - Sepet
- `GET /checkout` - Ödeme
- `GET /orders` - Siparişler
- `GET /account` - Hesap paneli
- `GET /school` - Okul paneli
- `GET /admin` - Yönetici paneli

## Özellikler

### Faz 1: Temel Altyapı
- Rails 8.1 projesi
- SQLite veritabanı
- Kimlik doğrulama (3 rol: müşteri, okul_admin, yönetici)
- 22 tablo içeren veritabanı şeması

### Faz 2: Mağaza Önyüzü
- Ana sayfa
- Kategoriler ve ürünler
- Okul ve sınıf seçimi

### Faz 3: Okul Listeleri ve Sepet
- Okul ihtiyaç listeleri
- Tek tıkla sepete ekleme
- Sepet yönetimi
- Kupon kodu uygulama
- Puan kullanma

### Faz 4: Ödeme Akışı
- Adres seçimi
- Ödeme işlemi
- Sipariş oluşturma

### Faz 5: Okul Puan Sistemi
- Puan kazanma
- Puan kullanma
- Puan iadesi

### Faz 6: Panel Sayfaları
- Okul yöneticisi paneli
- Yönetici (Admin) paneli

### Faz 7: Test ve Güvenlik
- Birim testleri
- Sistem testleri
- Güvenlik kontrolleri

## Geliştirme

```bash
# Testleri çalıştırma
bin/rails test

# Konsolu açma
bin/rails console

# Routes kontrol
bin/rails routes
```

## Katkı

Bu proje eğitim amaçlı oluşturulmuştur.