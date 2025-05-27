
// Datenbank Struktur fur tcketsystem//



CREATE TABLE Role (
    roleID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Supporter (
    supporterID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    roleID INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (roleID) REFERENCES Role(roleID)
);


CREATE TABLE Category (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Ticket (
    ticketID INT AUTO_INCREMENT PRIMARY KEY,
    supporterID INT NOT NULL,
    title VARCHAR(255),
    time DATETIME DEFAULT CURRENT_TIMESTAMP,
    priority INT CHECK (priority IN (1, 2, 3)),
    status ENUM('new', 'in_progress', 'closed') DEFAULT 'new',
    description TEXT,
    FOREIGN KEY (supporterID) REFERENCES Supporter(supporterID)
);


CREATE TABLE ProcessedTicket (
    processedID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    ticketID INT NOT NULL,
    note TEXT,
    time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Supporter(supporterID),
    FOREIGN KEY (ticketID) REFERENCES Ticket(ticketID)
);


CREATE TABLE Performance (
    performanceID INT AUTO_INCREMENT PRIMARY KEY,
    ticketID INT NOT NULL,
    time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ticketID) REFERENCES Ticket(ticketID)
);
