# **CheeseDB**  
*A PostgreSQL database project for exploring cheeses, makers, and styles with advanced SQL queries and PL/pgSQL functions*  

![CheeseDB Schema Diagram](https://github.com/user-attachments/assets/d93cd737-7eb3-4c7b-bf8e-0d0a7dc7ce5b)


## **📖 Overview**  
CheeseDB is a **relational database project** developed for UNSW's COMP3311 (Database Systems). It models cheeses, their makers, styles, and origins, with:  
- **15+ SQL queries** for data analysis (e.g., popularity, aging outliers).  
- **PL/pgSQL functions** for dynamic search and reporting.  
- **Real-world dataset** of 100+ cheeses from global makers.  

**Key Features**:  
- 🧀 **Complex Queries**: Aggregate analytics (e.g., "most popular cheese style").  
- 🌍 **Geospatial Insights**: Identify top cheese-producing countries.  
- 🔍 **Flexible Search**: Case-insensitive maker lookup with formatted results.  

---

## **🛠️ Technologies**  
- **Database**: PostgreSQL  
- **Languages**: SQL, PL/pgSQL  
- **Tools**: `psql`, `pg_dump`, Git  
- **Concepts**: Joins, CTEs, Aggregates, Stored Procedures  

---

## **📂 Database Schema**  
```plaintext
Tables:
- cheeses      (id, name, style_id, made_by, aged_for, fat_percent)
- makers       (id, name, founded, located_in)
- styles       (id, name, origin, hardness, animal, min_aging, max_aging, notes)
- places       (id, town, region, country)
```

---

## **🎯 Key Queries & Functions**  

### **1. SQL Views**  
| Query | Description |  
|-------|-------------|  
| `Q1`  | Oldest cheese maker |  
| `Q4`  | Count cheeses by hardness (soft, hard, etc.) |  
| `Q6`  | Country producing the most distinct styles |  
| `Q7`  | Cheeses aged outside their style’s normal range |  

**Example**:  
```sql
-- Q5: Most popular cheese style (by production count)
CREATE OR REPLACE VIEW Q5(style) AS
WITH StyleCounts AS (
    SELECT s.name AS style, COUNT(*) AS n
    FROM cheeses c JOIN styles s ON c.style = s.id
    GROUP BY s.name
)
SELECT style FROM StyleCounts WHERE n = (SELECT MAX(n) FROM StyleCounts);
```

### **2. PL/pgSQL Functions**  
| Function | Description |  
|----------|-------------|  
| `Q8(partial_name)` | Search makers by partial name (case-insensitive) |  
| `Q9(partial_name)` | List all cheeses by matching makers (hierarchical format) |  

**Example**:  
```sql
-- Q8: Format maker locations (e.g., "Paris, France")
CREATE OR REPLACE FUNCTION Q8(partial_name text) RETURNS SETOF MakerPlace AS $$
BEGIN
    RETURN QUERY
    SELECT m.name, 
           COALESCE(p.town || ', ', '') || 
           COALESCE(p.region || ', ', '') || 
           p.country AS location
    FROM makers m JOIN places p ON m.located_in = p.id
    WHERE m.name ILIKE '%' || partial_name || '%'
    ORDER BY m.name;
END;
$$ LANGUAGE plpgsql;
```

---

## **🚀 Getting Started**  

### **Prerequisites**  
- PostgreSQL 12+  
- `psql` client  

### **Setup**  
1. **Load the database**:  
   ```bash
   createdb cheesedb
   psql cheesedb -f ass1.dump
   ```

2. **Run queries**:  
   ```bash
   psql cheesedb -f ass1.sql  # Load your solutions
   psql cheesedb -c "SELECT * FROM Q1;"  # Test views
   ```

3. **Test functions**:  
   ```sql
   -- In psql:
   SELECT * FROM Q8('dairy');
   SELECT * FROM Q9('bert');
   ```

---

## **📊 Example Outputs**  
| Query | Result |  
|-------|--------|  
| `Q1`  | `("Roquefort Société", 1863)` |  
| `Q4`  | `(soft, 12), (hard, 23), ...` |  
| `Q8('dairy')` | `("Dairy Farm", "Sydney, Australia")` |  

---

## **📜 License**  
MIT License. See [LICENSE](LICENSE) for details.  

---

## **🤝 Connect**  
Have questions or collaboration ideas? Reach out!  
- **Email**: richarddlong@gmail.com  
- **GitHub**: [eyesmool](https://github.com/eyesmool)  

---

