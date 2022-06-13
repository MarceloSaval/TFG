function [imagenout]=pintarpuntosfaciales(imagenin,puntosfaciales, facelocation)
    figure 
    imshow(imagenin)
    hold on;
    for i=1:2:length(puntosfaciales)-1
        
        x = puntosfaciales(i)   + facelocation(1,1);
        y = puntosfaciales(i+1) + facelocation(1,2);
        
        plot(x, y, 'ro', 'MarkerSize', 10);
    end
end
