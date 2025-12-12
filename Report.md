# Лабораторная работа №1 — Нормализация данных в снежинку

**Студент:** *Алапанова Эльза*
**Группа:** *М8О-209СВ-24*

---

## Запуск

Для того, чтобы запустить код, нужно перейти в [Jupiter Notebook](./lab1.ipynb) и запускать по порядку в одной директории со всеми файлами (также нужно открыть Docker, и желательно установить DBeaver для работы с БД). 

## 1. Исходные данные

* Количество файлов: 10 CSV (`mock_data.csv`, `mock_data(1).csv` … `mock_data(9).csv`)
* Количество строк в каждом файле: 1000 → всего 10 000 строк
* Основные колонки:

| Категория      | Колонки                                                                                                                                      |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Покупатель     | first_name, last_name, age, email, country, postal_code, pet info                                                                            |
| Продавец       | first_name, last_name, email, country, postal_code                                                                                           |
| Товар          | name, category, price, quantity, pet_category, weight, size, brand, material, color, description, rating, reviews, release_date, expiry_date |
| Продажа (факт) | sale_date, quantity, total_price, customer_id, seller_id, product_id, store_id, supplier_id, pet_id                                          |
| Магазин        | name, location, city, state, country, phone, email                                                                                           |
| Поставщик      | name, contact, email, phone, address, city, country                                                                                          |

> Данные хранятся в папке `./data`.

![photo2](./photo/photo2.png)

---

## 2. Архитектура решения

1. **Docker Compose** запускает PostgreSQL с готовым volume для данных и скриптами инициализации.
2. **Python скрипты** в Jupyter Notebook:

   * Подключение к базе через `psycopg2`.
   * Загрузка CSV в staging таблицу `mock_raw`.
   * Создание dimension-таблиц: `dim_customer`, `dim_seller`, `dim_product`, `dim_store`, `dim_supplier`, `dim_pet`.
   * Загрузка факт-таблицы `fact_sales` через пакетные вставки (`execute_values`) с прогрессом.
3. **Проверка корректности загрузки** с помощью SQL и Pandas.

---

## 3. Структура базы данных

### 3.1 Таблицы измерений (Dimensions)

| Таблица        | Основные колонки                                                                      |
| -------------- | ------------------------------------------------------------------------------------- |
| `dim_customer` | customer_id, first_name, last_name, age, email, country, postal_code                  |
| `dim_seller`   | seller_id, first_name, last_name, email, country, postal_code                         |
| `dim_product`  | product_id, name, category, price, pet_category, weight, size, brand, material, color |
| `dim_store`    | store_id, name, location, city, state, country, phone, email                          |
| `dim_supplier` | supplier_id, name, contact, email, phone, address, city, country                      |
| `dim_pet`      | pet_id, pet_name, type, breed                                                         |

### 3.2 Факт-таблица (Fact)

| Таблица      | Основные колонки                                                                                    |
| ------------ | --------------------------------------------------------------------------------------------------- |
| `fact_sales` | sale_date, quantity, total_price, customer_id, seller_id, product_id, store_id, supplier_id, pet_id |

![photo1](./photo/photo1.png)
![photo3](./photo/photo3.png)
---

### 3.3 ER-диаграмма

![photo4](./photo/photo4.png)

* **Факты**: `fact_sales`
* **Измерения**: все `dim_` таблицы
* **Связи**: через первичные ключи (ID)

---

## 5. Основные SQL скрипты

### 5.1 Создание таблиц (DDL)

Создание таблиц измерений и фактов - [файл](./sql/ddl/create_dimensions.sql) и [файл](./sql/ddl/create_fact_table.sql)

```sql
-- Пример dim_customer
CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    email TEXT,
    country TEXT,
    postal_code TEXT
);
```
> Все dimension-таблицы созданы по аналогии.

---

## 6. Проверка корректности

```python
import pandas as pd
from sqlalchemy import create_engine

DB_URL = "postgresql+psycopg2://bigdata_user:bigdata_pass@localhost:5432/bigdata"
engine = create_engine(DB_URL)

# Проверка количества строк в факт-таблице
print(pd.read_sql("SELECT COUNT(*) FROM fact_sales", engine))

# Проверка размеров dimension-таблиц
sql_check = open("sql/checks/check_dim_sizes.sql").read()
print(pd.read_sql(sql_check, engine))
```

**Результат:**

| Таблица      | Строки |
| ------------ | ------ |
| fact_sales   | 10 000 |
| dim_customer | 10 000 |
| dim_seller   | 10 000 |
| dim_product  | 10 000 |
| dim_store    | 10 000 |
| dim_supplier | 10 000 |
| dim_pet      | 9 850  |

> Разница в `dim_pet` объясняется отсутствием уникальных питомцев в исходных данных.

---