# Strādājam ar SNOWFLAKE
USE DATABASE RISEBA_DB;
CREATE SCHEMA NYSE;

CREATE TABLE IF NOT EXISTS nyse (
    id INT,
    company VARCHAR(255),
    timestamp TIMESTAMP,
    open DECIMAL(10, 2),
    close DECIMAL(10, 2),
    locked BOOLEAN
);

INSERT INTO nyse (id, company, timestamp, open, close, locked) VALUES
(1, 'Apple', '2025-02-12 00:00:00', 300.09, 301.00, TRUE),
(2, 'Accenture', '2025-02-12 00:00:01', 285.05, 287.75, FALSE),
(3, 'IBM', '2025-02-12 00:00:02', 150.00, 145.12, TRUE),
(4, 'Microsoft', '2025-02-12 00:00:03', 120.00, 121.00, FALSE),
(5, 'OpenAI', '2025-02-12 00:00:04', 490.57, 480.00, TRUE);


CREATE TABLE IF NOT EXISTS LSE (
    ID INT AUTOINCREMENT PRIMARY KEY,
    company STRING NOT NULL,
    lse_open DECIMAL(18,2) NOT NULL,
    lse_close DECIMAL(18,2) NOT NULL
);
INSERT INTO LSE (ID, company, lse_open, lse_close) VALUES
(1, 'Apple', 250.09, 252.00),
(2, 'Accenture', 220.05, 225.75),
(3, 'IBM', 270.00, 273.12),
(4, 'Microsoft', 180.00, 184.00),
(5, 'OpenAI', 150.57, 152.30);

SELECT n.id, l.company, n.open, n.close AS "Uzņēmuma Nosaukums"
FROM nyse n 
LEFT JOIN lse l ON n.id = l.id;
-- skatu veidošana
-- alternatīvs nosaukumu veidošanas veids
-- CREATE VIEW V_NYSE_LSE
CREATE OR REPLACE VIEW NYSE_LSE_VIEW AS
SELECT
COALESCE(NYSE.ID, LSE.ID) AS ID,
COALESCE(NYSE.COMPANY, LSE.COMPANY) AS COMPANY,
COALESCE(NYSE.OPEN, LSE.lse_open) AS LSE_OPEN,
COALESCE(NYSE.CLOSE, LSE.lse_close) AS LSE_CLOSE,
NYSE.timestamp
FROM NYSE 
FULL OUTER JOIN 
LSE ON NYSE.ID = LSE.ID
ORDER BY NYSE.timestamp;

SELECT * FROM NYSE_LSE_VIEW
