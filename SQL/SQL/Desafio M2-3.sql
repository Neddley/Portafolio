--1) CREAR USUARIO blog

CREATE USER blog IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES TO blog;

--2) CREANDO TABLAS

CREATE TABLE usuario(
    id NUMBER,
    email VARCHAR2 (60),
    PRIMARY KEY (id)
);

CREATE TABLE post(
    id NUMBER NOT NULL,
    usuario_id NUMBER NOT NULL,
    titulo VARCHAR2 (60),
    fecha DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);

CREATE TABLE comentario(
    id NUMBER NOT NULL,
    post_id NUMBER NOT NULL,
    usuario_id NUMBER NOT NULL,
    texto VARCHAR2 (40),
    fecha DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES post (id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);


--3) Cargado de CSVs

INSERT INTO usuario(id, email) 
VALUES 
(1 , 'usuario01@hotmail.com'),
(2 , 'usuario02@gmail.com'),
(3 , 'usuario03@gmail.com'), 
(4 , 'usuario04@hotmail.com'), 
(5 , 'usuario05@yahoo.com'), 
(6 , 'usuario06@hotmail.com'), 
(7 , 'usuario07@yahoo.com'), 
(8 , 'usuario08@yahoo.com'), 
(9 , 'usuario09@yahoo.com');

SELECT * FROM usuario;

DESCRIBE post;

INSERT INTO post(id, usuario_id, titulo, fecha) 
VALUES 
(1, 1, 'Post 1: Esto es malo', '29-06-2020'),
(2, 5, 'Post 2: Esto es malo', '20-06-2020'),
(3, 1, 'Post 3: Esto es excelente', '30-05-2020'),
(4, 9, 'Post 4: Esto es bueno', '09-05-2020'),
(5, 7, 'Post 5: Esto es bueno', '10-07-2020'), 
(6, 5, 'Post 6: Esto es excelente', '18-07-2020'), 
(7, 8, 'Post 7: Esto es excelente', '07-07-2020'), 
(8, 5, 'Post 8: Esto es excelente', '14-05-2020'), 
(9, 2, 'Post 9: Esto es bueno', '08-05-2020'),
(10, 6, 'Post 10: Esto es bueno', '02-06-2020'),
(11, 4, 'Post 11: Esto es bueno', '05-05-2020'),
(12, 9, 'Post 12: Esto es malo', '23-07-2020'), 
(13, 5, 'Post 13: Esto es excelente', '30-05-2020'),
(14, 8, 'Post 14: Esto es excelente', '01-05-2020'),
(15, 7, 'Post 15: Esto es malo', '17-06-2020');

SELECT * FROM post;

DESCRIBE comentarios;

INSERT INTO comentarios(id, post_id, usuario_id, texto, fecha) 
VALUES 
(1, 1, 3, 'Este es el comentario 1', '08-07-2020'), 
(2, 2, 4, 'Este es el comentario 2', '07-06-2020'), 
(3, 3, 6, 'Este es el comentario 3', '16-06-2020'), 
(4, 4, 2, 'Este es el comentario 4', '15-06-2020'), 
(5, 5, 6, 'Este es el comentario 5', '14-05-2020'), 
(6, 6, 3, 'Este es el comentario 6', '08-07-2020'), 
(7, 7, 6, 'Este es el comentario 7', '22-05-2020'), 
(8, 8, 6, 'Este es el comentario 8', '09-07-2020'), 
(9, 9, 8, 'Este es el comentario 9', '30-06-2020'), 
(10, 10, 8, 'Este es el comentario 10', '19-06-2020'),
(11, 11, 5, 'Este es el comentario 11', '09-05-2020'), 
(12, 12, 8, 'Este es el comentario 12', '17-06-2020'),
(13, 13, 1, 'Este es el comentario 13', '01-05-2020'), 
(14, 14, 2, 'Este es el comentario 14', '31-05-2020'), 
(15, 15, 4, 'Este es el comentario 15', '28-06-2020');

SELECT * FROM comentarios;


--4) Seleccionar el correo, id y titulo de todos los post publicador por el usuario 5.

SELECT u.email, p.id, p.titulo 
FROM usuario u INNER JOIN 
post p on u.id=p.usuario_id 
WHERE u.id=5;

/*
 usuario05@yahoo.com	2	 Post 2: Esto es malo
 usuario05@yahoo.com	6	 Post 6: Esto es excelente
 usuario05@yahoo.com	8	 Post 8: Esto es excelente
 usuario05@yahoo.com	13	 Post 13: Esto es excelente
*/


--5) Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.

SELECT u.email correo, c.id, c.texto 
FROM usuario u INNER JOIN comentario c 
ON (u.id = c.usuario_id) 
WHERE u.email != 'usuario06@hotmail.com';

/*
 usuario01@hotmail.com	13	 Este es el comentario 13
 usuario02@gmail.com	14	 Este es el comentario 14
 usuario02@gmail.com	4	 Este es el comentario 4
 usuario03@gmail.com	6	 Este es el comentario 6
 usuario03@gmail.com	1	 Este es el comentario 1
 usuario04@hotmail.com	15	 Este es el comentario 15
 usuario04@hotmail.com	2	 Este es el comentario 2
 usuario05@yahoo.com	11	 Este es el comentario 11
 usuario08@yahoo.com	9	 Este es el comentario 9
 usuario08@yahoo.com	10	 Este es el comentario 10
 usuario08@yahoo.com	12	 Este es el comentario 12
*/


-- 6 Listar los usuarios que no han publicado ningún post.

SELECT * FROM usuario u LEFT JOIN 
post p ON u.id = p.usuario_id 
WHERE p.usuario_id IS NULL;

*/
 3 usuario03@gmail.com (null) (null) (null) (null)
/*


-- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).

SELECT p.titulo post, c.texto comentario 
FROM post p INNER JOIN comentario c 
ON p.id=c.id;

/*
 Post 1: Esto es malo	         Este es el comentario 1
 Post 2: Esto es malo	         Este es el comentario 2
 Post 3: Esto es excelente	 Este es el comentario 3
 Post 4: Esto es bueno	         Este es el comentario 4
 Post 5: Esto es bueno	         Este es el comentario 5
 Post 6: Esto es excelente	 Este es el comentario 6
 Post 7: Esto es excelente	 Este es el comentario 7
 Post 8: Esto es excelente	 Este es el comentario 8
 Post 9: Esto es bueno	         Este es el comentario 9
 Post 10: Esto es bueno	         Este es el comentario 10
 Post 11: Esto es bueno	         Este es el comentario 11
 Post 12: Esto es malo	         Este es el comentario 12
 Post 13: Esto es excelente	 Este es el comentario 13
 Post 14: Esto es excelente	 Este es el comentario 14
 Post 15: Esto es malo	         Este es el comentario 15
*/


-- 8. Listar todos los usuarios que hayan publicado un post en Junio.

SELECT u.id, u.email 
FROM usuario u INNER JOIN post p 
ON (u.id = p.usuario_id) 
WHERE TO_CHAR(p.fecha,'MM') = 06;

/*
1 usuario01@hotmail.com
5 usuario05@yahoo.com
6 usuario06@hotmail.com
7 usuario07@yahoo.com
*/