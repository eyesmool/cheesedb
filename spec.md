# COMP3311 25T1 Assignment 1  
**Queries and Functions on CheeseDB**  
**Database Systems**  
*Last updated: Tuesday 4th March 8:42am*  
*Most recent changes are shown in red ... older changes are shown in brown.*  

[Assignment Spec] | [Database Design] | [Examples] | [Testing]

## Aims  
This assignment aims to give you practice in:  
- Reading and understanding a small relational schema (Cheese DB)  
- Implementing SQL queries and views to satisfy requests for information  
- Implementing PLpgSQL functions to aid in satisfying requests for information  

The goal is to build some useful data access operations on the Cheese database, which contains information about cheeses.

## Summary  
| Item | Details |
|------|---------|
| **Submission** | Login to Course Web Site > Assignments > Assignment 1 > [Submit] > upload `ass1.sql` or, on a CSE server, `give cs3311 ass1 ass1.sql` |
| **Required Files** | `ass1.sql` (contains both SQL views and PLpgSQL functions) |
| **Deadline** | 23:59:59 Friday 21st March 2025 |
| **Marks** | 13 marks toward your total mark for this course |
| **Late Penalty** | 0.2% off the achieved mark for each hour late, for 5 days |

## Background  
According to Wikipedia, cheese is "a type of dairy product produced in a range of flavors, textures, and forms by coagulation of the milk protein casein". According to me, cheese is delicious.

### Introduction  
The database contains information about:  
- Cheeses (names, styles, makers, aging time, fat content)  
- Cheese makers (location, founding year)  
- Cheese styles (name, origin, hardness, milk source, aging time)  
- Locations (from specific towns to entire countries)  

## Your Tasks  
Complete the following questions by implementing SQL views and PLpgSQL functions in `ass1.sql`.

### Q0 (2 marks) Style mark  
Ensure your SQL and PLpgSQL code follows consistent style conventions.

### Q1 (1 mark)  
Write an SQL view `Q1(maker,founded)` that returns the name of the oldest cheese maker and the year they were founded.

### Q2 (1 mark)  
Write an SQL view `Q2(cheese,maker)` that returns cheeses whose name exactly matches their style name.

### Q3 (1 mark)  
Write an SQL view `Q3(cheese,maker)` that returns cheeses described as "crumbly" in their style notes.

### Q4 (1 mark)  
Write an SQL view `Q4(hardness,ncheeses)` that lists hardness levels and cheese counts per level, ordered by hardness.

### Q5 (1 mark)  
Write an SQL view `Q5(style)` that returns the most popular cheese style.

### Q6 (2 marks)  
Write an SQL view `Q6(country)` that returns the country producing the most distinct cheese styles.

### Q7 (2 marks)  
Write an SQL view `Q7(cheese,maker,aged,min_aging,max_aging)` listing cheeses aged outside their style's normal range.

### Q8 (3 marks)  
Write a PLpgSQL function `Q8(partial_name text)` that returns cheese makers matching a partial name (case-insensitive) with formatted location info.

### Q9 (4 marks)  
Write a PLpgSQL function `Q9(partial_name text)` that returns cheese makers and their cheeses in a specific hierarchical format.

## Submission and Testing  
Your submission will be tested by:  
1. Creating a new database with the schema  
2. Loading your `ass1.sql`  
3. Running automated marking  
4. Repeating with different test data  

**Important**:  
- Your code must load without errors  
- Queries must execute within 3 seconds  
- Test thoroughly on vxdb02 before submitting  

## Responsibilities  
### Our Commitment:  
- Release assignments on time  
- Mark within two weeks  
- Respond to questions within two business days  
- Provide regular consultation hours  

### Your Responsibilities:  
- Read and understand requirements  
- Maintain academic integrity  
- Test solutions before submitting  
- Check for updates regularly  
