--! ATTENTION : l'initialisation des tables fait qu'il est nécessaire d'altérer la séquence 
--! des "id" qui sont en auto-incrémentation

-- ! ALTER SEQUENCE [séquence visé] RESTART [valeur souhaité]

--? Insérer au moins 2 stations

INSERT INTO station (name, altitude) VALUES ('Le rocher Impératrice', 3000);
INSERT INTO station (name, altitude) VALUES ('Le cube', 2200);
INSERT INTO station (name, altitude) VALUES ('Pyramide', 2000);

--? Insérer au moins 2 hotel

INSERT INTO hotel (station_id, name, category, address, city) VALUES (5, 'Imperator', 4, '35 rue des mouettes', 'Plougastel');
INSERT INTO hotel (station_id, name, category, address, city) VALUES (5, 'Roseraie',4, '12 rue Lacordaire', 'Daoulas');
INSERT INTO hotel (station_id, name, category, address, city) VALUES (6, 'Ti Ker Mol', 1, '56 Boulevard des sauges', 'Daoulas');

--? Insérer au moins 2 chambres

INSERT INTO room (hotel_id, number, capacity, type) VALUES (8, 001, 2, 1);
INSERT INTO room (hotel_id, number, capacity, type) VALUES (8, 002, 1, 1);
INSERT INTO room (hotel_id, number, capacity, type) VALUES (9, 001, 3, 1);
INSERT INTO room (hotel_id, number, capacity, type) VALUES (9, 333, 2, 1);
INSERT INTO room (hotel_id, number, capacity, type) VALUES (10, 123, 3, 1);

--? Insérer au moins 1 client

INSERT INTO client (first_name, last_name, address, city) VALUES ('Victor', 'McBernik', '11 rue des Océans', 'Le Relecq Kerhuon');
INSERT INTO client (first_name, last_name, address, city) VALUES ('Lou', 'Affreu', '', 'Brest');