-- ============================================================
-- 1. MÜŞTERİLER (CUSTOMERS) - 10 Örnek Kayıt
-- ============================================================
INSERT INTO customers (customer_id, first_name, last_name, signup_date, city) VALUES
(1, 'Ahmet', 'Yılmaz', '2025-01-15', 'İstanbul'),
(2, 'Mehmet', 'Kaya', '2025-02-10', 'Ankara'),
(3, 'Ayşe', 'Demir', '2025-03-05', 'İzmir'),
(4, 'Fatma', 'Çelik', '2025-03-20', 'Bursa'),
(5, 'Can', 'Öztürk', '2025-04-12', 'Antalya'),
(6, 'Zeynep', 'Aydın', '2025-05-01', 'İstanbul'),
(7, 'Mustafa', 'Arslan', '2025-06-18', 'Ankara'),
(8, 'Elif', 'Yıldız', '2025-07-22', 'İzmir'),
(9, 'Burak', 'Şahin', '2025-09-10', 'Kocaeli'),
(10, 'Deniz', 'Koç', '2025-11-05', 'Eskişehir');

-- ============================================================
-- 2. ÜRÜNLER (PRODUCTS) - 8 Örnek Ürün
-- ============================================================
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Kablosuz Kulaklık', 'Elektronik', 1200.00),
(102, 'Mekanik Klavye', 'Elektronik', 2500.00),
(103, 'Akıllı Saat', 'Elektronik', 3500.00),
(104, 'Ergonomik Ofis Koltuğu', 'Mobilya', 4800.00),
(105, 'Çelik Termos 1L', 'Ev & Yaşam', 650.00),
(106, 'Sırt Çantası', 'Aksesuar', 850.00),
(107, 'Yazar Kasa / Pos Rulosu 10lu', 'Ofis', 200.00),
(108, 'USB-C Hızlı Şarj Kablosu', 'Elektronik', 350.00);

-- ============================================================
-- 3. SİPARİŞLER (ORDERS) - Zaman Yayılımlı Sipariş Geçmişi
-- ============================================================
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
-- Ahmet Yılmaz (Sadık Müşteri - Yüksek Frekans / Son Zamanlarda Aktif)
(1001, 1, '2025-02-01', 1200.00, 'Completed'),
(1002, 1, '2025-05-10', 2500.00, 'Completed'),
(1003, 1, '2026-03-15', 3500.00, 'Completed'),
(1004, 1, '2026-07-20', 1850.00, 'Completed'),

-- Mehmet Kaya (Ayrılma Riskinde - Eskiden Alışveriş Yapmış, Son Zamanlarda Yok)
(1005, 2, '2025-02-15', 4800.00, 'Completed'),
(1006, 2, '2025-04-20', 650.00, 'Completed'),

-- Ayşe Demir (VIP / Şampiyon Müşteri - Yüksek Harcama ve Düzenli)
(1007, 3, '2025-03-10', 8300.00, 'Completed'),
(1008, 3, '2025-08-01', 4800.00, 'Completed'),
(1009, 3, '2026-02-14', 1200.00, 'Completed'),
(1010, 3, '2026-06-30', 2700.00, 'Completed'),

-- Fatma Çelik (Tek Seferlik Alışveriş Yapıp Kaybolan)
(1011, 4, '2025-03-25', 850.00, 'Completed'),

-- Can Öztürk (Düzenli Orta Segment)
(1012, 5, '2025-05-01', 3500.00, 'Completed'),
(1013, 5, '2025-11-12', 1200.00, 'Completed'),
(1014, 5, '2026-05-10', 650.00, 'Completed'),

-- Zeynep Aydın (Yeni Müşteri)
(1015, 6, '2026-05-20', 2500.00, 'Completed'),
(1016, 6, '2026-07-05', 850.00, 'Completed'),

-- Mustafa Arslan (İptal / İade Odaklı)
(1017, 7, '2025-07-01', 1200.00, 'Cancelled'),
(1018, 7, '2025-09-15', 3500.00, 'Returned'),

-- Elif Yıldız (Seyrek Alışveriş)
(1019, 8, '2025-08-10', 4800.00, 'Completed'),
(1020, 8, '2026-04-02', 350.00, 'Completed'),

-- Burak Şahin (Pasif Müşteri)
(1021, 9, '2025-10-01', 200.00, 'Completed'),

-- Deniz Koç (Yeni Gelip Yüksek Harcayan)
(1022, 10, '2025-11-20', 4800.00, 'Completed'),
(1023, 10, '2026-06-12', 3500.00, 'Completed');

-- ============================================================
-- 4. SİPARİŞ DETAYLARI (ORDER_ITEMS)
-- ============================================================
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 1, 1200.00),
(2, 1002, 102, 1, 2500.00),
(3, 1003, 103, 1, 3500.00),
(4, 1004, 101, 1, 1200.00),
(5, 1004, 105, 1, 650.00),
(6, 1005, 104, 1, 4800.00),
(7, 1006, 105, 1, 650.00),
(8, 1007, 103, 1, 3500.00),
(9, 1007, 104, 1, 4800.00),
(10, 1008, 104, 1, 4800.00),
(11, 1009, 101, 1, 1200.00),
(12, 1010, 102, 1, 2500.00),
(13, 1010, 107, 1, 200.00),
(14, 1011, 106, 1, 850.00),
(15, 1012, 103, 1, 3500.00),
(16, 1013, 101, 1, 1200.00),
(17, 1014, 105, 1, 650.00),
(18, 1015, 102, 1, 2500.00),
(19, 1016, 106, 1, 850.00),
(20, 1017, 101, 1, 1200.00),
(21, 1018, 103, 1, 3500.00),
(22, 1019, 104, 1, 4800.00),
(23, 1020, 108, 1, 350.00),
(24, 1021, 107, 1, 200.00),
(25, 1022, 104, 1, 4800.00),
(26, 1023, 103, 1, 3500.00);
