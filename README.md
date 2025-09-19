# bookmyshow-clone

# 🎬 Movie Booking System (BookMyShow Clone)

This is a **Movie Ticket Booking & Show Scheduling System** inspired by BookMyShow.  
It demonstrates **database modeling**, **SQL queries**, and **basic cinema management** concepts.  

---

## 📌 Features
- Manage **Theatres** with location details  
- Manage **Movies** with duration  
- Multi-**Language** support (e.g., Tamil, Hindi, English, Telugu)  
- Manage **Show Timings** for multiple theatres  
- Optimized with **indexes** for faster queries  

---

## 🗂 Database Schema

### Tables
1. **theatres**
   - id (PK)  
   - theatre_name  
   - location_details  

2. **movies**
   - id (PK)  
   - name  
   - duration  

3. **languages**
   - id (PK)  
   - name  
   - short_name  

4. **show_details**
   - id (PK)  
   - theatres_id (FK → theatres.id)  
   - start_time (DATETIME)  
   - language_id (FK → languages.id)  
   - movie_id (FK → movies.id)  

### Indexes
- `(theatres_id, start_time)` → quick show lookup per theatre/day  
- `(movie_id, start_time)` → quick movie schedule lookup  
- `(language_id)` → filter shows by language  

---
