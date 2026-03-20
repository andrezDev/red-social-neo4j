// 05-Historia.cypher

UNWIND [
  {id: "HIS-001", type: "imagen", user: "santi_g"},
  {id: "HIS-002", type: "video",  user: "vale_mtz"},
  {id: "HIS-003", type: "imagen", user: "seba_lop"},
  {id: "HIS-004", type: "imagen", user: "isa_rod"},
  {id: "HIS-005", type: "video",  user: "mateo_hdz"},
  {id: "HIS-006", type: "imagen", user: "gabi_tor"},
  {id: "HIS-007", type: "video",  user: "dani_ram"},
  {id: "HIS-008", type: "imagen", user: "cami_gom"},
  {id: "HIS-009", type: "imagen", user: "andres_dz"},
  {id: "HIS-010", type: "video",  user: "mari_mor"}
] AS datos

MERGE (h:Historia {id: datos.id})
ON CREATE SET
  h.id         = datos.id,
  h.type       = datos.type,
  h.views      = 0,
  h.status     = "activo",
  h.created_at = datetime(),
  h.expires_at = datetime() + duration({hours: 24})

RETURN h.id, h.type, h.status, h.expires_at
ORDER BY h.id
