# edonusum-gitops

Bu repoda signer-ws, gib-user-service ve ebelge-gib-integration repolarındaki servislerin docker-compose dosyaları ile k8s manifestleri bulunmaktadır.

Local, test, dev veya on-prem canlı ortamlarında deployment süreçlerini manuel yönetmek için tasarlanmıştır.

📂 Depo İçeriği
Proje, iki farklı çalışma ortamı için hazır yapılandırmalar sunar:

1. Docker Compose (/docker-compose)
Geliştiricilerin yerel makinelerinde (Docker Desktop vb.) tüm servisleri saniyeler içinde çalıştırması içindir.

Tüm mikroservislerin birbiriyle iletişim kurabileceği izole bir network yapısı.

Gerekli veritabanı (SQL Server) ve servis bağımlılıklarının ön tanımlı konfigürasyonları.

2. Kubernetes Manifestleri (/k8s)
On-prem veya yerel Kubernetes cluster ortamları için hazırlanmış YAML dosyalarıdır.

Deployments & Services: Her bir mikroservis için kaynak sınırları ve servis tanımları.

ConfigMaps & Secrets: Uygulama bazlı çevre değişkenleri (Environment Variables).

Ingress: Cluster dışından erişim kurallarını içeren tanımlamalar.

🚀 Çalıştırma Talimatları
Yerel Geliştirme Ortamı (Docker)
Tüm ekosistemi tek bir komutla ayağa kaldırın:

Bash
cd docker-compose
docker-compose up -d

Manuel Kubernetes Dağıtımı (Private Cloud)
Cluster bağlamınızın (context) doğru olduğundan emin olduktan sonra manifestleri uygulayın:

Bash
cd k8s
kubectl apply -f .
