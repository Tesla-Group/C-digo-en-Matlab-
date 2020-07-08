%% Inicialización definición de sistema coordenado
% figure
cla reset
grid on
box on
axis ([-500, 350, -500, 350, 0, 350]);
ax1 = gca; % current axes
ax1.XColor = 'w';
ax1.YColor = 'w';
ax1.ZColor = 'w';
set(gca,'GridColor',[0.1 0.2 0.9])
%  left_color = [.5 .5 0];
%  right_color = [0 .5 .5];
% set(gcf,'defaultAxesColorOrder',[left_color; right_color]);


text(50,0.5,0,'x');%texto de cordenadas para X
text(0,50,0.5,'y');%texto de cordenadas para Y
text(0.5,0,50,'z');%texto de cordenadas para Z
origen=[0;0;0;1];%cordenadas de nuestro origen de los ejes X, Y, Z
Po1=[30;0;0;1];%cordenadas para el eje X
Po2=[0;30;0;1];%cordenadas para el eje Y
Po3=[0;0;30;1];%cordenadas para el eje Z
line([origen(1),Po1(1)], [origen(2),Po1(2)], [origen(3),Po1(3)],'Color','r','lineWidth',2);
line([origen(1),Po2(1)], [origen(2),Po2(2)], [origen(3),Po2(3)],'Color','r','lineWidth',2);
line([origen(1),Po3(1)], [origen(2),Po3(2)], [origen(3),Po3(3)],'Color','r','lineWidth',2);
hold on;
% %% definicion de las variables de inicio del sistema
% T1 = input('Angulo1 :  ');
% T2 = input('Angulo2 :  ');
% T3 = input('Angulo3 :  ');
% syms T1 T2 T3
%% Definicion de la cinematica directa del robot
m01=[cosd(T1) 0 sind(T1) 0; sind(T1) 0 -cosd(T1) 0;0 1 0 130;0 0 0 1];
m12=[cosd(T2-90) -sind(T2-90) 0 -120*cosd(T2-90); sind(T2-90) cosd(T2-90) 0 -120*sind(T2-90); 0 0 1 0; 0 0 0 1];
m23=[cosd(T3+90) -sind(T3+90) 0 120*cosd(T3+90); sind(T3+90) cosd(T3+90) 0 120*sind(T3+90); 0 0 1 0; 0 0 0 1];
m03=m01*m12*m23
Tra=[0 0 0 52.5*cosd(T1); 0 0 0 52.5*sind(T1);0 0 0 -50;0 0 0 0]
m04= m03 + Tra
% FINAL=m04(:,4)
% TCPx=(105*cos((pi*T1)/180))/2 - 120*cos((pi*T1)/180)*cos((pi*(T2 - 90))/180) + 120*cos((pi*T1)/180)*cos((pi*(T2 - 90))/180)*cos((pi*(T3 + 90))/180) - 120*cos((pi*T1)/180)*sin((pi*(T2 - 90))/180)*sin((pi*(T3 + 90))/180);
% TCPy=(105*sin((pi*T1)/180))/2 - 120*sin((pi*T1)/180)*cos((pi*(T2 - 90))/180) + 120*sin((pi*T1)/180)*cos((pi*(T2 - 90))/180)*cos((pi*(T3 + 90))/180) - 120*sin((pi*T1)/180)*sin((pi*(T2 - 90))/180)*sin((pi*(T3 + 90))/180);
% TCPz=120*cos((pi*(T2 - 90))/180)*sin((pi*(T3 + 90))/180) - 120*sin((pi*(T2 - 90))/180) + 120*cos((pi*(T3 + 90))/180)*sin((pi*(T2 - 90))/180) + 80;
% COORDENADAS_TCP=[TCPx;TCPy;TCPz]
% TCPx = 92.5*cosd(T1) - 120*cosd(T1)*cosd(T2 - 90) + 120*cosd(T1)*cosd(T2 - 90)*cosd(T3 + 90) - 120*cosd(T1)*sind(T2 - 90)*sind(T3 + 90);
% TCPy = 92.5*sind(T1) - 120*sind(T1)*cosd(T2 - 90) + 120*sind(T1)*cosd(T2 - 90)*cosd(T3 + 90) - 120*sind(T1)*sind(T2 - 90)*sind(T3 + 90);
% TCPz = 120*cosd(T2 - 90)*sind(T3 + 90) - 120*sind(T2 - 90) + 120*cosd(T3 + 90)*sind(T2 - 90) + 15;
%% Cinematica Inverza

%% Dibujo sistema m01
origen1=m01*origen; %origen sistema m01
Po11=m01*Po1;       %transformación de x a x1
Po21=m01*Po2;       %transformación de y a y1
Po31=m01*Po3;       %transformación de z a z1
line([origen1(1),Po11(1)], [origen1(2),Po11(2)], [origen1(3),Po11(3)],'Color','k','lineWidth',2);
line([origen1(1),Po21(1)], [origen1(2),Po21(2)], [origen1(3),Po21(3)],'Color','k','lineWidth',2);
line([origen1(1),Po31(1)], [origen1(2),Po31(2)], [origen1(3),Po31(3)],'Color','k','lineWidth',2);
text(Po11(1),Po11(2),Po11(3),'x1');%texto de cordenadas para X1
text(Po21(1),Po21(2),Po21(3),'y1');%texto de cordenadas para Y1
text(Po31(1),Po31(2),Po31(3),'z1');%texto de cordenadas para Z1
%% Dibujo sistema m02
origen2=m01*m12*origen; % origen sistema m02
Po12=m01*m12*Po1;       %transformación de x a x2
Po22=m01*m12*Po2;       %transformación de y a y2
Po32=m01*m12*Po3;       %transformación de z a z2
line([origen2(1),Po12(1)], [origen2(2),Po12(2)], [origen2(3),Po12(3)],'Color','k','lineWidth',2);
line([origen2(1),Po22(1)], [origen2(2),Po22(2)], [origen2(3),Po22(3)],'Color','k','lineWidth',2);
line([origen2(1),Po32(1)], [origen2(2),Po32(2)], [origen2(3),Po32(3)],'Color','k','lineWidth',2);
text(Po12(1),Po12(2),Po12(3),'x2');%texto de cordenadas para X2
text(Po22(1),Po22(2),Po22(3),'y2');%texto de cordenadas para Y2
text(Po32(1),Po32(2),Po32(3),'z2');%texto de cordenadas para Z2
%% Dibujo sistema m03
origen3=m01*m12*m23*origen;  %origen sistema m03
Po13=m01*m12*m23*Po1;        %transformación de x a x3
Po23=m01*m12*m23*Po2;        %transformación de y a y3
Po33=m01*m12*m23*Po3;        %transformación de z a z3
line([origen3(1),Po13(1)], [origen3(2),Po13(2)], [origen3(3),Po13(3)],'Color','k','lineWidth',2);
line([origen3(1),Po23(1)], [origen3(2),Po23(2)], [origen3(3),Po23(3)],'Color','k','lineWidth',2);
line([origen3(1),Po33(1)], [origen3(2),Po33(2)], [origen3(3),Po33(3)],'Color','k','lineWidth',2);
text(Po13(1),Po13(2),Po13(3),'x3');%texto de cordenadas para X3
text(Po23(1),Po23(2),Po23(3),'y3');%texto de cordenadas para Y3 
text(Po33(1),Po33(2),Po33(3),'z3');%texto de cordenadas para Z3
%% Dibujo sistema m04
origen4=m04*origen;  %origen sistema m03
Po14=m04*Po1;        %transformación de x a x4
Po24=m04*Po2;        %transformación de y a y4
Po34=m04*Po3;        %transformación de z a z4
line([origen4(1),Po14(1)], [origen4(2),Po14(2)], [origen4(3),Po14(3)],'Color','k','lineWidth',2);
line([origen4(1),Po24(1)], [origen4(2),Po24(2)], [origen4(3),Po24(3)],'Color','k','lineWidth',2);
line([origen4(1),Po34(1)], [origen4(2),Po34(2)], [origen4(3),Po34(3)],'Color','k','lineWidth',2);
text(Po14(1),Po14(2),Po14(3),'x4');%texto de cordenadas para X4
text(Po24(1),Po24(2),Po24(3),'y4');%texto de cordenadas para Y4
text(Po34(1),Po34(2),Po34(3),'z4');%texto de cordenadas para Z4

%% Dibujo del robot Cyan
line([origen(1),origen1(1)], [origen(2),origen1(2)], [origen(3),origen1(3)],'Color','c','lineWidth',2); % Dibujo del primer eslabón
line([origen1(1),origen2(1)], [origen1(2),origen2(2)], [origen1(3),origen2(3)],'Color','c','lineWidth',2); % Dibujo del segundo eslabón
line([origen2(1),origen3(1)], [origen2(2),origen3(2)], [origen2(3),origen3(3)],'Color','c','lineWidth',2); % Dibujo del tercer eslabón
line([origen3(1),origen4(1)], [origen3(2),origen4(2)], [origen3(3),origen4(3)],'Color','c','lineWidth',2); % Dibujo del tercer eslabón
text(origen4(1),origen4(2),origen4(3)-2,'TCP');%texto de cordenadas para lineas
