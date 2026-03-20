// 02-Cuenta_falsa.cypher

UNWIND [
  {id: "USR-051", name: "Bot",    last_name: "Fake01",  fn: "2000-01-01", em: "bot01@fake.com",   u: "bot_fake01",  ps: "Fake123!", city: "Desconocida"},
  {id: "USR-052", name: "Bot",    last_name: "Fake02",  fn: "2000-01-01", em: "bot02@fake.com",   u: "bot_fake02",  ps: "Fake123!", city: "Desconocida"},
  {id: "USR-053", name: "Cuenta", last_name: "Falsa01", fn: "2000-01-01", em: "falsa01@fake.com", u: "falsa_01",    ps: "Fake123!", city: "Desconocida"},
  {id: "USR-054", name: "Cuenta", last_name: "Falsa02", fn: "2000-01-01", em: "falsa02@fake.com", u: "falsa_02",    ps: "Fake123!", city: "Desconocida"},
  {id: "USR-055", name: "Spam",   last_name: "Bot03",   fn: "2000-01-01", em: "spam03@fake.com",  u: "spam_bot03",  ps: "Fake123!", city: "Desconocida"}
] AS datos

MERGE (u:Usuario {id: datos.id})
ON CREATE SET
  u.id                = datos.id,
  u.name              = datos.name,
  u.last_name         = datos.last_name,
  u.birth_date        = date(datos.fn),
  u.email             = datos.em,
  u.username          = datos.u,
  u.password          = datos.ps,
  u.city              = datos.city,
  u.registration_date = date(),
  u.last_access       = datetime(),
  u.is_fake           = true,
  u.is_active         = false

RETURN u.username, u.is_fake, u.is_active
