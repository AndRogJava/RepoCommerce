CREATE TABLE UTENTE (
	username VARCHAR2(30) PRIMARY KEY,
	password VARCHAR(16) NOT NULL,
	nome VARCHAR2(30) NOT NULL,
	cognome VARCHAR2(30) NOT NULL,
	data_nascita DATE
);

CREATE TABLE INDIRIZZO(
	id_indirizzo INT PRIMARY KEY,
	via VARCHAR2(40) NOT NULL,
	numero INT NOT NULL,
	citta VARCHAR2(30) NOT NULL,
	cap INTEGER NOT NULL,
	utente VARCHAR2(30) NOT NULL,
	ultimo_indirizzo char(1) check (ultimo_indirizzo in ( 'Y', 'N' )),
	CONSTRAINT FK_US_IND FOREIGN KEY(utente) REFERENCES UTENTE(username) ON DELETE CASCADE
);

CREATE TABLE ORDINE(
	id_ordine INT PRIMARY KEY,
	data_ordine DATE NOT NULL,
	utente VARCHAR2(30) NOT NULL,
	indirizzo INT NOT NULL,
	CONSTRAINT FK_OR_IND FOREIGN KEY(indirizzo) REFERENCES INDIRIZZO(id_indirizzo) ON DELETE CASCADE,
	CONSTRAINT FK_OR_US FOREIGN KEY(utente) REFERENCES UTENTE(username) ON DELETE CASCADE
);

CREATE TABLE PRODOTTO(
    id_prodotto INT PRIMARY KEY,
    prezzo NUMBER(7,2) NOT NULL,
    quantita_disponibile INT NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    descrizione VARCHAR2(100),
    immagine VARCHAR2(100)
);

CREATE TABLE DETTAGLIO(
    id_dettaglio INT NOT NULL,
	id_ordine INT NOT NULL,
	id_prodotto INT NOT NULL,
	quantita_acquistata INT NOT NULL,
    prezzo_unitario NUMBER(7,2) NOT NULL,
	CONSTRAINT PK_DETTAGLIO PRIMARY KEY(id_dettaglio,id_ordine,id_prodotto),
	CONSTRAINT FK_DE_ORD FOREIGN KEY (id_ordine) REFERENCES Ordine(id_ordine) ON DELETE CASCADE,
	CONSTRAINT FK_DE_PRO FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto) ON DELETE CASCADE 
);

CREATE TABLE CATEGORIA(
	id_categoria INT PRIMARY KEY,
	nome VARCHAR2(30) NOT NULL
);

CREATE TABLE APPARTIENE_CATEGORIA(
	id_prodotto INT NOT NULL,
	id_categoria INT NOT NULL,
	CONSTRAINT pk_app PRIMARY KEY(id_prodotto,id_categoria),
	CONSTRAINT fk_app_pro FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto) ON DELETE CASCADE,
	CONSTRAINT fk_app_cat FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria) ON DELETE CASCADE
);

CREATE TABLE ORDINESTORICO(
    id_ordine INT NOT NULL,
    id_prodotto INT NOT NULL,
    username VARCHAR2(30) NOT NULL,
    quantita_acquistata INT NOT NULL,
    prezzo_totale NUMBER(7,2) NOT NULL,
    CONSTRAINT PK_OR_STORICO PRIMARY KEY(id_ordine,id_prodotto,username),
    CONSTRAINT fk_sto_pro FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto) ON DELETE CASCADE,
    CONSTRAINT fk_sto_user FOREIGN KEY(username) REFERENCES UTENTE(username) ON DELETE CASCADE
);