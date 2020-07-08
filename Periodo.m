function [PeriodoX,PeriodoY,PeriodoZ]=Periodo(AnguloX,AnguloY,AnguloZ)
%%control de velocidad%% 
WN=50;                                      %velocidad angular normal en rpm
PN=(0.005/WN)*60   ;  
if AnguloX==0 && AnguloY==0 && AnguloZ==0
    PeriodoX=PN*1000;PeriodoY=PN*1000;PeriodoZ=PN*1000;
else
    A=max([abs(AnguloX),abs(AnguloY),abs(AnguloZ)]);           %angulo mayor
                      %periodo normal a WN 
    % assignin('base','v',Var);
    if AnguloX ==0
        PeriodoX=PN*1000;                 %periodo para los ejes x y z
        PeriodoY=(PN+(abs(AnguloY/A))*PN)*1000;
        PeriodoZ=(PN+(abs(AnguloZ/A))*PN)*1000;
    elseif AnguloY==0
        PeriodoX=(PN+(abs(AnguloX/A))*PN)*1000;
        PeriodoY=PN*1000;                 %periodo para los ejes x y z
        PeriodoZ=(PN+(abs(AnguloZ/A))*PN)*1000;
    elseif AnguloZ==0
        PeriodoX=(PN+(abs(AnguloX/A))*PN)*1000;
        PeriodoY=(PN+(abs(AnguloY/A))*PN)*1000;
        PeriodoZ=PN*1000;
    else
        PeriodoX=(PN+(abs(AnguloX/A))*PN)*1000;
        PeriodoY=(PN+(abs(AnguloY/A))*PN)*1000;
        PeriodoZ=(PN+(abs(AnguloZ/A))*PN)*1000;
    end
end