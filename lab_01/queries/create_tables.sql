\c postgres;

\c betsdb;

DROP TABLE IF EXISTS bets;
DROP TABLE IF EXISTS bookmakers;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS customers;

CREATE table bookmakers (
    pk INTEGER PRIMARY KEY,
    name TEXT not NULL,
    country TEXT not NULL,
    foundation_date INTEGER not NULL,
    web_site TEXT not NULL,
    is_official INT,
    parent_id INT NULL,
    FOREIGN KEY (parent_id) REFERENCES bookmakers(pk) ON DELETE CASCADE,
    CONSTRAINT official_bool CHECK (is_official >= 0 and is_official <= 1)
);

CREATE table games (
    pk INTEGER PRIMARY KEY,
    home_team_name TEXT not NULL,
    away_team_name TEXT not NULL,
    home_team_goals INTEGER not NULL,
    away_team_goals INTEGER not NULL,
    is_finished INTEGER not NULL,
    CONSTRAINT finished_bool CHECK (is_finished >= 0 and is_finished <= 1),
    CONSTRAINT positive_home_goals CHECK (home_team_goals >= 0),
    CONSTRAINT positive_away_goals CHECK (away_team_goals >= 0)
);

CREATE table customers (
    pk INTEGER PRIMARY KEY,
    name TEXT not NULL,
    surname TEXT not NULL,
    phone_number TEXT not NULL,
    country TEXT
);

CREATE table bets (
    fk_bookmaker INTEGER not NULL,
    fk_game INTEGER not NULL,
    fk_customer INTEGER not NULL,
    customer_prediction INTEGER not NULL,
    coefficient REAL not NULL,
    price REAL not NULL,
    state INTEGER not NULL,
    FOREIGN KEY (fk_bookmaker) REFERENCES bookmakers(pk) ON DELETE CASCADE,
    FOREIGN KEY (fk_game) REFERENCES games(pk) ON DELETE CASCADE,
    FOREIGN KEY (fk_customer) REFERENCES customers(pk) ON DELETE CASCADE,
    CONSTRAINT state_bool CHECK (state >= 0 and state <= 1),
    CONSTRAINT prediction_check CHECK (customer_prediction >= 0 and customer_prediction <= 2)
);
