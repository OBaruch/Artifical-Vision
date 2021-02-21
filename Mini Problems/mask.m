 clear 
 clc
im=imread('Capture.PNG');
ig=rgb2gray(im);

 [x y]=size(ig);
 

 mask=imread('negra.png');
 igm=rgb2gray(mask);
 
 for i=1:x
     for j=1:y
         im2(i,j)=ig(i,j)-igm(i,j);
     end
     
 end
 
 imshow(im2);
 
 