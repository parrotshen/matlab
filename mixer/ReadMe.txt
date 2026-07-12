cos( -A) = cos(A)
cos(A+B) = cos(A)cos(B) - sin(A)sin(B)
cos(A-B) = cos(A)cos(B) + sin(A)sin(B)

cos(A+B)/2 + cos(A-B)/2
= cos(A)cos(B)/2 - sin(A)sin(B)/2 + cos(A)cos(B)/2 + sin(A)sin(B)/2
= cos(A)cos(B)/2 + cos(A)cos(B)/2
= cos(A)cos(B)


Real domain:

  cos(2*pi*fa*t) * cos(2*pi*fb*t)
= cos( 2*pi*(fa+fb)*t)/2 + cos( 2*pi*(fa-fb)*t)/2
= cos( 2*pi*(fa+fb)*t)/2 + cos(-2*pi*(fa-fb)*t)/2
= cos(-2*pi*(fa+fb)*t)/2 + cos( 2*pi*(fa-fb)*t)/2
= cos(-2*pi*(fa+fb)*t)/2 + cos(-2*pi*(fa-fb)*t)/2


Complex domain:

  e^( j*2*pi*fa*t) * e^( j*2*pi*fb*t)
= e^( j*2*pi*(fa+fb)*t)

  e^( j*2*pi*fa*t) * e^(-j*2*pi*fb*t)
= e^( j*2*pi*(fa-fb)*t)

  e^(-j*2*pi*fa*t) * e^( j*2*pi*fb*t)
= e^( j*2*pi*(fb-fa)*t)

  e^(-j*2*pi*fa*t) * e^(-j*2*pi*fb*t)
= e^(-j*2*pi*(fa+fb)*t)

