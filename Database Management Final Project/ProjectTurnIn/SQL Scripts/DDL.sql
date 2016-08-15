
/*
*  Arie Knoester
*  CS315 Spring 2015
*  Project DDL
*/

--DROP USER knoester CASCADE;

CREATE USER knoester IDENTIFIED BY knoester DEFAULT TABLESPACE users;
GRANT ALL PRIVILEGES TO knoester;

CONNECT knoester/knoester;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE inventory';
  EXECUTE IMMEDIATE 'DROP TABLE products';
  EXECUTE IMMEDIATE 'DROP TABLE shipments';
  EXECUTE IMMEDIATE 'DROP TABLE stores';
  EXECUTE IMMEDIATE 'DROP TABLE manufacturers';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE stores
(
  s_id      NUMBER                        NOT NULL,
  s_street  VARCHAR2( 40)                 NOT NULL,
  s_city    VARCHAR2( 30)                 NOT NULL,
  s_state   VARCHAR2( 2)    DEFAULT 'IL'  NOT NULL,
  s_zip     VARCHAR2( 15)                 NOT NULL,
  
  CONSTRAINT pk_stores
    PRIMARY KEY( s_id)
);

CREATE TABLE manufacturers
(
  m_id      NUMBER          NOT NULL,
  m_name    VARCHAR2( 50)   NOT NULL,
  m_street  VARCHAR2( 40)   NOT NULL,
  m_city    VARCHAR2( 30)   NOT NULL,
  m_state   VARCHAR2( 2)    NOT NULL,
  m_zip     VARCHAR2( 15)   NOT NULL,
  
  CONSTRAINT pk_manufacturers
    PRIMARY KEY( m_id)
);

CREATE TABLE products
(
  p_id    VARCHAR2( 10)     NOT NULL,
  p_name  VARCHAR2( 30)     NOT NULL,
  m_id    NUMBER            NOT NULL,
  
  CONSTRAINT pk_products
    PRIMARY KEY( p_id),
  CONSTRAINT fk_prdcts_to_manfctr
    FOREIGN KEY( m_id)
    REFERENCES manufacturers( m_id)
);

CREATE TABLE shipments
(
  ship_id     NUMBER                    NOT NULL,
  ship_date   DATE    DEFAULT SYSDATE   NOT NULL,
  m_id        NUMBER,
  s_id        NUMBER,
  
  CONSTRAINT pk_shipments
    PRIMARY KEY( ship_id),
  CONSTRAINT fk_shpmnts_to_manfctr
    FOREIGN KEY( m_id)
    REFERENCES manufacturers( m_id),
  CONSTRAINT fk_shpmnts_to_stores
    FOREIGN KEY( s_id)
    REFERENCES stores( s_id)
);

CREATE TABLE inventory
(
  inv_ctrl_id  NUMBER         NOT NULL,
  ship_id      NUMBER         NOT NULL,
  p_id         VARCHAR2( 10)  NOT NULL,
  p_qty        NUMBER         NOT NULL,
  
  CONSTRAINT pk_inventory
    PRIMARY KEY( inv_ctrl_id),
  CONSTRAINT fk_inv_to_shpmnt
    FOREIGN KEY( ship_id)
    REFERENCES shipments( ship_id),
  CONSTRAINT fk_inv_to_prdcts
    FOREIGN KEY( p_id)
    REFERENCES products( p_id)
);
