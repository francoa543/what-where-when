CREATE TABLE dates (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    day_number INTEGER NOT NULL,
    month_number INTEGER NOT NULL,
    year_number INTEGER NOT NULL
);

CREATE TABLE addresses (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title TEXT NOT NULL,
    address_text TEXT NOT NULL
);

CREATE TABLE locations (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title TEXT NOT NULL,
    address_id INTEGER NOT NULL,
    location_notes TEXT,
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE event_titles (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title TEXT NOT NULL,
    abbreviation TEXT
);

CREATE TABLE icon_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    icon_type TEXT NOT NULL
);

CREATE TABLE icons (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title INTEGER NOT NULL,
    icon_type_id INTEGER NOT NULL,
    icon_data BLOB NOT NULL,
    FOREIGN KEY (icon_type_id) REFERENCES icon_types(id)
);

CREATE TABLE events (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    event_title_id INTEGER NOT NULL,
    date_id INTEGER NOT NULL,
    start_time BLOB NOT NULL,
    end_time BLOB NOT NULL,
    location_id INTEGER,
    repeat_info BLOB,
    notification_info BLOB,
    icon_id INTEGER,
    event_description TEXT,
    FOREIGN KEY (event_title_id) REFERENCES event_titles(id),
    FOREIGN KEY (date_id) REFERENCES dates(id),
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (icon_id) REFERENCES icons(id)
);

