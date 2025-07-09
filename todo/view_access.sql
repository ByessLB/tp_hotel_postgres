-- ! CREATION DE VUE

-- ! Example de création : Afficher la liste d'hôtel avec le nom des stations

    CREATE OR REPLACE VIEW hotel_station
    AS
    SELECT h.id AS hotel_id,
        h.station_id,
        h.name as hotel_name,
        h.category,
        h.address,
        h.city,
        s.name AS station_name,
        s.altitude
    FROM hotel h
    JOIN station s ON h.station_id = s.id;

-- ! Afficher la liste des réservations avec le nom des clients

    CREATE OR REPLACE VIEW client_reservation
    AS
    SELECT b.id AS reservation_id,
    b.room_id,
    b.client_id,
    b.booking_date,
    b.stay_start_date,
    b.stay_end_date,
    b.price,
    b.deposit,
    c.first_name,
    c.last_name,
    c.address AS address_client,
    c.city AS city_client
    FROM booking b
    JOIN client c ON b.client_id = c.id;


-- ! Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station
-- ? Requête dépendante de la vue "hotel_station"

    CREATE OR REPLACE VIEW rooms_hotel_on_station
    AS
    SELECT r.id AS room_id,
    r.hotel_id,
    r.number,
    r.capacity,
    r.type,
    rh.station_id,
    rh.hotel_name,
    rh.category,
    rh.address AS address_hotel,
    rh.city AS city_hotel,
    rh.station_name,
    rh.altitude
    FROM room r
    JOIN hotel_station rh ON r.hotel_id = rh.hotel_id;

-- ! Afficher les réservations avec le nom du client et le nom de l'hôtel
-- ? Requête dépendante de la vue "client_reservation"

    CREATE OR REPLACE VIEW client_reserved_hotel
    AS
    SELECT cr.reservation_id,
    cr.room_id,
    cr.client_id,
    cr.booking_date,
    cr.stay_start_date,
    cr.stay_end_date,
    cr.price,
    cr.deposit,
    cr.first_name,
    cr.last_name,
    cr.address_client,
    cr.city_client,
    h.name AS name_hotel,
    h.category,
    h.address AS address_hotel,
    h.city AS city_hotel
    FROM client_reservation cr
    JOIN room r ON cr.room_id = r.id
    JOIN hotel h ON r.hotel_id = h.id;


-- ! PRIVILEGES

-- ! Accorder les privilèges "SELECT", "INSERT", "UPDATE" et "DELETE" à
-- ! l'utiliateur "application_admin" sur toutes les tables sauf "station".

    GRANT SELECT, INSERT, UPDATE, DELETE
    ON ALL TABLES
    IN SCHEMA public
    TO application_admin;

    REVOKE ALL ON public.station
    FROM application_admin;


-- ! Essayez d'effectuer des requêtes

-- ! Créer un nouveau rôle "application_client"

    CREATE ROLE application_client
    LOGIN
    PASSWORD client;

-- ! Ajoutez les privilèges de lecture des données uniquement sur
-- ! la vue permettant de retrouver chambres avec nom de l'hôtel et
-- ! le nom de la station

    GRANT SELECT
    ON rooms_hotel_on_station
    TO application_client;