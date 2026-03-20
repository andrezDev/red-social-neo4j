// 06-Comentario.cypher



UNWIND [
  {id: "COM-001", content: "Que foto tan hermosa!",               pub: "PUB-001", user: "vale_mtz"},
  {id: "COM-002", content: "Me encanta este lugar, donde es?",    pub: "PUB-001", user: "seba_lop"},
  {id: "COM-003", content: "Increible el viaje!",                 pub: "PUB-002", user: "isa_rod"},
  {id: "COM-004", content: "Yo quiero ir tambien!",               pub: "PUB-002", user: "mateo_hdz"},
  {id: "COM-005", content: "Nada mejor que un cafe en la manana", pub: "PUB-003", user: "gabi_tor"},
  {id: "COM-006", content: "Esa guia me va a servir mucho",       pub: "PUB-004", user: "dani_ram"},
  {id: "COM-007", content: "La mejor receta que he visto",        pub: "PUB-005", user: "cami_gom"},
  {id: "COM-008", content: "Que ciudad tan bonita de noche",      pub: "PUB-006", user: "andres_dz"},
  {id: "COM-009", content: "Yo necesito esa rutina fitness",      pub: "PUB-007", user: "mari_mor"},
  {id: "COM-010", content: "Las montanas de Colombia son unicas", pub: "PUB-008", user: "feli_var"}
] AS datos

MERGE (c:Comentario {id: datos.id})
ON CREATE SET
  c.id         = datos.id,
  c.content    = datos.content,
  c.likes      = 0,
  c.status     = "activo",
  c.created_at = datetime()

RETURN c.id, c.content
