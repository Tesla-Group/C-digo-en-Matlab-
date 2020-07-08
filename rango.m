
function [rango]=rango(x,y,z)
rangoxz=sqrt(x^2+y^2);
if rangoxz<13 || rangoxz>250 || z<0 || z>230
    rango=false;
else
    rango=true;
end