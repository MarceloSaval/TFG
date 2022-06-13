%Abrir la camara y leer una imagen%
%Llamar al facerecognition con la imagen de la camara%
%Llamar a SOM con las coordenadas del facerecognition%

 
clear; clc; close all;
guardar = 0;
%Creamos un objeto para la webcam

cam = webcam();

%captura una imagen para calcular el tamaño

videoFrame = snapshot(cam);

frameSize = size(videoFrame);

%Creamos un objeto para mostrar la imagen en un video
%videoPlayer = vision.VideoPlayer('Position',[100 100 [frameSize(2),frameSize(1)]+30]);

for i= 1:100
    videoFrame = snapshot(cam); %todas las fotos
         if guardar

    % Guardar la imagen en la ubicacion especifica y con el nombre declarado

        ent = input('Nombre de la imagen: ', 's'); %El usuario escribe el nombre de la foto
        mkdir('fotos'); %Crea la carpeta

        imwrite(videoFrame,['fotos\',ent,'.jpg']); %Se guarda en la carpeta fotos con la extension jpg
    else
        [puntosfaciales, faceLocation] = facerecognitionTFG(videoFrame);
        pintarpuntosfaciales(videoFrame,puntosfaciales, faceLocation);
    end
%     step(videoPlayer,videoFrame); %muestra el video
end



% Limpiar las variables

clear cam;
% release(videoPlayer);