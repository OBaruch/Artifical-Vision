imaqhwinfo;
dev=imaqhwinfo('winvideo');
dev.DeviceInfo(1) %ver infromacion de la camara la mia acepta hasta HD
vid=videoinput('winvideo'); %asignar vid a la camara
preview(vid) %Activar camara



%para todo 
%stop(vidobj)
%im=getsnapshot(vid);
%ycbcr2rgb(im);
%imshow(im);