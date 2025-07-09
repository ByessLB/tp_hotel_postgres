-- ! Compter le nombre d'hôtel par staion

    SELECT s.name, COUNT(h.id) AS hotel_count
    FROM station s
    JOIN hotel h
    ON s.id = h.station_id
    GROUP BY s.name;


-- ! Compter le nombre de chambre par station

    SELECT s.name, COUNT(r.id) AS room_count
    FROM station s
    JOIN hotel h
    ON s.id = h.station_id
    JOIN room r
    ON h.id = r.hotel_id
    GROUP BY s.name;


-- ! Comtper le nombre de chambre par station ayant une capacité > 1

    SELECT s.name, COUNT(r.id) AS room_count
    FROM station s
    JOIN hotel h
    ON s.id = h.station_id
    JOIN room r
    ON h.id = r.hotel_id
    WHERE r.capacity > 1
    GROUP BY s.name;

-- ! Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation

    SELECT c.last_name AS client, h.name AS hotel
    FROM hotel h
    JOIN room r
    ON h.id = r.hotel_id
    JOIN booking b
    ON r.id = b.room_id
    JOIN client c
    ON c.id = b.client_id
    WHERE c.last_name = 'Squire';

-- ! Afficher la durée moyenne des réservations par station

    SELECT s.name AS station_name, AVG(b.stay_end_date - b.stay_start_date) AS moyenne_resa
    FROM station s
    JOIN hotel h
    ON s.id = h.station_id
    JOIN room r
    ON h.id = r.hotel_id
    JOIN booking b
    ON r.id = b.room_id
    GROUP BY s.name;