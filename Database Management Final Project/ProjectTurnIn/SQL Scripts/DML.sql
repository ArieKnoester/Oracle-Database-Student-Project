
/*
*  Arie Knoester
*  CS315 Spring 2015
*  Project DML
*/

CONNECT knoester/knoester;

/****************************/
-- INSERT stores table data
INSERT INTO stores( s_id,
                    s_street,
                    s_city,
                    s_state,
                    s_zip)
VALUES( 1,
        '1362 N. Michigan Ave.',
        'Chicago',
        DEFAULT,
        '60611');
        
INSERT INTO stores( s_id,
                    s_street,
                    s_city,
                    s_state,
                    s_zip)
VALUES( 2,
        '2037 N. Lincoln Ave.',
        'Chicago',
        DEFAULT,
        '60614');
        
INSERT INTO stores( s_id,
                    s_street,
                    s_city,
                    s_state,
                    s_zip)
VALUES( 3,
        '572 Oak St.',
        'Peoria',
        DEFAULT,
        '61615');

INSERT INTO stores( s_id,
                    s_street,
                    s_city,
                    s_state,
                    s_zip)
VALUES( 4,
        '17 Juniper St.',
        'Rockford',
        DEFAULT,
        '61105');
        
INSERT INTO stores( s_id,
                    s_street,
                    s_city,
                    s_state,
                    s_zip)
VALUES( 5,
        '3132 Jackson Blvd.',
        'Springfield',
        DEFAULT,
        '62713');

INSERT INTO stores( s_id,
                    s_street,
                    s_city,
                    s_state,
                    s_zip)
VALUES( 6,
        '73 W. Piney Grove Ave.',
        'Wheaton',
        DEFAULT,
        '60189');

/***********************************/
-- INSERT manufacturers table data
INSERT INTO manufacturers( m_id,
                           m_name,
                           m_street,
                           m_city,
                           m_state,
                           m_zip)
VALUES( 1,
        'Things LLC',
        '544 Huntington Ct.',
        'Fort Worth',
        'TX',
        '76119');
        
INSERT INTO manufacturers( m_id,
                           m_name,
                           m_street,
                           m_city,
                           m_state,
                           m_zip)
VALUES( 2,
        'Doo-Daddy',
        '4 Sullivan St.',
        'Louisvillle',
        'KY',
        '40217');
        
INSERT INTO manufacturers( m_id,
                           m_name,
                           m_street,
                           m_city,
                           m_state,
                           m_zip)
VALUES( 3,
        'Gadgetec',
        '839 Kilbourne Ave.',
        'Detroit',
        'MI',
        '48224');
        
INSERT INTO manufacturers( m_id,
                           m_name,
                           m_street,
                           m_city,
                           m_state,
                           m_zip)
VALUES( 4,
        'World Wide Whats',
        '54 Mill St.',
        'Columbus',
        'ID',
        '47202');
        
INSERT INTO manufacturers( m_id,
                           m_name,
                           m_street,
                           m_city,
                           m_state,
                           m_zip)
VALUES( 5,
        'Gaffs America',
        '767 Forest Glen Pkwy.',
        'Rochester',
        'NY',
        '14603');

/*****************************/
-- INSERT products table data
INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'TH001',
        'Thingamajig',
        1);

INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'D4372',
        'Doodad',
        2);

INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'GZ11H',
        'Gizmo',
        3);

INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'TH002',
        'Thingamabob',
        1);
        
INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'WH017C',
        'Whatchamacallit',
        4);
        
INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'D2541',
        'Doohickey',
        2);
        
INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'WH017N',
        'Whatnot',
        4);

INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'W1D47',
        'Widget',
        5);
        
INSERT INTO products( p_id,
                      p_name,
                      m_id)
VALUES( 'WH017S',
        'Whatsis',
        4);

/******************************/
-- INSERT shipments table data
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 546,
        TO_DATE( '01-02-2015', 'dd-mm-yyyy'),
        1,
        NULL);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 326,
        TO_DATE( '01-02-2015', 'dd-mm-yyyy'),
        3,
        NULL);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 243,
        TO_DATE( '02-02-2015', 'dd-mm-yyyy'),
        4,
        NULL);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 568,
        TO_DATE( '02-02-2015', 'dd-mm-yyyy'),
        1,
        NULL);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 267,
        TO_DATE( '03-02-2015', 'dd-mm-yyyy'),
        4,
        NULL);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 435,
        TO_DATE( '03-02-2015', 'dd-mm-yyyy'),
        NULL,
        4);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 652,
        TO_DATE( '03-02-2015', 'dd-mm-yyyy'),
        NULL,
        2);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 263,
        TO_DATE( '04-02-2015', 'dd-mm-yyyy'),
        2,
        NULL);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 734,
        TO_DATE( '04-02-2015', 'dd-mm-yyyy'),
        5,
        NULL);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 611,
        TO_DATE( '04-02-2015', 'dd-mm-yyyy'),
        NULL,
        2);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 289,
        TO_DATE( '05-02-2015', 'dd-mm-yyyy'),
        2,
        NULL);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 532,
        TO_DATE( '05-02-2015', 'dd-mm-yyyy'),
        4,
        NULL);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 455,
        TO_DATE( '05-02-2015', 'dd-mm-yyyy'),
        NULL,
        3);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 103,
        TO_DATE( '06-02-2015', 'dd-mm-yyyy'),
        NULL,
        5);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 935,
        TO_DATE( '06-02-2015', 'dd-mm-yyyy'),
        NULL,
        3);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 752,
        TO_DATE( '06-02-2015', 'dd-mm-yyyy'),
        NULL,
        1);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 864,
        TO_DATE( '07-02-2015', 'dd-mm-yyyy'),
        NULL,
        4);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 114,
        TO_DATE( '07-02-2015', 'dd-mm-yyyy'),
        NULL,
        1);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 645,
        TO_DATE( '07-02-2015', 'dd-mm-yyyy'),
        NULL,
        2);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 881,
        TO_DATE( '08-02-2015', 'dd-mm-yyyy'),
        NULL,
        5); 
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 220,
        TO_DATE( '08-02-2015', 'dd-mm-yyyy'),
        NULL,
        2);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 213,
        TO_DATE( '09-02-2015', 'dd-mm-yyyy'),
        NULL,
        1);

INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 743,
        TO_DATE( '09-02-2015', 'dd-mm-yyyy'),
        NULL,
        4);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 474,
        TO_DATE( '10-02-2015', 'dd-mm-yyyy'),
        NULL,
        2);
        
INSERT INTO shipments( ship_id,
                       ship_date,
                       m_id,
                       s_id)
VALUES( 366,
        TO_DATE( '10-02-2015', 'dd-mm-yyyy'),
        NULL,
        1);

/******************************/
--INSERT inventory table data
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 1,
         546,
         'TH001',
         300);

INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 2,
         326,
         'GZ11H',
         200);


INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 3,
         243,
         'WH017C',
         150);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 4,
         568,
         'TH002',
         260);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 5,
         267,
         'WH017N',
         220);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 6,
         435,
         'TH001',
         33);

INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 7,
         652,
         'WH017N',
         36);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 8,
         263,
         'D4372',
         325);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 9,
         734,
         'W1D47',
         280);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 10,
         611,
         'GZ11H',
         42);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 11,
         289,
         'D2541',
         260);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 12,
         532,
         'WH017S',
         125);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 13,
         455,
         'W1D47',
         23);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 14,
         103,
         'D4372',
         37);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 15,
         935,
         'W1D47',
         26);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 16,
         752,
         'D2541',
         28);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 17,
         864,
         'WH017C',
         41);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 18,
         114,
         'GZ11H',
         42);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 19,
         645,
         'WH017S',
         35);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 20,
         881,
         'WH017S',
         20);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 21,
         220,
         'TH002',
         40);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 22,
         213,
         'D4372',
         32);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 23,
         743,
         'TH001',
         35);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 24,
         474,
         'W1D47',
         45);
         
INSERT INTO inventory( inv_ctrl_id,
                       ship_id,
                       p_id,
                       p_qty)
VALUES ( 25,
         366,
         'WH017N',
         32);
         
COMMIT;