// 08-consultas.cypher

// -----------------------------------------
// 1. Usuarios con más seguidores
// -----------------------------------------
MATCH (u:Usuario)<-[:FOLLOWS]-(seguidor)
WHERE u.is_fake IS NULL
RETURN u.name AS usuario, count(seguidor) AS seguidores
ORDER BY seguidores DESC
LIMIT 5;

// -----------------------------------------
// 2. Publicaciones con más likes
// -----------------------------------------
MATCH (pub:Publicacion)
RETURN pub.id, pub.caption, pub.likes, pub.views
ORDER BY pub.likes DESC;

// -----------------------------------------
// 3. Usuarios que se siguen mutuamente
// -----------------------------------------
MATCH (u1:Usuario)-[:FOLLOWS]->(u2:Usuario)-[:FOLLOWS]->(u1)
RETURN u1.name AS usuario1, u2.name AS usuario2;

//------------------------------------------
// 4. Seguimientos no correspondidos
//------------------------------------------
MATCH (u1:Usuario)-[r:FOLLOWS]->(u2:Usuario)
WHERE NOT (u2)-[:FOLLOWS]->(u1)
AND u1.is_fake IS NULL
RETURN u1, r, u2

/ -----------------------------------------
// 5. Red de cuentas falsas que siguen otras cuentas
// -----------------------------------------
MATCH (fake:Usuario {is_fake: true})-[r:FOLLOWS]->(u:Usuario)
RETURN fake, r, u
