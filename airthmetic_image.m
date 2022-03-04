clc;
clear all;
 a=imread('lenna.jpg');
 figure;
 imshow(a);
 
 char=['a':'z'];

%  converting an image to grayscale
%a=rgb2gray(a);
z=1;

%size of the image
[m,n]=size(a);


%airthmetic encoding starts from here

for row=1:m
    for col=1:n
        no=a(row,col);
        
        if no>99==1
            rem=mod(no,100);
            quo=(no-rem)/100;
            code(z)=char(quo+1);
            codeno(z)=quo;
            z=z+1;
            rem1=mod(rem,10);
            quo1=(rem-rem1)/10;
            code(z)=char(quo1+1);
            codeno(z)=quo1;
            z=z+1;
            code(z)=char(rem1+1);
            codeno(z)=rem1;
            z=z+1;
            
        elseif no<100==1
            code(z)='a';
            codeno(z)=0;
            z=z+1;
            rem=mod(no,10);
            quo=(no-rem)/10;
            code(z)=char(quo+1);
            codeno(z)=quo;
            z=z+1;
            code(z)=char(rem+1);
            codeno(z)=rem;
            z=z+1; 
            
        else
        end
    end
end
            
            
            
            
%Arithmetic decoding starts from here            
            
z=1;            
val=0;    
for row=1:m
    for col=1:n
        
        for d=1:3
            
        for c=1:26
           if char(c)==code(z);
               z=z+1;
               no=c-1;
           end
        end
        val=(no*100)+val;
        end
        matrix(row,col)=val;
        
    end
end


               
               
 figure
 imshow(matrix);
        
        
        