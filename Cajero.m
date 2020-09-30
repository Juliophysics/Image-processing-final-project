clear variables;
close all;
clc
%Programa para identificar billetes de 200 y 500 falsos o autenticos usando
%la función Cuentabilletes

I=imread('200falsodefinitivo.jpg');
umb=0.12; % Las condiciones de la camara fueron distintas y este es el umbral para estos casos esp
discrimina=0.9;
Valor  = Cuentabilletes( I,umb,discrimina );
