function [imagenout]=pintarpuntosfaciales(imagenin,puntosfaciales)
    figure 
    imshow(imagenin)
    hold on;
    for i=1:2:length(puntosfaciales)-1
        plot(puntosfaciales(i), puntosfaciales(i+1), 'ro', 'MarkerSize', 30);
    end
end
