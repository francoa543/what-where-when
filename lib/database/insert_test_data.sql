INSERT INTO addresses (id, title, address_text)
VALUES (1, 'test_address', '1234 Test Ave');

INSERT INTO locations (id, title, address_id)
VALUES (1, 'test_location', 1);

INSERT INTO event_titles (id, title, abbreviation)
VALUES (1, 'test_title', 'Test');

INSERT INTO icon_types (id, icon_type)
VALUES (1, 'Preset');

INSERT INTO icon_types (id, icon_type)
VALUES (2, 'Custom');

INSERT INTO icons (id, title, icon_type_id, icon_data)
VALUES (1, 'test_icon', 2, CAST('' AS BLOB));

INSERT INTO dates (id, day_number, month_number, year_number)
VALUES (1, 1, 1, 2026);

INSERT INTO events (id, event_title_id, date_id, start_time, end_time)
VALUES (1, 1, 1, CAST('{"hour": 12, "minutes": 0}' AS BLOB), CAST('{"hour": 13, "minutes": 0}' AS BLOB));
