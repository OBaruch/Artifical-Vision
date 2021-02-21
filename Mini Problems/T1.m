clc
%ejercicio 1 Calcular los valores de una funcion
%ejercicio 2 Graficarla

%2 PDF 

%asunto: codigo Tarea 1 
y=[];
for x=-2:.5:4
    f = sin(cos(sqrt(2)*sqrt(x^2)));
    y=[y f];
end
y
x=-2:.5:4
plot(x,y);
xlabel('Eje x');
ylabel('Eje y');
title('Funcion rara');
grid on;
