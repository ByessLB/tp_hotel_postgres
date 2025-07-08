-- ! Afficher la liste des hotêls (nom et ville)

    SELECT name, city FROM hotel;

-- ! Afficher la ville de résidence de Mr White

    SELECT last_name, first_name, city 
    FROM client
    WHERE last_name = 'White';

-- ! Afficher la liste des stations dont l'altiude < 1000

    SELECT h.name, s.altitude
    FROM hotel h
    JOIN station s
    ON h.station_id = s.id
    WHERE s.altitude > 1000;

-- ! Afficher la liste des chambres ayant une capacité > 1

    SELECT number, capacity
    FROM room
    WHERE capacity > 1;

-- ! Afficher les clients n'habitant pas à Londres

    SELECT last_name, city
    FROM client
    WHERE city != 'Londres';

-- ! Afficher la liste des hotêls située sur la ville de Bretou et possédant une catégorie > 3

    SELECT name, city, category
    FROM hotel
    WHERE city = 'Bretou'
    AND category > 3;