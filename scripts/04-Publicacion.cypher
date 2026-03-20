// 04-Publicacion.cypher

UNWIND [
  {id: "PUB-001", caption: "El mejor atardecer que he visto en mi vida",   type: "imagen",    url: "imgs/atardecer.jpg",       size: 3.2,   likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-002", caption: "Roadtrip epico por toda Colombia",             type: "video",     url: "videos/roadtrip.mp4",      size: 245.0, likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-003", caption: "Los lunes son mejores con un buen cafe",       type: "imagen",    url: "imgs/cafe.jpg",            size: 2.1,   likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-004", caption: "Hice esta guia para mi proximo viaje",         type: "documento", url: "docs/guia_col.pdf",        size: 5.4,   likes: 0, views: 0, privacy: "amigos"},
  {id: "PUB-005", caption: "Cocinar es mi terapia favorita",               type: "video",     url: "videos/pasta.mp4",         size: 189.0, likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-006", caption: "La ciudad que nunca duerme",                   type: "imagen",    url: "imgs/ciudad_noche.jpg",    size: 4.1,   likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-007", caption: "Comparto mi rutina semanal de ejercicios",     type: "documento", url: "docs/fitness.pdf",         size: 2.8,   likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-008", caption: "La naturaleza es la mejor terapia",            type: "imagen",    url: "imgs/montanas.jpg",        size: 3.7,   likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-009", caption: "La comida callejera en Medellin es increible", type: "video",     url: "videos/comida.mp4",        size: 312.0, likes: 0, views: 0, privacy: "publico"},
  {id: "PUB-010", caption: "Sin gimnasio no hay problema",                 type: "imagen",    url: "imgs/entrenamiento.jpg",   size: 2.5,   likes: 0, views: 0, privacy: "publico"}
] AS datos

MERGE (pub:Publicacion {id: datos.id})
ON CREATE SET
  pub.id           = datos.id,
  pub.caption      = datos.caption,
  pub.type         = datos.type,
  pub.url          = datos.url,
  pub.size_mb      = datos.size,
  pub.likes        = datos.likes,
  pub.views        = datos.views,
  pub.comments     = 0,
  pub.privacy      = datos.privacy,
  pub.status       = "activo",
  pub.published_at = datetime()

RETURN pub.id, pub.type, pub.caption, pub.likes, pub.views
ORDER BY pub.id
