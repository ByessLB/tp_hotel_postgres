-- ! Afficher la liste des hotêls avec leur station (nom station, nom hôtel, catégorie, ville)

    SELECT s.name, h.name, h.category, h.city
    FROM station s
    JOIN hotel h
    ON h.station_id = s.id;

-- ! Afficher la liste des chambres et leur hôtel (nom hôtel, catégorie, ville, numéro chambre)

    SELECT h.name, h.category, h.city, r.number
    FROM hotel h
    JOIN room r
    ON h.id = r.hotel_id;

-- ! Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou
-- ! (nom hôtel, catégorie, ville, numéro chambre, capacité)

    SELECT h.name, h.category, h.city, r.number, r.capacity
    FROM hotel h
    JOIN room r
    ON h.id = r.hotel_id
    WHERE h.city = 'Bretou'
    AND r.capacity > 1;

-- ! Afficher la liste des réservations avec le nom des clients (nom client, nom hôtel, date résa)

    SELECT c.last_name, h.name, b.booking_date
    FROM hotel h
    JOIN room r
    ON h.id = r.hotel_id
    JOIN booking b
    ON b.room_id = r.id
    JOIN client c
    ON b.client_id = c.id;

-- ! Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station (nom station,
-- ! nom hôtel, numéro chambre, capacité)

    SELECT s.name AS station, h.name AS hotel, r.number, r.capacity
    FROM hotel h
    JOIN station s
    ON s.id = h.station_id
    JOIN room r
    ON h.id = r.hotel_id;

-- ! Afficher les rservations avec le nom du client et le nom de l'hôtel (nom client, nom hôtel, date 
-- ! début séjour, durée séjour)

    SELECT c.last_name, h.name AS hotel, b.stay_start_date,b.stay_end_date
    FROM hotel h
    JOIN room r
    ON h.id = r.hotel_id
    JOIN booking b
    ON b.room_id = r.id
    JOIN client c
    ON b.client_id = c.id;