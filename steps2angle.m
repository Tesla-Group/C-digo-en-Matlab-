function [ang]=steps2angle(np)
%%%%comvierte de pasos a angulos. para 1/8 paso (0.2225º en el motor --> 0.0622589 en el engrane mayor)
% 100*90*1.2813*8/                    62.25
ang=round(0.0622589*np,0);
% 1 paso en el motor------> 0.0622589
%   np                           ang