clear variables;
close all;
clc
im=imread('Imagenprueba.png');
im2 = im2bw(im, 0.45); %Binarizando la imagen 
imshow(im2);
[g,t]=edge(im2,'canny'); %Haciendo la imagen de bordes 
figure();
imshow(g);
[a,b]=find(g==1);%Coordenadas donde trazar los circulos de radio r
tamano=size(im2); %Tamaño de la imagen para definir ejes 
centers=[0 0];
dim1=0;
radio=0;
for r=10:20
u=-r:tamano(2); 
v=-r:tamano(1);
[U,V]=meshgrid(u,v);
D=hypot(U,V);
F=double(D<=r); %Definiendo los circulos 
F=circshift(F,[r+2 r+2]);   %Desplazandolo para formar buenos bordes
F=im2bw(F,0.45);
F2=zeros(tamano);
F2=F(r+2:end, r+2:end); %Asignando los valore anteriores 
figure();    
imshow(F2) 
[g1,t1]=edge(F2,'canny'); %Obteniendo imagen de bordes del circulo anterior
numpoints=numel(a); %Número de circulos a dibujar en el espacio de Hough 
g=0;

for i=1:numpoints
 g=double(g+circshift(g1,[a(i)-r-2 b(i)-r-2])); %dibujar un circulo para cada punto
end

figure();
imshow(g)
centersant=centers;
tamant=size(centersant);
tama=tamant(1);
[p,t]=find(g>=r*4.4);%Encontrar los circulos de radio 10 en la imagen 
C=[t,p];
centers=[centersant;C];
radii=double(zeros(size(t)));
radii(:)=r;
radio=[radio;radii];


%tami=size(centers);
%dim1=dim1+tami(1);

%final=zeros(dim1,2); %Matriz para todos los centros 
%final(1:tamant,:)=centersant;

%final(tamant:,:)=centers;

end
figure();
imshow(im);
cc=size(centers);
rr=size(radio);
centrosf=zeros(cc(1)-1,cc(2)-1);
radiosf=zeros(rr(1)-1,rr(2));
centrosf=centers(2:end,:);
radiosf=radio(2:end);
viscircles(centrosf,radiosf);

% %g=g+circshift(g1,[(a(1)-12) (b(1)-12)]);
% figure();    
% imshow(g)
% 
% [p,t]=find(g>=51);%Encontrar los circulos de radio 10 en la imagen 
% centers=[t,p];
% radii=double(zeros(size(t)));
% radii(:)=r;
% viscircles(centers,radii);             
% 
