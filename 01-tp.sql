
USE compta;



CREATE TABLE IF NOT EXISTS FOURNISSEUR(
    ID INT  NOT NULL PRIMARY KEY,
    NOM VARCHAR(25) NOT NULL
);



CREATE TABLE IF NOT EXISTS ARTICLE (
    ID INT NOT NULL PRIMARY KEY, 
    REF INT(13),
    DESIGNATION VARCHAR(255),
    PRIX DECIMAL(7,2),
    ID_FOU INT NOT NULL,
    CONSTRAINT FK_ARTICLE_FOU FOREIGN KEY(ID_FOU) REFERENCES FOURNISSEUR(ID)
);




CREATE TABLE IF NOT EXISTS BON (
    ID INT NOT NULL PRIMARY KEY, 
    NUMERO INT,
    DATE_CMDE DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELAI INT,
    ID_FOU INT NOT NULL,
    CONSTRAINT FK_BON_FOU FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID)
    
);


CREATE TABLE IF NOT EXISTS COMPO (
   ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    ID_ART INT NOT NULL, 
    ID_BON INT NOT NULL, 
    QTE INT NOT NULL,
    CONSTRAINT FK_COMPO_ART FOREIGN KEY (ID_ART) REFERENCES ARTICLE(ID),
    CONSTRAINT FK_COMPO_BON FOREIGN KEY (ID_BON) REFERENCES BON(ID)
);

