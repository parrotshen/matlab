Signal:
s(t) = A(t)*cos(2*pi*f*t + P(t))
     = A(t)*cos(2*pi*f*t)*cos(P(t)) - A(t)*sin(2*pi*f*t)*sin(P(t))

I(t) = A(t)*cos(P(t))
Q(t) = A(t)*sin(P(t))


Modulation:
s(t) = I(t)*cos(2*pi*f*t) + Q(t)*sin(2*pi*f*t)
       ^^^^                 ^^^^
       In-phase             Quadrature

f is carrier frequency


Demodulation:
Q(t) -> s(t)*sin(2*pi*f*t)
      = I(t)*cos(2*pi*f*t)*sin(2*pi*f*t) + Q(t)*sin(2*pi*f*t)*sin(2*pi*f*t)
      = I(t)*sin(4*pi*f*t)/2 + Q(t)/2 + Q(t)*cos(4*pi*f*t)/2
I(t) -> s(t)*cos(2*pi*f*t)
      = I(t)*cos(2*pi*f*t)*cos(2*pi*f*t) + Q(t)*sin(2*pi*f*t)*cos(2*pi*f*t)
      = I(t)/2 + I(t)*cos(4*pi*f*t)/2 + I(t)*sin(4*pi*f*t)/2

Downconvert:
s(t)*e^(2*pi*f*t) = s(t)*{cos(2*pi*f*t) + i*sin(2*pi*f*t)}
                  = s(t)*cos(2*pi*f*t) + i*{s(t)*sin(2*pi*f*t)}
                    ^^^^^^^^^^^^^^^^^^      ^^^^^^^^^^^^^^^^^^
                    In-phase                Quadrature
I(t) = s(t)*cos(2*pi*f*t)
Q(t) = s(t)*sin(2*pi*f*t)

