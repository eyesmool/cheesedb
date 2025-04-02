# COMP3311 25T1 Assignment 1 Example Test Cases

**Database Systems**  
Last updated: Tuesday 4th March 2:32am  
Most recent changes are shown in red ... older changes are shown in brown.  
[Assignment Spec] [Database Design] [Examples] [Testing]

The following gives some sample inputs and outputs that you can use to estimate the correctness of your views and functions. More cases will be used in the auto-marking; it is up to you to perform comprehensive checking of your solution.

## Examples for cheese DB

### Expected output for assignment views

```sql
ass1=# select * from q1 order by maker;
      maker      | founded 
-----------------+---------
 Kaeserei Herzog |    1895
(1 row)


ass1=# select * from q2 order by cheese,maker;
       cheese        |           maker           
---------------------+---------------------------
 Brillat-Savarin     | Fromagerie Berthaut
 Comte               | La Fromagerie de la Combe
 Emmental            | Swiss Alpine Cheese
 Feta                | Caseificio San Pietro
 Gouda               | Kaeserei Herzog
 Gruyere             | Swiss Alpine Cheese
 Manchego            | Caseificio San Pietro
 Monterey Jack       | Tillamook Creamery
 Parmigiano-Reggiano | Caseificio Il Fiorino
(9 rows)


ass1=# select * from q3 order by cheese,maker;
            cheese             |                maker                 
-------------------------------+--------------------------------------
 Beenleigh Blue                | Ticklemore Cheese Dairy
 Black Label Triple Cream Blue | King Island Dairy Co
 Devon Blue                    | Ticklemore Cheese Dairy
 Endeavour Blue                | King Island Dairy Co
 Gorgonzola                    | Cheese Factory of the Alps
 Harbourne Blue                | Ticklemore Cheese Dairy
 Heysen Blue                   | Udder Delights
 Mawson Blue                   | Udder Delights
 Point Reyes Original Blue     | Point Reyes Farmstead Cheese Company
 Red Storm                     | Snowdonia Cheese Co
 Roaring Forties               | King Island Dairy Co
 Rogue River Blue              | Rogue Creamery
 Roquefort                     | Fromagerie Chabert
 Stinking Bishop               | Charles Martell and Sons
(14 rows)


ass1=# select * from q4 order by hardness;
 hardness  | ncheeses 
-----------+----------
 soft      |       24
 semi-soft |       16
 semi-hard |       26
 hard      |        5
(4 rows)


ass1=# select * from q5 order by style;
  style  
---------
 Cheddar
(1 row)


ass1=# select * from q6 order by country;
 country 
---------
 France
 USA
(2 rows)

ass1=# select * from q7 order by cheese,maker;
               cheese               |                maker                 |     aged      | min_aging | max_aging 
------------------------------------+--------------------------------------+---------------+-----------+-----------
 Ash Brie                           | Udder Delights                       | 2 mons        | 35 days   | 42 days
 Black Label Brie                   | King Island Dairy Co                 | 3 mons        | 35 days   | 42 days
 Brillat-Savarin                    | Fromagerie Berthaut                  | 21 days       | 7 days    | 14 days
 Cambozola                          | Fromagerie du Presbytere             | 3 mons        | 21 days   | 42 days
 Cape Wickham Double Brie           | King Island Dairy Co                 | 3 mons        | 35 days   | 42 days
 Capra Bianca Aged Goat Cheddar     | Sierra Nevada Cheese Company         | 9 mons        | 28 days   | 70 days
 Classic Camembert                  | Jindi Dairy                          | 2 mons        | 21 days   | 42 days
 Devon Blue                         | Ticklemore Cheese Dairy              | 140 days      | 1 mon     | 4 mons
 Double Cream Brie                  | Jindi Dairy                          | 3 mons        | 35 days   | 42 days
 Extra Sharp Cheddar                | Henning's Cheese                     | 10 years      | 3 mons    | 2 years
 Furneaux Double Cream              | King Island Dairy Co                 | 3 mons        | 35 days   | 42 days
 Half Moon Bay Double Brie          | King Island Dairy Co                 | 3 mons        | 35 days   | 42 days
 Humboldt Fog                       | Cypress Grove                        | 2 mons        | 7 days    | 14 days
 Jindi Brie                         | Jindi Dairy                          | 2 mons        | 35 days   | 42 days
 Jindi Camembert                    | Jindi Dairy                          | 3 mons        | 21 days   | 42 days
 Le Buffalo                         | Fromagerie Chabert                   | 1 mon         | 1 day     | 1 day
 Lighthouse Blue Brie               | King Island Dairy Co                 | 3 mons        | 35 days   | 42 days
 Lion Heart the Good Brie           | Fromagerie Berthaut                  | 2 mons        | 35 days   | 42 days
 Netherby Cove Camembert            | King Island Dairy Co                 | 2 mons        | 21 days   | 42 days
 Phoques Cove Camembert             | King Island Dairy Co                 | 2 mons        | 21 days   | 42 days
 Point Reyes Original Blue          | Point Reyes Farmstead Cheese Company | 9 mons        | 1 mon     | 4 mons
 Red Storm                          | Snowdonia Cheese Co                  | 1 year        | 3 mons    | 9 mons
 Rogue River Blue                   | Rogue Creamery                       | 1 year 3 mons | 1 mon     | 4 mons
 Rustic Camembert                   | Fromagerie Berthaut                  | 2 mons        | 21 days   | 42 days
 Saint-Nectaire                     | Fromagerie Chabert                   | 3 mons        | 42 days   | 70 days
 Seal Bay Triple Cream Brie         | King Island Dairy Co                 | 2 mons        | 35 days   | 42 days
 Three Rivers Bay Triple Cream Brie | King Island Dairy Co                 | 2 mons        | 35 days   | 42 days
 Triple Cream Brie                  | Jindi Dairy                          | 3 mons        | 35 days   | 42 days
 Truffle Brie                       | Udder Delights                       | 2 mons        | 35 days   | 42 days
 Victoria Cove Smoked Camembert     | King Island Dairy Co                 | 2 mons        | 21 days   | 42 days
(30 rows)


ass1=# select * from q8('bert');
        maker        |        location        
---------------------+------------------------
 Fromagerie Berthaut | Burgundy, France
 Fromagerie Chabert  | Thones, Savoie, France
(2 rows)

ass1=# select * from q8('dairy');
          maker          |            location             
-------------------------+---------------------------------
 Jindi Dairy             | Gippsland, Australia
 King Island Dairy Co    | Loorana, King Island, Australia
 Neals Yard Dairy        | London, UK
 Ticklemore Cheese Dairy | Totnes, Devon, UK
(4 rows)

ass1=# select * from q8('ee');
                maker                 |           location           
--------------------------------------+------------------------------
 Cheese Factory of the Alps           | Savoie, France
 Henning's Cheese                     | Kiel, Wisconsin, USA
 Point Reyes Farmstead Cheese Company | Point Reyes, California, USA
 Sierra Nevada Cheese Company         | Willows, California, USA
 Snowdonia Cheese Co                  | Snowdonia, Wales
 Swiss Alpine Cheese                  | Emmental, Switzerland
 Ticklemore Cheese Dairy              | Totnes, Devon, UK
(7 rows)

ass1=# select * from q8('o');
                maker                 |            location             
--------------------------------------+---------------------------------
 Cabot Creamery                       | Waitsfield, Vermont, USA
 Caseificio Il Fiorino                | Tuscany, Italy
 Caseificio San Pietro                | Sicily, Italy
 Charles Martell and Sons             | Dymock, Gloucestershire, UK
 Cheese Factory of the Alps           | Savoie, France
 Cypress Grove                        | Arcata, California, USA
 Fromagerie Berthaut                  | Burgundy, France
 Fromagerie Chabert                   | Thones, Savoie, France
 Fromagerie du Presbytere             | Quebec, Canada
 Kaeserei Herzog                      | Emmental, Switzerland
 King Island Dairy Co                 | Loorana, King Island, Australia
 La Fromagerie de la Combe            | Jura, Switzerland
 Point Reyes Farmstead Cheese Company | Point Reyes, California, USA
 Rogue Creamery                       | Grants Pass, Oregon, USA
 Sierra Nevada Cheese Company         | Willows, California, USA
 Snowdonia Cheese Co                  | Snowdonia, Wales
 Ticklemore Cheese Dairy              | Totnes, Devon, UK
 Tillamook Creamery                   | North Tillamook, Oregon, USA
(18 rows)


ass1=# select * from q9('ick');
          maker          |     cheese     | style 
-------------------------+----------------+-------
 Ticklemore Cheese Dairy | Beenleigh Blue | Blue
                         | Devon Blue     | Blue
                         | Harbourne Blue | Blue
(3 rows)

ass1=# select * from q9('dairy');
          maker          |               cheese               |   style    
-------------------------+------------------------------------+------------
 Jindi Dairy             | Classic Camembert                  | Camembert
                         | Double Cream Brie                  | Brie
                         | Jindi Brie                         | Brie
                         | Jindi Camembert                    | Camembert
                         | Triple Cream Brie                  | Brie
 King Island Dairy Co    | Black Label Brie                   | Brie
                         | Black Label Cheddar                | Cheddar
                         | Black Label Triple Cream Blue      | Blue
                         | Cape Wickham Double Brie           | Brie
                         | Endeavour Blue                     | Gorgonzola
                         | Furneaux Double Cream              | Brie
                         | Half Moon Bay Double Brie          | Brie
                         | Lighthouse Blue Brie               | Brie
                         | Netherby Cove Camembert            | Camembert
                         | Phoques Cove Camembert             | Camembert
                         | Roaring Forties                    | Blue
                         | Seal Bay Triple Cream Brie         | Brie
                         | Stokes Point Smoked Cheddar        | Cheddar
                         | Surprise Bay Cheddar               | Cheddar
                         | Three Rivers Bay Triple Cream Brie | Brie
                         | Victoria Cove Smoked Camembert     | Camembert
 Ticklemore Cheese Dairy | Beenleigh Blue                     | Blue
                         | Devon Blue                         | Blue
                         | Harbourne Blue                     | Blue
(24 rows)

ass1=# select * from q9('xx');
 maker | cheese | style 
-------+--------+-------
(0 rows)
