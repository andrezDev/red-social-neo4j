// 03-Plataforma.cypher

MERGE (p:Plataforma {id: "PLT-001"})
ON CREATE SET
  p.id          = "PLT-001",
  p.name        = "SocialApp",
  p.version     = "1.0.0",
  p.url         = "socialapp.com",
  p.description = "Red social para compartir momentos",
  p.status      = "activo",
  p.launched_at = date()

RETURN p
