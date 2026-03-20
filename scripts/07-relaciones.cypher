// 07-relaciones.cypher

// -----------------------------------------
// 1. MANAGES — Plataforma gestiona Usuarios
// -----------------------------------------
MATCH (p:Plataforma)
MATCH (u:Usuario)
MERGE (p)-[:MANAGES]->(u);

// -----------------------------------------
// 2. CONTAINS_PUBLICATIONS — Plataforma aloja Publicaciones
// -----------------------------------------
MATCH (p:Plataforma)
MATCH (pub:Publicacion)
MERGE (p)-[:CONTAINS_PUBLICATIONS]->(pub);

// -----------------------------------------
// 3. CONTAINS_STORIES — Plataforma aloja Historias
// -----------------------------------------
MATCH (p:Plataforma)
MATCH (h:Historia)
MERGE (p)-[:CONTAINS_STORIES]->(h);

// -----------------------------------------
// 4. PUBLISHED — Usuario publicó una Publicacion
// -----------------------------------------
UNWIND [
  {user: "santi_g",   pub: "PUB-001"},
  {user: "vale_mtz",  pub: "PUB-002"},
  {user: "seba_lop",  pub: "PUB-003"},
  {user: "isa_rod",   pub: "PUB-004"},
  {user: "mateo_hdz", pub: "PUB-005"},
  {user: "gabi_tor",  pub: "PUB-006"},
  {user: "dani_ram",  pub: "PUB-007"},
  {user: "cami_gom",  pub: "PUB-008"},
  {user: "andres_dz", pub: "PUB-009"},
  {user: "mari_mor",  pub: "PUB-010"},
  {user: "feli_var",  pub: "PUB-011"},
  {user: "laura_jim", pub: "PUB-012"},
  {user: "nico_pez",  pub: "PUB-013"},
  {user: "sofi_cas",  pub: "PUB-014"},
  {user: "tomas_rom", pub: "PUB-015"},
  {user: "manu_tor",  pub: "PUB-016"},
  {user: "alejo_flo", pub: "PUB-017"},
  {user: "nata_rey",  pub: "PUB-018"},
  {user: "juli_cru",  pub: "PUB-019"},
  {user: "pau_ort",   pub: "PUB-020"},
  {user: "rica_men",  pub: "PUB-021"},
  {user: "diana_rio", pub: "PUB-022"},
  {user: "este_her",  pub: "PUB-023"},
  {user: "cata_med",  pub: "PUB-024"},
  {user: "migu_gut",  pub: "PUB-025"},
  {user: "vale_san",  pub: "PUB-026"},
  {user: "cris_alv",  pub: "PUB-027"},
  {user: "meli_roj",  pub: "PUB-028"},
  {user: "joaq_var",  pub: "PUB-029"},
  {user: "dani_par",  pub: "PUB-030"}
] AS datos
MATCH (u:Usuario       {username: datos.user})
MATCH (pub:Publicacion {id: datos.pub})
MERGE (u)-[:PUBLISHED]->(pub);

// -----------------------------------------
// 5. PUBLISHED_STORIES — Usuario publicó Historia
// -----------------------------------------
UNWIND [
  {user: "santi_g",   his: "HIS-001"},
  {user: "vale_mtz",  his: "HIS-002"},
  {user: "seba_lop",  his: "HIS-003"},
  {user: "isa_rod",   his: "HIS-004"},
  {user: "mateo_hdz", his: "HIS-005"},
  {user: "gabi_tor",  his: "HIS-006"},
  {user: "dani_ram",  his: "HIS-007"},
  {user: "cami_gom",  his: "HIS-008"},
  {user: "andres_dz", his: "HIS-009"},
  {user: "mari_mor",  his: "HIS-010"}
] AS datos
MATCH (u:Usuario  {username: datos.user})
MATCH (h:Historia {id: datos.his})
MERGE (u)-[:PUBLISHED_STORIES]->(h);

// -----------------------------------------
// 6. WATCHED_STORY — Usuario vio Historia
// -----------------------------------------
UNWIND [
  {user: "vale_mtz",  his: "HIS-001"},
  {user: "seba_lop",  his: "HIS-001"},
  {user: "mateo_hdz", his: "HIS-001"},
  {user: "santi_g",   his: "HIS-002"},
  {user: "isa_rod",   his: "HIS-002"},
  {user: "andres_dz", his: "HIS-003"},
  {user: "mari_mor",  his: "HIS-003"},
  {user: "feli_var",  his: "HIS-004"},
  {user: "laura_jim", his: "HIS-005"},
  {user: "nico_pez",  his: "HIS-005"},
  {user: "sofi_cas",  his: "HIS-006"},
  {user: "tomas_rom", his: "HIS-006"},
  {user: "manu_tor",  his: "HIS-007"},
  {user: "alejo_flo", his: "HIS-008"},
  {user: "nata_rey",  his: "HIS-008"},
  {user: "juli_cru",  his: "HIS-009"},
  {user: "pau_ort",   his: "HIS-010"},
  {user: "rica_men",  his: "HIS-010"}
] AS datos
MATCH (u:Usuario  {username: datos.user})
MATCH (h:Historia {id: datos.his})
MERGE (u)-[:WATCHED_STORY]->(h);

// -----------------------------------------
// 7. COMMENTED — Usuario comentó
// IN — Comentario pertenece a Publicacion
// -----------------------------------------
UNWIND [
  {com: "COM-001", pub: "PUB-001", user: "vale_mtz"},
  {com: "COM-002", pub: "PUB-001", user: "seba_lop"},
  {com: "COM-003", pub: "PUB-002", user: "isa_rod"},
  {com: "COM-004", pub: "PUB-002", user: "mateo_hdz"},
  {com: "COM-005", pub: "PUB-003", user: "gabi_tor"},
  {com: "COM-006", pub: "PUB-004", user: "dani_ram"},
  {com: "COM-007", pub: "PUB-005", user: "cami_gom"},
  {com: "COM-008", pub: "PUB-006", user: "andres_dz"},
  {com: "COM-009", pub: "PUB-007", user: "mari_mor"},
  {com: "COM-010", pub: "PUB-008", user: "feli_var"}
] AS datos
MATCH (u:Usuario       {username: datos.user})
MATCH (c:Comentario    {id: datos.com})
MATCH (pub:Publicacion {id: datos.pub})
MERGE (u)-[:COMMENTED]->(c)
MERGE (c)-[:IN]->(pub);

// -----------------------------------------
// 8. LIKED — Usuario dio like a Publicacion
// -----------------------------------------
UNWIND [
  {user: "santi_g",   pub: "PUB-001"},
  {user: "santi_g",   pub: "PUB-003"},
  {user: "santi_g",   pub: "PUB-016"},
  {user: "vale_mtz",  pub: "PUB-001"},
  {user: "vale_mtz",  pub: "PUB-005"},
  {user: "vale_mtz",  pub: "PUB-018"},
  {user: "seba_lop",  pub: "PUB-002"},
  {user: "seba_lop",  pub: "PUB-006"},
  {user: "seba_lop",  pub: "PUB-023"},
  {user: "isa_rod",   pub: "PUB-003"},
  {user: "isa_rod",   pub: "PUB-008"},
  {user: "isa_rod",   pub: "PUB-026"},
  {user: "mateo_hdz", pub: "PUB-001"},
  {user: "mateo_hdz", pub: "PUB-004"},
  {user: "mateo_hdz", pub: "PUB-015"},
  {user: "gabi_tor",  pub: "PUB-002"},
  {user: "gabi_tor",  pub: "PUB-007"},
  {user: "gabi_tor",  pub: "PUB-030"},
  {user: "dani_ram",  pub: "PUB-005"},
  {user: "dani_ram",  pub: "PUB-009"},
  {user: "dani_ram",  pub: "PUB-022"},
  {user: "cami_gom",  pub: "PUB-003"},
  {user: "cami_gom",  pub: "PUB-008"},
  {user: "cami_gom",  pub: "PUB-012"},
  {user: "andres_dz", pub: "PUB-006"},
  {user: "andres_dz", pub: "PUB-010"},
  {user: "andres_dz", pub: "PUB-025"},
  {user: "mari_mor",  pub: "PUB-004"},
  {user: "mari_mor",  pub: "PUB-007"},
  {user: "mari_mor",  pub: "PUB-016"},
  {user: "feli_var",  pub: "PUB-001"},
  {user: "laura_jim", pub: "PUB-002"},
  {user: "nico_pez",  pub: "PUB-006"},
  {user: "sofi_cas",  pub: "PUB-003"},
  {user: "tomas_rom", pub: "PUB-007"},
  {user: "nata_rey",  pub: "PUB-001"},
  {user: "juli_cru",  pub: "PUB-005"},
  {user: "pau_ort",   pub: "PUB-002"},
  {user: "rica_men",  pub: "PUB-006"},
  {user: "diana_rio", pub: "PUB-010"}
] AS datos
MATCH (u:Usuario       {username: datos.user})
MATCH (pub:Publicacion {id: datos.pub})
MERGE (u)-[:LIKED]->(pub);

// -----------------------------------------
// 9. VIEWED — Usuario vio una Publicacion
// -----------------------------------------
UNWIND [
  {user: "santi_g",   pub: "PUB-001"},
  {user: "santi_g",   pub: "PUB-002"},
  {user: "santi_g",   pub: "PUB-016"},
  {user: "vale_mtz",  pub: "PUB-001"},
  {user: "vale_mtz",  pub: "PUB-004"},
  {user: "vale_mtz",  pub: "PUB-018"},
  {user: "seba_lop",  pub: "PUB-002"},
  {user: "seba_lop",  pub: "PUB-006"},
  {user: "seba_lop",  pub: "PUB-023"},
  {user: "isa_rod",   pub: "PUB-001"},
  {user: "isa_rod",   pub: "PUB-008"},
  {user: "isa_rod",   pub: "PUB-026"},
  {user: "mateo_hdz", pub: "PUB-001"},
  {user: "mateo_hdz", pub: "PUB-009"},
  {user: "mateo_hdz", pub: "PUB-015"},
  {user: "gabi_tor",  pub: "PUB-002"},
  {user: "gabi_tor",  pub: "PUB-010"},
  {user: "gabi_tor",  pub: "PUB-030"},
  {user: "dani_ram",  pub: "PUB-003"},
  {user: "dani_ram",  pub: "PUB-009"},
  {user: "dani_ram",  pub: "PUB-022"},
  {user: "cami_gom",  pub: "PUB-007"},
  {user: "cami_gom",  pub: "PUB-008"},
  {user: "cami_gom",  pub: "PUB-012"},
  {user: "andres_dz", pub: "PUB-005"},
  {user: "andres_dz", pub: "PUB-010"},
  {user: "andres_dz", pub: "PUB-025"},
  {user: "mari_mor",  pub: "PUB-006"},
  {user: "feli_var",  pub: "PUB-004"},
  {user: "laura_jim", pub: "PUB-005"},
  {user: "nico_pez",  pub: "PUB-003"},
  {user: "sofi_cas",  pub: "PUB-004"},
  {user: "tomas_rom", pub: "PUB-002"},
  {user: "manu_tor",  pub: "PUB-005"},
  {user: "alejo_flo", pub: "PUB-008"},
  {user: "nata_rey",  pub: "PUB-009"},
  {user: "pau_ort",   pub: "PUB-002"},
  {user: "rica_men",  pub: "PUB-006"},
  {user: "diana_rio", pub: "PUB-010"},
  {user: "mari_mor",  pub: "PUB-016"}
] AS datos
MATCH (u:Usuario       {username: datos.user})
MATCH (pub:Publicacion {id: datos.pub})
MERGE (u)-[:VIEWED]->(pub);

// -----------------------------------------
// 10. FOLLOWS — Se siguen mutuamente
// -----------------------------------------
UNWIND [
  {u1: "santi_g",   u2: "vale_mtz"},
  {u1: "seba_lop",  u2: "isa_rod"},
  {u1: "mateo_hdz", u2: "gabi_tor"},
  {u1: "dani_ram",  u2: "cami_gom"},
  {u1: "andres_dz", u2: "mari_mor"},
  {u1: "feli_var",  u2: "laura_jim"},
  {u1: "nico_pez",  u2: "sofi_cas"},
  {u1: "tomas_rom", u2: "manu_tor"},
  {u1: "alejo_flo", u2: "nata_rey"},
  {u1: "juli_cru",  u2: "pau_ort"}
] AS datos
MATCH (u1:Usuario {username: datos.u1})
MATCH (u2:Usuario {username: datos.u2})
MERGE (u1)-[:FOLLOWS]->(u2)
MERGE (u2)-[:FOLLOWS]->(u1);

// -----------------------------------------
// 11. FOLLOWS — Solo uno sigue al otro
// -----------------------------------------
UNWIND [
  {seguidor: "santi_g",   seguido: "mateo_hdz"},
  {seguidor: "santi_g",   seguido: "dani_ram"},
  {seguidor: "vale_mtz",  seguido: "gabi_tor"},
  {seguidor: "vale_mtz",  seguido: "cami_gom"},
  {seguidor: "seba_lop",  seguido: "andres_dz"},
  {seguidor: "isa_rod",   seguido: "feli_var"},
  {seguidor: "mateo_hdz", seguido: "nico_pez"},
  {seguidor: "gabi_tor",  seguido: "tomas_rom"},
  {seguidor: "dani_ram",  seguido: "alejo_flo"},
  {seguidor: "cami_gom",  seguido: "juli_cru"},
  {seguidor: "andres_dz", seguido: "rica_men"},
  {seguidor: "mari_mor",  seguido: "este_her"},
  {seguidor: "feli_var",  seguido: "cata_med"},
  {seguidor: "laura_jim", seguido: "migu_gut"},
  {seguidor: "nico_pez",  seguido: "vale_san"},
  {seguidor: "sofi_cas",  seguido: "cris_alv"},
  {seguidor: "tomas_rom", seguido: "meli_roj"},
  {seguidor: "manu_tor",  seguido: "joaq_var"},
  {seguidor: "alejo_flo", seguido: "dani_par"},
  {seguidor: "nata_rey",  seguido: "ivan_ser"}
] AS datos
MATCH (u1:Usuario {username: datos.seguidor})
MATCH (u2:Usuario {username: datos.seguido})
MERGE (u1)-[:FOLLOWS]->(u2);

// -----------------------------------------
// 12. FOLLOWS — Cuentas falsas siguen masivamente
// -----------------------------------------
UNWIND [
  {bot: "bot_fake01", seguido: "santi_g"},
  {bot: "bot_fake01", seguido: "vale_mtz"},
  {bot: "bot_fake01", seguido: "seba_lop"},
  {bot: "bot_fake01", seguido: "isa_rod"},
  {bot: "bot_fake01", seguido: "mateo_hdz"},
  {bot: "bot_fake02", seguido: "santi_g"},
  {bot: "bot_fake02", seguido: "vale_mtz"},
  {bot: "bot_fake02", seguido: "andres_dz"},
  {bot: "bot_fake02", seguido: "mari_mor"},
  {bot: "falsa_01",   seguido: "santi_g"},
  {bot: "falsa_01",   seguido: "nico_pez"},
  {bot: "falsa_01",   seguido: "sofi_cas"},
  {bot: "falsa_02",   seguido: "santi_g"},
  {bot: "falsa_02",   seguido: "manu_tor"},
  {bot: "spam_bot03", seguido: "santi_g"},
  {bot: "spam_bot03", seguido: "vale_mtz"},
  {bot: "spam_bot03", seguido: "seba_lop"},
  {bot: "spam_bot03", seguido: "mateo_hdz"}
] AS datos
MATCH (bot:Usuario {username: datos.bot})
MATCH (u:Usuario   {username: datos.seguido})
MERGE (bot)-[:FOLLOWS]->(u);
