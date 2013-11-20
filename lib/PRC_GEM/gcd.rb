#~ Trabajo realizado por Sergio Martín santana (alu0100611625)
#~ 18/10/2013
#~ Lenguajes y Paradigmas de la Programación

def gcd(u, v)
  u, v = u.abs, v.abs
  while v != 0
    u, v = v, u % v
  end
  u
end
#puts gcd(6,3)
