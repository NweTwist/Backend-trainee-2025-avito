-- users.sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('client', 'moderator', 'employee')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- pickup_points.sql
CREATE TABLE pickup_points (
    id SERIAL PRIMARY KEY,
    city VARCHAR(50) NOT NULL CHECK (city IN ('Москва', 'Санкт-Петербург', 'Казань')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- receptions.sql
CREATE TABLE receptions (
    id SERIAL PRIMARY KEY,
    pickup_point_id INTEGER REFERENCES pickup_points(id) NOT NULL,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP,
    status VARCHAR(20) NOT NULL CHECK (status IN ('in_progress', 'closed')) DEFAULT 'in_progress'
);

-- goods.sql
CREATE TABLE goods (
    id SERIAL PRIMARY KEY,
    reception_id INTEGER REFERENCES receptions(id) NOT NULL,
    added_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    type VARCHAR(20) NOT NULL CHECK (type IN ('electronics', 'clothing', 'shoes'))
);