# TASKS.md

## Proje
Okul Kırtasiyesi Online Satış Platformu

## Not
Bu görev listesi, sağlanan gereksinim dokümanındaki iş kurallarını temel alır; ancak teknoloji tercihi kullanıcı isteğine göre **Ruby on Rails + SQLite** olarak uyarlanmıştır.

## Hedef
Veliler, bireysel müşteriler, kurumsal okul hesapları, operasyon personeli ve yöneticiler için; sınıf bazlı ihtiyaç listeleri, tek tıkla listeyi sepete ekleme, okul puanı kazanımı ve puan kullanımı özelliklerine sahip modern bir e-ticaret uygulaması geliştirmek.

---

## 0. Mimari ve Teknik Kararlar

- [ ] Rails sürümünü belirle (`Rails 7.x` veya `Rails 8.x`).
- [ ] SQLite ile geliştirme ortamını hazırla.
- [ ] Uygulama için temel klasör ve modül mimarisini tanımla.
- [ ] `app/models`, `app/services`, `app/policies`, `app/queries`, `app/presenters` ayrımını netleştir.
- [ ] Yönetim paneli, kurumsal okul paneli ve müşteri tarafı için ayrı namespace yapısı kur.
  - [ ] `Admin::`
  - [ ] `School::`
  - [ ] `Account::` veya müşteri paneli alanı
- [ ] Ortak layout, partial ve component stratejisini belirle.
- [ ] Form doğrulama, hata gösterimi ve yetkilendirme yapısını standartlaştır.
- [ ] Uygulama genelinde servis nesnesi kullanılacak alanları tanımla.
- [ ] İş kuralları için `Service Object` yaklaşımını benimse.
- [ ] Sipariş ve puan işlemlerinde transaction kullanım standardı oluştur.

### Kabul Kriterleri
- Rails uygulaması boot ediyor olmalı.
- Namespace yapısı net olmalı.
- Kod tabanı modüler ve geliştirilebilir bir iskelete sahip olmalı.

---

## 1. Başlangıç Kurulumu ve Temel Altyapı

- [ ] Yeni Rails projesini oluştur.
- [ ] SQLite veritabanını oluştur ve bağla.
- [ ] Git repository başlat.
- [ ] Ortam dosyalarını ve temel konfigurasyonları ayarla.
- [ ] `Rubocop`, `Brakeman`, `RSpec` veya `Minitest` yapılandırmasını ekle.
- [ ] Temel hata loglama altyapısını kur.
- [ ] Seed mekanizmasını hazırla.
- [ ] Ortak helper, concern ve base class yapılarını oluştur.
- [ ] Flash mesajları ve global hata sayfası yapısını kur.
- [ ] Mobil uyumlu bir UI yaklaşımı seç.
  - [ ] Tailwind CSS veya Bootstrap kararı al
  - [ ] Responsive grid yapısını ekle
- [ ] Dosya yükleme çözümünü belirle.
  - [ ] Active Storage kullan
- [ ] Görsel işleme gerekiyorsa ilgili yapılandırmayı ekle.

### Kabul Kriterleri
- Proje lokal ortamda sorunsuz çalışmalı.
- Test komutları ve lint komutları çalışmalı.
- UI iskeleti responsive biçimde açılmalı.

---

## 2. Kimlik Doğrulama ve Rol Tabanlı Yetkilendirme

### 2.1 Kullanıcı ve Rol Modeli
- [ ] `User` modelini oluştur.
- [ ] `Role` modelini veya enum bazlı rol yapısını oluştur.
- [ ] Desteklenecek roller:
  - [ ] ziyaretçi
  - [ ] bireysel müşteri
  - [ ] kurumsal okul hesabı kullanıcısı
  - [ ] yönetici
  - [ ] operasyon / personel
- [ ] Kullanıcı-rol ilişkisini kur.
- [ ] Aktif/pasif kullanıcı durumu ekle.
- [ ] E-posta benzersizlik kontrolü ekle.
- [ ] Şifre hash yapısını güvenli şekilde kur.

### 2.2 Oturum Akışları
- [ ] Kayıt ol sayfası oluştur.
- [ ] Giriş yap sayfası oluştur.
- [ ] Çıkış yap akışı oluştur.
- [ ] Şifre sıfırlama akışı oluştur.
- [ ] Profil görüntüleme ve profil güncelleme ekranı oluştur.

### 2.3 Yetkilendirme
- [ ] Rol tabanlı erişim kontrolü kur.
- [ ] Yönetim paneli sadece admin/izinli personele açık olsun.
- [ ] Kurumsal okul paneli yalnızca doğrulanmış okul kullanıcılarına açık olsun.
- [ ] Her controller/action için yetki matrisi tanımla.
- [ ] Yetkisiz erişimler için güvenli yönlendirme yap.

### Kabul Kriterleri
- Kullanıcı kayıt, giriş, çıkış ve şifre sıfırlama akışları çalışmalı.
- Rol bazlı erişim doğru davranmalı.
- Kurumsal okul hesabı doğrulanmadan ilgili panel tam erişim vermemeli.

---

## 3. Veritabanı Şeması ve Modelleme

### 3.1 Ana Tablolar / Modeller
- [ ] `users`
- [ ] `roles`
- [ ] `schools`
- [ ] `school_accounts`
- [ ] `classes`
- [ ] `school_class_lists`
- [ ] `school_class_list_items`
- [ ] `categories`
- [ ] `products`
- [ ] `product_images`
- [ ] `carts`
- [ ] `cart_items`
- [ ] `orders`
- [ ] `order_items`
- [ ] `addresses`
- [ ] `coupon_codes`
- [ ] `school_points`
- [ ] `school_point_transactions`
- [ ] `payments`
- [ ] `shipments`
- [ ] `reviews`

### 3.2 Gerekli Ek Alanlar
- [ ] Liste versiyonlama için dönem/yıl alanları ekle.
- [ ] Sınıf listeleri için aktif/pasif durumu ekle.
- [ ] Siparişe, kullanılan sınıf listesi kaynak bilgisini ekle.
  - [ ] okul id
  - [ ] sınıf listesi id
  - [ ] sınıf listesi sürümü
- [ ] Ürün için puan değeri alanı ekle.
- [ ] Ürün için stok, fiyat, açıklama, aktiflik, SKU alanları ekle.
- [ ] Okul puan hareketlerinde işlem tipi alanı ekle.
  - [ ] kazanım
  - [ ] kullanım
  - [ ] iade geri alımı
  - [ ] manuel düzeltme
- [ ] Sipariş durumları için enum yapısı kur.
- [ ] Ödeme durumları için enum yapısı kur.
- [ ] Kargo durumları için enum yapısı kur.

### 3.3 İlişkiler
- [ ] Tüm `belongs_to`, `has_many`, `has_one` ilişkilerini kur.
- [ ] Silme davranışlarını belirle.
- [ ] Foreign key benzeri bütünlük kurallarını migration ve model seviyesinde uygula.
- [ ] Benzersiz index ve performans indexlerini ekle.

### Kabul Kriterleri
- Migration’lar sorunsuz çalışmalı.
- Tüm modeller arası ilişkiler net ve test edilebilir olmalı.
- İş kurallarını taşıyacak veri yapısı eksiksiz kurulmuş olmalı.

---

## 4. Demo Veri ve Seed Altyapısı

- [ ] Demo admin kullanıcısı oluştur.
- [ ] Demo operasyon kullanıcısı oluştur.
- [ ] Demo bireysel müşteri oluştur.
- [ ] Demo okul ve kurumsal okul hesabı oluştur.
- [ ] Demo kategori ve alt kategoriler oluştur.
- [ ] Demo ürünler oluştur.
- [ ] Demo okul sınıfları oluştur.
- [ ] Demo sınıf ihtiyaç listeleri oluştur.
- [ ] Demo puan hareketleri oluştur.
- [ ] Demo siparişler oluştur.

### Kabul Kriterleri
- `rails db:seed` çalıştırıldığında demo ortamı oluşmalı.
- Okul seçimi, liste görüntüleme ve sepet akışları seed verisiyle denenebilmeli.

---

## 5. Mağaza Ön Yüzü - Genel E-Ticaret Özellikleri

### 5.1 Ana Sayfa
- [ ] Kampanya alanı oluştur.
- [ ] Öne çıkan kategoriler bölümü oluştur.
- [ ] Okul ve sınıf seçimi giriş alanını ana sayfaya ekle.
- [ ] Öne çıkan ürünler alanı oluştur.

### 5.2 Kategori ve Ürün Listeleme
- [ ] Kategori sayfası oluştur.
- [ ] Alt kategori desteği ekle.
- [ ] Ürün filtreleme ekle.
  - [ ] fiyat
  - [ ] kategori
  - [ ] stokta olanlar
  - [ ] puanlı ürünler
- [ ] Ürün sıralama seçenekleri ekle.
- [ ] Arama altyapısı oluştur.

### 5.3 Ürün Detay Sayfası
- [ ] Ürün adı, açıklama, fiyat, puan değeri, stok bilgisi göster.
- [ ] Ürün görsel galerisi göster.
- [ ] Sepete ekle butonu ekle.
- [ ] Favorilere ekle akışı ekle.
- [ ] Yorum ve puanlama alanı ekle.

### Kabul Kriterleri
- Kullanıcı kategori bazlı gezinebilmeli.
- Ürün detay sayfası eksiksiz çalışmalı.
- Arama ve filtreleme kullanılabilir olmalı.

---

## 6. Okul ve Sınıf Bazlı İhtiyaç Listesi Sistemi

### 6.1 Okul ve Sınıf Seçimi
- [ ] Okul listeleme ekranı oluştur.
- [ ] Okul arama alanı ekle.
- [ ] Okula bağlı sınıf/şube listesi ekranı oluştur.
- [ ] Aktif sınıf listelerini döneme göre göster.

### 6.2 Sınıf İhtiyaç Listesi Sayfası
- [ ] Seçilen okul ve sınıfa ait listeyi göster.
- [ ] Her listedeki ürünleri miktar bilgisiyle göster.
- [ ] Toplam tutarı hesapla.
- [ ] Toplam ürün sayısını hesapla.
- [ ] Beklenen okul puanını ön izleme olarak göster.
- [ ] Stokta olmayan ürünler için uyarı göster.
- [ ] Alternatif ürün öneri alanı için temel yapı hazırla.

### 6.3 Tek Tıkla Sepete Ekleme
- [ ] Listeyi tek tıkla sepete ekleme servisi yaz.
- [ ] Listedeki tüm ürünleri tanımlı miktarlarıyla sepete ekle.
- [ ] Aynı ürün sepette varsa birleştirme kuralını tanımla.
- [ ] Liste kaynağını sepete meta veri olarak kaydet.
- [ ] Liste eklendiğinde sepetin hangi okul ve hangi liste sürümünden oluştuğunu sakla.

### 6.4 Liste Düzenleme Mantığı
- [ ] Kullanıcı sepet içinde ürün azaltabilsin.
- [ ] Ürün çıkarabilsin.
- [ ] Ekstra ürün ekleyebilsin.
- [ ] Sistem, orijinal liste ile kullanıcı tarafından düzenlenmiş sepet arasındaki farkı tespit edebilsin.
- [ ] Bu farkı puan hesaplaması için kullanılacak şekilde kaydet.

### Kabul Kriterleri
- Kullanıcı okul ve sınıf seçip ihtiyaç listesini görebilmeli.
- Liste tek tıkla sepete eklenebilmeli.
- Kullanıcı sepet üzerinde düzenleme yaptığında orijinal liste ilişkisi kaybolmamalı.

---

## 7. Sepet Yönetimi

- [ ] `Cart` ve `CartItem` akışlarını tamamla.
- [ ] Ziyaretçi sepeti ile giriş yapan kullanıcı sepeti davranışını tanımla.
- [ ] Sepet görüntüleme sayfası oluştur.
- [ ] Adet artırma/azaltma işlemleri ekle.
- [ ] Ürün silme işlemi ekle.
- [ ] Kupon alanı ekle.
- [ ] Okul puanı ön izleme bilgisini sepette göster.
- [ ] Sepet toplamlarını hesaplayan servis oluştur.
  - [ ] ara toplam
  - [ ] indirim
  - [ ] kargo
  - [ ] genel toplam
- [ ] Stok kontrolünü sepet güncelleme anında da yap.

### Kabul Kriterleri
- Sepet güvenli şekilde yönetilebilmeli.
- Liste kaynaklı ürünler ve manuel eklenen ürünler birlikte çalışmalı.
- Toplamlar doğru hesaplanmalı.

---

## 8. Adres, Ödeme ve Sipariş Akışı

### 8.1 Adres Yönetimi
- [ ] Teslimat adresi CRUD oluştur.
- [ ] Fatura adresi CRUD oluştur.
- [ ] Varsayılan adres seçimi ekle.

### 8.2 Checkout
- [ ] Çok adımlı veya tek sayfa ödeme akışı oluştur.
- [ ] Sipariş özeti alanı oluştur.
- [ ] Adres seçimi ekle.
- [ ] Ödeme yöntemi seçimi ekle.
- [ ] Sipariş onay ekranı oluştur.

### 8.3 Sipariş Oluşturma
- [ ] Sipariş oluşturma servisi yaz.
- [ ] Sipariş oluşturulurken stok düşümü yap.
- [ ] Sipariş kalemlerini oluştur.
- [ ] Ödeme kaydını oluştur.
- [ ] Kargo kaydını başlat.
- [ ] Sipariş ile sınıf listesi ilişki kaydını sakla.
- [ ] Sipariş transaction içinde oluşturulsun.

### 8.4 Sipariş Takibi
- [ ] Siparişlerim sayfası oluştur.
- [ ] Sipariş detay sayfası oluştur.
- [ ] Sipariş durumu takibi ekle.
- [ ] İptal/iade talep mekanizması ekle.

### Kabul Kriterleri
- Sipariş akışı uçtan uca çalışmalı.
- Sipariş oluşurken stok, ödeme ve puan hazırlığı tutarlı biçimde yürümeli.
- Kullanıcı geçmiş siparişlerini görebilmeli.

---

## 9. Okula Puan Kazandırma Sistemi

### 9.1 Puan Modeli ve Kural Motoru
- [ ] Puan hesaplama servisi yaz.
- [ ] Ürün bazlı sabit puan desteği ekle.
- [ ] Oransal/fiyat bazlı puan desteği için genişletilebilir yapı kur.
- [ ] Tam liste satın alımında tam puan kuralı uygula.
- [ ] Kısmi değişiklik için ayarlanabilir kural altyapısı oluştur.
  - [ ] hiç puan verme
  - [ ] oransal puan ver
  - [ ] ileride genişletilebilir modüler kural yapısı

### 9.2 Puan Kazanımı
- [ ] Sipariş tamamlandığında puan kazandırma tetikle.
- [ ] Sadece okulun yayınladığı liste üzerinden gelen siparişlerde puan üret.
- [ ] Sipariş kalemlerini orijinal listeyle doğrula.
- [ ] Okul puan bakiyesini güncelle.
- [ ] Puan işlem geçmişi oluştur.

### 9.3 Puan İadesi / Geri Alma
- [ ] Sipariş iptalinde puanı geri al.
- [ ] İadede puanı geri al.
- [ ] Kısmi iade için kısmi puan geri alma desteği planla veya uygula.

### 9.4 Puan Kullanımı
- [ ] Okul kullanıcıları için puan kullanım akışı oluştur.
- [ ] Puanlar sadece okul ihtiyaç siparişlerinde kullanılabilsin.
- [ ] Puanı nakde çevirmeyi engelle.
- [ ] Puan kullanımında işlem geçmişi oluştur.

### Kabul Kriterleri
- Puan yalnızca uygun siparişlerde oluşmalı.
- Liste değişikliği kuralları doğru çalışmalı.
- İptal/iade senaryolarında puan tutarlılığı korunmalı.

---

## 10. Kurumsal Okul Hesabı ve Okul Paneli

### 10.1 Okul Hesabı Başvurusu ve Doğrulama
- [ ] Kurumsal okul hesabı kayıt akışı oluştur.
- [ ] Okul doğrulama/bekleme durumu ekle.
- [ ] Yönetici onay ekranı oluştur.
- [ ] Onay sonrası okul paneline erişim ver.

### 10.2 Okul Profil Yönetimi
- [ ] Okul profil görüntüleme ekranı oluştur.
- [ ] Okul profil güncelleme ekranı oluştur.
- [ ] İletişim ve resmi bilgiler alanlarını ekle.

### 10.3 Sınıf Listesi Yönetimi
- [ ] Okul panelinden sınıf listesi oluşturma ekranı yap.
- [ ] Listeye ürün ekleme/çıkarma ekranı yap.
- [ ] Ürün miktarı belirleme desteği ekle.
- [ ] Liste versiyonlama ekle.
- [ ] Dönem bazlı liste oluşturma desteği ekle.
- [ ] Liste yayınlama / pasife alma akışı ekle.
- [ ] Geçmiş kayıt görüntüleme ekranı ekle.

### 10.4 Puan Ekranları
- [ ] Puan bakiyesi ekranı oluştur.
- [ ] Puan kazanım geçmişi ekranı oluştur.
- [ ] Puan kullanım geçmişi ekranı oluştur.
- [ ] Okul ihtiyaç siparişlerinde puan kullanma ekranı oluştur.

### Kabul Kriterleri
- Okul hesabı kendi listelerini yönetebilmeli.
- Okul, puanlarını ve hareket geçmişini görebilmeli.
- Yalnızca doğrulanmış okul hesapları aktif panel kullanabilmeli.

---

## 11. Yönetim Paneli

### 11.1 Ürün Yönetimi
- [ ] Ürün ekleme ekranı oluştur.
- [ ] Ürün düzenleme ekranı oluştur.
- [ ] Ürün silme veya pasife alma akışı oluştur.
- [ ] Fiyat, stok, açıklama, görsel, puan değeri alanlarını yönet.
- [ ] Toplu ürün işlemleri için temel yapı düşün.

### 11.2 Kategori Yönetimi
- [ ] Kategori CRUD oluştur.
- [ ] Alt kategori desteği ekle.

### 11.3 Okul ve Kurumsal Hesap Yönetimi
- [ ] Okul kayıtlarını listele.
- [ ] Okul hesabını onayla/reddet.
- [ ] Okul detay ve puan bilgilerini görüntüle.
- [ ] Okul sınıf listelerini görüntüle ve yönet.

### 11.4 Sipariş ve Operasyon Yönetimi
- [ ] Sipariş liste ekranı oluştur.
- [ ] Sipariş detay ekranı oluştur.
- [ ] Sipariş durum güncelleme akışı ekle.
- [ ] Kargo takip bilgisi girme ekranı yap.
- [ ] İade / iptal taleplerini yönet.

### 11.5 Kampanya ve Kupon Yönetimi
- [ ] Kupon kodu CRUD oluştur.
- [ ] Kampanya kural yapısı oluştur.
- [ ] İndirim aktif/pasif durumu ekle.

### 11.6 Puan Kural Yönetimi
- [ ] Puan verme kuralını admin panelinden ayarlanabilir yap.
- [ ] Liste değişikliğinde puan davranışını seçilebilir yap.
- [ ] Gerekirse manuel puan düzeltme ekranı ekle.

### 11.7 Kullanıcı Yönetimi
- [ ] Kullanıcı listeleme ekranı oluştur.
- [ ] Kullanıcı detayı görüntüle.
- [ ] Rol değişikliği desteği ekle.
- [ ] Kullanıcı aktif/pasif durumu yönet.

### Kabul Kriterleri
- Admin paneli ana operasyonları uçtan uca yönetebilmeli.
- Ürün, okul, sipariş, puan ve kullanıcı yönetimi çalışmalı.
- Yönetim paneli erişimi güvenli biçimde korunmalı.

---

## 12. Favoriler, Yorumlar ve Ek E-Ticaret Özellikleri

- [ ] Favori / istek listesi özelliği ekle.
- [ ] Ürün yorum sistemi ekle.
- [ ] Puanlama sistemi ekle.
- [ ] Yorum onay/moderasyon akışı ekle.
- [ ] Kampanyalı ürün görünümleri ekle.
- [ ] Kargo ve teslimat bilgilerinin kullanıcı tarafında görünmesini sağla.

### Kabul Kriterleri
- Kullanıcı favori listesi oluşturabilmeli.
- Kullanıcı ürün yorumu ve puanlaması yapabilmeli.
- Moderasyon kuralları uygulanabilmeli.

---

## 13. Raporlama ve Ölçümleme

- [ ] Günlük satış raporu oluştur.
- [ ] Aylık satış raporu oluştur.
- [ ] Okul bazlı sipariş raporu oluştur.
- [ ] Okul bazlı puan kazanımı raporu oluştur.
- [ ] En çok kullanılan sınıf listeleri raporu oluştur.
- [ ] En çok satılan ürünler raporu oluştur.
- [ ] Kritik stok ürünleri raporu oluştur.
- [ ] Puan kullanılan okul siparişleri raporu oluştur.
- [ ] Yönetim panelinde rapor dashboard alanı oluştur.

### Kabul Kriterleri
- Admin temel metrikleri görebilmeli.
- Okul bazlı puan ve sipariş hareketleri raporlanabilmeli.

---

## 14. Kritik İş Kuralları Uygulaması

- [ ] Bir sınıf listesi için aktif/pasif durumu uygulanmalı.
- [ ] Aynı okul ve aynı sınıf için farklı dönem listeleri desteklenmeli.
- [ ] Sepete eklenen listenin kaynak bilgisi saklanmalı.
- [ ] Sipariş sırasında puan hesaplaması sipariş kalemlerinden doğrulanmalı.
- [ ] İptal edilen siparişte puan geri alınmalı.
- [ ] İade edilen siparişte puan geri alınmalı.
- [ ] Okul puanı yalnızca okul ihtiyaçlarında kullanılmalı.
- [ ] Stokta olmayan ürünlerde kullanıcı uyarılmalı.
- [ ] Alternatif ürün desteği için veri modeli veya placeholder yapı bırakılmalı.

### Kabul Kriterleri
- Kritik iş kuralları testlerle doğrulanmalı.
- Puan ve liste mantığında veri kaybı olmamalı.

---

## 15. Güvenlik ve Teknik Kalite

- [ ] CSRF korumasını doğrula.
- [ ] XSS koruması için kullanıcı girdilerini güvenli göster.
- [ ] Güçlü parametre yönetimini uygula.
- [ ] Yetki kontrolünü tüm kritik action’larda test et.
- [ ] Dosya yüklemelerinde tür ve boyut kontrolleri uygula.
- [ ] Giriş, sipariş ve puan işlemlerinde log üret.
- [ ] Şüpheli işlem ve hata loglarını merkezi bir yapıda topla.
- [ ] Transaction gerektiren alanları güvene al.
- [ ] N+1 sorgularını önlemek için gerekli preload yapısını kur.
- [ ] Temel performans taraması yap.
- [ ] Güvenlik taraması yap.
  - [ ] Brakeman

### Kabul Kriterleri
- Kritik güvenlik açıkları kapatılmış olmalı.
- Sipariş ve puan işlemleri yarım kalmış veri üretmemeli.
- Yetkisiz erişimler engellenmeli.

---

## 16. Responsive Tasarım ve Kullanılabilirlik

- [ ] Ana kullanıcı kitlesinin veli olduğu dikkate alınarak basit akış tasarla.
- [ ] Okul ve sınıf seçimini birkaç adımda tamamlanabilir yap.
- [ ] Sınıf listesi ekranında toplam tutar, toplam ürün sayısı ve okul puanı açık göster.
- [ ] Sepet ekranını hızlı ve anlaşılır yap.
- [ ] Mobil görünümde okul/sınıf seçim akışını test et.
- [ ] Kurumsal okul panelini sade ve işlevsel tasarla.
- [ ] Yönetim panelinde bilgi yoğun alanları okunabilir hale getir.

### Kabul Kriterleri
- Mobil ve masaüstü deneyimi kabul edilebilir seviyede olmalı.
- Temel kullanıcı akışları birkaç adımda tamamlanabilmeli.

---

## 17. Testler

### 17.1 Model Testleri
- [ ] Model validasyon testlerini yaz.
- [ ] Model ilişki testlerini yaz.
- [ ] Puan hesaplama testlerini yaz.
- [ ] Liste versiyonlama testlerini yaz.

### 17.2 Request / Controller Testleri
- [ ] Auth akış testlerini yaz.
- [ ] Ürün listeleme ve detay testlerini yaz.
- [ ] Okul/sınıf liste görüntüleme testlerini yaz.
- [ ] Sepet testlerini yaz.
- [ ] Sipariş oluşturma testlerini yaz.
- [ ] Yetki testlerini yaz.

### 17.3 Servis Testleri
- [ ] Listeyi sepete ekleme servis testi yaz.
- [ ] Sipariş oluşturma servis testi yaz.
- [ ] Puan hesaplama servis testi yaz.
- [ ] Puan geri alma servis testi yaz.

### 17.4 Sistem / Entegrasyon Testleri
- [ ] Ziyaretçi -> ürün görüntüleme akışını test et.
- [ ] Bireysel müşteri -> okul seç -> sınıf seç -> listeyi sepete ekle -> sipariş ver akışını test et.
- [ ] Okul hesabı -> liste oluştur -> yayınla -> puan gör akışını test et.
- [ ] Admin -> ürün ekle -> okul onayla -> sipariş yönet akışını test et.

### Kabul Kriterleri
- Kritik akışlar otomatik testlerle korunmalı.
- Puan ve sipariş mantığı için regresyon testleri bulunmalı.

---

## 18. Dokümantasyon

- [ ] `README.md` oluştur.
- [ ] Kurulum adımlarını yaz.
- [ ] Veritabanı hazırlık adımlarını yaz.
- [ ] Seed kullanımı dokümante et.
- [ ] Demo kullanıcı bilgilerini yaz.
- [ ] Rol yapısını dokümante et.
- [ ] Puan sistemi iş kurallarını dokümante et.
- [ ] Yönetim paneli kullanımını dokümante et.
- [ ] Kurumsal okul paneli kullanımını dokümante et.
- [ ] Temel test senaryolarını dokümante et.

### Kabul Kriterleri
- Yeni bir geliştirici projeyi dökümana bakarak ayağa kaldırabilmeli.
- İş kuralları belgede net biçimde yer almalı.

---

## 19. Teslimat Kapsamı

- [ ] Çalışan müşteri arayüzü
- [ ] Çalışan kurumsal okul paneli
- [ ] Çalışan yönetim paneli
- [ ] SQLite veritabanı şeması ve migration’lar
- [ ] Seed verileri
- [ ] Temel testler
- [ ] Kurulum dokümantasyonu
- [ ] İş kurallarını kapsayan teknik açıklamalar

---

## 20. Önceliklendirilmiş Yol Haritası

### Faz 1 - Temel Altyapı
- [ ] Proje kurulumu
- [ ] Auth ve rol sistemi
- [ ] Temel veritabanı modeli
- [ ] Seed verileri

### Faz 2 - Mağaza ve Katalog
- [ ] Ana sayfa
- [ ] Kategori/ürün listeleme
- [ ] Ürün detay
- [ ] Arama ve filtreleme

### Faz 3 - Okul/Sınıf Listesi Çekirdeği
- [ ] Okul seçimi
- [ ] Sınıf listesi ekranı
- [ ] Tek tıkla sepete ekleme
- [ ] Sepette düzenleme ve liste farkı takibi

### Faz 4 - Sipariş Çekirdeği
- [ ] Sepet
- [ ] Adres
- [ ] Checkout
- [ ] Sipariş oluşturma

### Faz 5 - Puan Sistemi
- [ ] Puan hesaplama
- [ ] Puan kazanımı
- [ ] Puan geri alma
- [ ] Puan kullanımı

### Faz 6 - Paneller
- [ ] Kurumsal okul paneli
- [ ] Yönetim paneli
- [ ] Operasyon ekranları

### Faz 7 - Kalite ve Kapanış
- [ ] Testler
- [ ] Güvenlik kontrolleri
- [ ] Raporlama
- [ ] Dokümantasyon

---

## 21. Özellikle Dikkat Edilecek En Kritik Konular

- [ ] Sınıf ihtiyaç listesinin tek tıkla eksiksiz biçimde sepete eklenmesi
- [ ] Sepette yapılan kullanıcı değişikliklerinin orijinal listeden ayrıştırılabilmesi
- [ ] Okul puanı kazanımının yalnızca geçerli liste siparişlerinden hesaplanması
- [ ] Sipariş iptal/iade durumlarında puan tutarlılığının korunması
- [ ] Kurumsal okul puanlarının yalnızca okul ihtiyaçlarında kullanılabilmesi
- [ ] Yönetim paneli ve okul paneli yetkilerinin kesin ayrılması
- [ ] Mobil deneyimin özellikle okul/sınıf seçimi ve sepet akışında sorunsuz olması

---

## 22. İsteğe Bağlı Sonraki İyileştirmeler

- [ ] Alternatif ürün öneri motoru
- [ ] Liste içeriği için akıllı eşdeğer ürün önerisi
- [ ] E-posta bildirimleri
- [ ] SMS bildirimleri
- [ ] Gelişmiş rapor dashboard’ları
- [ ] Çoklu ödeme entegrasyonları
- [ ] Background job altyapısı
- [ ] API katmanı
- [ ] SQLite’tan PostgreSQL’e geçiş planı

