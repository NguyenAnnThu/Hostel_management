DROP DATABASE IF EXISTS cs_property_management;
CREATE DATABASE cs_property_management;
USE cs_property_management;

/* ================= USERS ================= */
CREATE TABLE users (
    user_id CHAR(6) PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    status VARCHAR(20), -- active / locked
    citizen_id VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);

/* ================= ACCOUNTS ================= */
CREATE TABLE accounts (
    phone VARCHAR(20) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL, -- OWNER / TENANT / ADMIN
    FOREIGN KEY (phone) REFERENCES users(phone)
);

/* ================= ROOMS ================= */
CREATE TABLE rooms (
    room_id VARCHAR(6) PRIMARY KEY,
    floor INT NOT NULL CHECK (floor >= 0),
    area FLOAT NOT NULL CHECK (area > 0),
    price DECIMAL(12,2) NOT NULL CHECK (price > 0),
    max_occupants INT NOT NULL CHECK (max_occupants > 0),
    description TEXT,
    status VARCHAR(20) NOT NULL 
        CHECK (status IN ('available', 'rented', 'maintenance')),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME
);

/* ================= SERVICES ================= */
CREATE TABLE services (
    service_code VARCHAR(20) PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    service_type VARCHAR(20) NOT NULL, -- electricity / water / fixed
    unit VARCHAR(50),
    default_price DECIMAL(12,2) NOT NULL,
    status VARCHAR(20)
);

/* ================= ASSETS ================= */
CREATE TABLE assets (
    asset_code VARCHAR(10) PRIMARY KEY,
    asset_name VARCHAR(100) NOT NULL,
    asset_type VARCHAR(50), -- bed, fan, air_conditioner...
    total_quantity INT NOT NULL CHECK (total_quantity >= 0),
    available_quantity INT NOT NULL CHECK (available_quantity >= 0),
    status VARCHAR(20) NOT NULL 
        CHECK (status IN ('available', 'out_of_stock', 'inactive')),
    note VARCHAR(255)
);

/* ================= ROOM ASSETS ================= */
CREATE TABLE room_assets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_id VARCHAR(6) NOT NULL,
    asset_code VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (asset_code) REFERENCES assets(asset_code),
    UNIQUE (room_id, asset_code)
);

/* ================= ROOM BOOKING ================= */
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id VARCHAR(6) NOT NULL,
    customer_id CHAR(6) NOT NULL,
    booking_date DATETIME,
    expire_date DATETIME,
    status VARCHAR(20), -- pending / cancelled / confirmed
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (customer_id) REFERENCES users(user_id)
);

/* ================= CONTRACTS ================= */
CREATE TABLE contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id VARCHAR(6) NOT NULL,
    customer_id CHAR(6) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    deposit DECIMAL(12,2) NOT NULL,
    status VARCHAR(20), -- active / ended
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (customer_id) REFERENCES users(user_id)
);

/* ================= TENANTS IN ROOMS ================= */
CREATE TABLE room_tenants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(6) NOT NULL,
    room_id VARCHAR(6) NOT NULL,
    role VARCHAR(30) NOT NULL COMMENT 'contract_owner / co_tenant',
    move_in_date DATE NOT NULL,
    move_out_date DATE DEFAULT NULL,
    status VARCHAR(20) NOT NULL COMMENT 'staying / left',
    note VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE,
    UNIQUE (user_id, room_id, move_in_date)
);

/* ================= SERVICE USAGE (METER READING) ================= */
CREATE TABLE service_meters (
    meter_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id VARCHAR(6) NOT NULL,
    service_code VARCHAR(20) NOT NULL,
    month INT CHECK (month BETWEEN 1 AND 12),
    year INT,
    old_value INT NOT NULL,
    new_value INT NOT NULL,
    record_date DATETIME,
    CHECK (new_value >= old_value),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (service_code) REFERENCES services(service_code)
);

/* ================= SERVICE PRICE CONFIG ================= */
CREATE TABLE service_price_config (
    config_id INT AUTO_INCREMENT PRIMARY KEY,
    service_code VARCHAR(20) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (service_code) REFERENCES services(service_code)
);

/* ================= INVOICES ================= */
CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    room_id VARCHAR(6) NOT NULL,
    customer_id CHAR(6) NOT NULL,
    month INT,
    year INT,
    qr_code VARCHAR(255),
    status VARCHAR(20), -- unpaid / paid
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (customer_id) REFERENCES users(user_id)
);

/* ================= INVOICE DETAILS ================= */
CREATE TABLE invoice_details (
    invoice_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    service_code VARCHAR(20) NOT NULL,
    quantity INT,
    unit_price DECIMAL(12,2),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (service_code) REFERENCES services(service_code)
);


/* ================= PAYMENT CONFIRMATION ================= */
CREATE TABLE payment_confirmations (
    confirmation_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT UNIQUE,
    confirmed_by CHAR(6),
    confirmed_at DATETIME,
    note VARCHAR(255),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (confirmed_by) REFERENCES users(user_id)
);
drop table payment_confirmations;
/*================== INSERT DU LIEU================*/

-- ================= USERS =================
INSERT INTO users (user_id, full_name, phone, email, status, citizen_id, address, date_of_birth)
VALUES
('U00001', 'Admin System', '0900000001', 'admin@cs.com', 'active', '012345678901', 'HCM City', '1990-01-01'),
('U00002', 'Nguyen Van Chu', '0900000002', 'owner@cs.com', 'active', '012345678902', 'HCM City', '1985-05-10'),

('U00003', 'Tran Thi Lan', '0900000003', 'lan@gmail.com', 'active', '012345678903', 'District 1', '2000-03-12'),
('U00004', 'Le Minh Tuan', '0900000004', 'tuan@gmail.com', 'active', '012345678904', 'District 3', '1998-08-20'),
('U00005', 'Pham Ngoc Anh', '0900000005', 'anh@gmail.com', 'active', '012345678905', 'District 5', '1999-11-02'),

('U00006', 'Vo Duc Long', '0900000006', 'long@gmail.com', 'active', '012345678906', 'District 7', '1997-06-15'),
('U00007', 'Bui Thanh Hoa', '0900000007', 'hoa@gmail.com', 'active', '012345678907', 'District 10', '1996-09-09'),

('U00008', 'Dang Quoc Viet', '0900000008', 'viet@gmail.com', 'locked', '012345678908', 'Thu Duc', '2001-12-01'),
('U00009', 'Support Staff', '0900000009', 'support@cs.com', 'active', '012345678909', 'HCM City', '1992-04-04'),
('U00010', 'Test User', '0900000010', 'test@cs.com', 'active', '012345678910', 'Binh Thanh', '2002-02-02');
select* from users;
select* from accounts;
-- ================= ACCOUNTS =================
INSERT INTO accounts (phone, password, role)
VALUES
('0900000001', '$2a$12$adminhashedpasswordxxxxxxxxxxxx', 'ADMIN'),
('0900000002', '$2a$12$ownerhashedpasswordxxxxxxxxxxxx', 'OWNER'),

('0900000003', '$2a$12$lanhashedpasswordxxxxxxxxxxxx', 'TENANT'),
('0900000004', '$2a$12$tuanhashedpasswordxxxxxxxxxxxx', 'TENANT'),
('0900000005', '$2a$12$anhhashedpasswordxxxxxxxxxxxx', 'TENANT'),

('0900000006', '$2a$12$longhashedpasswordxxxxxxxxxxxx', 'TENANT'),
('0900000007', '$2a$12$hoahashedpasswordxxxxxxxxxxxx', 'TENANT'),
('0900000008', '$2a$12$viethashedpasswordxxxxxxxxxxxx', 'TENANT'),

('0900000009', '$2a$12$supporthashedpasswordxxxxxxxxxxxx', 'ADMIN'),
('0900000010', '$2a$12$testhashedpasswordxxxxxxxxxxxx', 'TENANT');
 
 select* from rooms;
-- ================= ROOMS =================
INSERT INTO rooms (room_id, floor, area, price, max_occupants, description, status)
VALUES
('R101', 1, 20, 2500000, 2, 'Room with balcony', 'rented'),
('R102', 1, 18, 2200000, 2, 'Standard room', 'available'),
('R201', 2, 25, 3000000, 3, 'Large room', 'rented'),
('R202', 2, 22, 2700000, 2, 'Quiet room', 'maintenance'),
('R301', 3, 30, 3500000, 4, 'Premium room', 'rented');


 select* from services;
-- ================= SERVICES =================
INSERT INTO services (service_code, service_name, service_type, unit, default_price, status)
VALUES
('ELEC', 'Electricity', 'electricity', 'kWh', 3500, 'active'),
('WATER', 'Water', 'water', 'm3', 15000, 'active'),
('GARBAGE', 'Garbage Fee', 'fixed', 'month', 30000, 'active'),
('WIFI', 'Internet', 'fixed', 'month', 100000, 'active'),
('MANAGE', 'Management Fee', 'fixed', 'month', 50000, 'active');

 select* from assets;
-- ================= ASSETS =================
INSERT INTO assets (asset_code, asset_name, asset_type, total_quantity, available_quantity, status)
VALUES
('BED', 'Bed', 'furniture', 10, 5, 'available'),
('WARD', 'Wardrobe', 'furniture', 10, 5, 'available'),
('AC', 'Air Conditioner', 'electronic', 5, 2, 'available'),
('FAN', 'Fan', 'electronic', 8, 3, 'available');

-- ================= ROOM_ASSETS =================
SELECT * FROM room_assets;
INSERT INTO room_assets (room_id, asset_code, quantity)
VALUES
('R101', 'BED', 1),
('R101', 'AC', 1),

('R201', 'BED', 1),
('R201', 'WARD', 1),

('R301', 'BED', 1),
('R301', 'FAN', 1);


select *from service_price_config;
-- ================= SERVICE_PRICE_CONFIG =================
INSERT INTO service_price_config (service_code, price, effective_date)
VALUES
('ELEC', 3500, '2025-01-01'),
('WATER', 15000, '2025-01-01'),
('GARBAGE', 30000, '2025-01-01'),
('WIFI', 100000, '2025-01-01'),
('MANAGE', 50000, '2025-01-01');

-- ================= BOOKINGS =================
INSERT INTO bookings (room_id, customer_id, booking_date, expire_date, status)
VALUES
('R101', 'U00003', '2025-01-05', '2025-01-10', 'confirmed'),
('R201', 'U00004', '2025-01-06', '2025-01-11', 'confirmed'),
('R301', 'U00005', '2025-01-07', '2025-01-12', 'confirmed');

-- ================= CONTRACTS =================
INSERT INTO contracts (room_id, customer_id, start_date, end_date, deposit, status)
VALUES
('R101', 'U00003', '2025-02-01', '2026-01-31', 2500000, 'active'),
('R201', 'U00004', '2025-02-01', '2026-01-31', 3000000, 'active'),
('R301', 'U00005', '2025-02-01', '2026-01-31', 3500000, 'active');
-- ================= ROOM_TENANTS =================
INSERT INTO room_tenants (user_id, room_id, role, move_in_date, status)
VALUES
('U00003', 'R101', 'contract_owner', '2025-02-01', 'staying'),
('U00004', 'R201', 'contract_owner', '2025-02-01', 'staying'),
('U00005', 'R301', 'contract_owner', '2025-02-01', 'staying');

-- ================= SERVICE_METERS =================
INSERT INTO service_meters (room_id, service_code, month, year, old_value, new_value, record_date)
VALUES
('R101', 'ELEC', 2, 2025, 1200, 1250, '2025-02-28'),
('R101', 'WATER', 2, 2025, 30, 33, '2025-02-28'),

('R101', 'ELEC', 3, 2025, 1250, 1305, '2025-03-31'),
('R101', 'WATER', 3, 2025, 33, 36, '2025-03-31');

SELECT * FROM invoice_details;
-- ================= PAYMENT_CONFIRMATIONS =================
SELECT * FROM payment_confirmations;
INSERT INTO payment_confirmations (invoice_id, confirmed_by, confirmed_at, note)
VALUES
(3, 'U00001', '2025-02-28 20:15:00', 'Payment confirmed by admin');

SELECT invoice_id, month, year, status
FROM invoices;

-- ================= INVOICES =================
INSERT INTO invoices (contract_id, room_id, customer_id, month, year, status)
VALUES
(1, 'R101', 'U00003', 2, 2025, 'paid'),
(1, 'R101', 'U00003', 3, 2025, 'unpaid');


INSERT INTO invoice_details (invoice_id, service_code, quantity, unit_price)
VALUES
-- Invoice PAID
(3, 'ELEC', 50, 3500),
(3, 'WATER', 3, 15000),
(3, 'GARBAGE', 1, 30000),
(3, 'WIFI', 1, 100000),
(3, 'MANAGE', 1, 50000),

-- Invoice UNPAID
(4, 'ELEC', 55, 3500),
(4, 'WATER', 3, 15000),
(4, 'GARBAGE', 1, 30000),
(4, 'WIFI', 1, 100000),
(4, 'MANAGE', 1, 50000);
SELECT invoice_id, contract_id, month, year, status
FROM invoices;


SELECT 
    s.service_name,
    SUM(d.quantity * d.unit_price) AS revenue
FROM invoice_details d
JOIN invoices i ON d.invoice_id = i.invoice_id
JOIN services s ON d.service_code = s.service_code
WHERE i.status = 'paid'
GROUP BY s.service_name;
SELECT * 
FROM invoice_details
WHERE invoice_id = 1;

SELECT 
    i.room_id,
    SUM(d.quantity * d.unit_price) AS revenue
FROM invoices i
JOIN invoice_details d ON i.invoice_id = d.invoice_id
WHERE i.status = 'paid'
GROUP BY i.room_id;

