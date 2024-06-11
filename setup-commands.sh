cd sql-practice

# Remove database file (if run multiple times)

rm practice.db 2> /dev/null || true

# Getting started

npm install

# Add seed data

sqlite3 practice.db ".read cats.sql"

sqlite3 practice.db ".read toys.sql"

sqlite3 practice.db ".read cat_toys.sql"

# Check seed data

sqlite3 ".mode box"

echo "----- Tables Exist? -----"
sqlite3 practice.db ".schema"

echo "----- Tables Have Data? -----"
sqlite3 practice.db "SELECT 'cats_count', count(id) FROM cats;"
sqlite3 practice.db "SELECT 'toys_count', count(id) FROM toys;"
sqlite3 practice.db "SELECT 'cat_toys_count', count(id) FROM cat_toys;"


echo "----- Step 0 Create Query -----"
sqlite3 practice.db ".mode box SELECT * FROM cats JOIN cat_toys ON cat_toys.cat_id = cats.id WHERE toy_id = 5;"

echo "----- Step 1 Analyze Query -----"
sqlite3 practice.db "
EXPLAIN QUERY PLAN
SELECT * FROM cats
JOIN cat_toys ON cat_toys.cat_id = cats.id
WHERE toy_id = 5;"
