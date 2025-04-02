```markdown
# COMP3311 25T1 Assignment 1 Testing Script  
**Database Systems**  
*Last updated: Tuesday 4th March 10:51am*  
Most recent changes shown in **red**... older changes in **brown**.  
[Assignment Spec] [Database Design] [Examples] [Testing]  

## Pre-conditions  
1. Logged in to `vxdb02`  
2. PostgreSQL server running (`source /localstorage/$USER/env; p1`)  
3. In directory containing `ass1.sql`  
**Note**: `ass1.sql` must load without errors (comment out incomplete views/functions).  

## Running Tests  
```bash
$ 3311 autotest ass1
```  

### Successful Output Example  
```bash
$ 3311 autotest ass1
./sql_create schema.sql ass1.sql TRUE # ass1.sql

--- Loading Database Dump ---
CREATE TYPE... [output truncated]...

--- Loading Student Submission ---
CREATE VIEW... [output truncated]...

./sql_clean ass1.sql
Test Dump0_Q0_Create_Database... - passed
[...27 total tests passed...]
```  

## Testing Individual Components  
```bash
$ 3311 autotest ass1 Q0 Q8  # Q0 always required
```  

### Individual Test Output  
```bash
[...similar truncated output...]
9 tests passed 0 tests failed
```  

## Troubleshooting  
- **Error**: `could not be run because check failed`  
  - Check `--- Loading Student Submission ---` for ERROR/WARNING messages (NOTICE is OK).  
```
