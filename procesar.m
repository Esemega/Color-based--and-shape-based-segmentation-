clc,clear,close;
imgd=[];
disp('Hola! Este scrip es capaz de segmentar una imagen mediante diferentes formas geom�tricas o colores.');
disp('Para continuar pulse cualquier tecla y elija una imagen a procesar.');
pause;
archivo=abrir_img_dsd_explorador;
imagen = imread(archivo);
figure,imshow(imagen);
h=msgbox('Se muestra la imagen para verificar que se ha cargado correctamente. ');
waitfor(h);
while true
    eleccion=input('Por favor, elija el tipo de procesamiento que desea realizar, 1 COLOR 2 FORMA 3 LOCALIZACI�N 4 CAMBIAR IMAGEN 5 SALIR');

    if eleccion == 5 %condici�n para salir
            break
    else
        if eleccion == 1
            imgo=imagen;
            color=input('Por favor, elija el color a segmentar, 1 ROJO 2 VERDE 3 AZUL 4 OTROS');
            [num,imgd] = miSegmentacion_color(imgo,color);
            h=msgbox(sprintf('Se muestra la imagen resultante. \nEl n�mero de figuras detectadas es: %d',num));
            waitfor(h);
        elseif eleccion == 2
            imgo=imcomplement(imbinarize(rgb2gray(imagen)));
            forma=input('Por favor, elija la forma a segmentar, 1 C�RCULO 2 CUADRADO 3 TRIANGULO 4 OTRAS');
            [num,imgd] = miSegmentacion_forma(imgo,forma);
            h=msgbox(sprintf('Se muestra la imagen resultante. \nEl n�mero de figuras detectadas es: %d',num));
            waitfor(h);
        elseif eleccion == 3
            if isempty(imgd)
                disp('Elija primero el procesamiento 1 o 2 para tener una imagen donde localizar las figuras.');
            else
            [pos,ori] = miLocalizacion(imgd);
            end
        elseif eleccion == 4
            archivo=abrir_img_dsd_explorador;
            imagen = imread(archivo);
            figure,imshow(imagen);
            h=msgbox('Se muestra la imagen para verificar que se ha cargado correctamente. ');
            waitfor(h);
        else
            disp('Opci�n no definida.');
        end
    end
end