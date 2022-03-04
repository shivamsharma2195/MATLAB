clear all;
close all;
clc;

%Reading image
imge=imread('lenna.jpg');
figure,imshow(imge);
prob=0.3;
%  converting an image to grayscale
%a=rgb2gray(a);
% z=1;

G=[1 1 0 1 0 0 0;0 1 1 0 1 0 0;1 1 1 0 0 1 0;1 0 1 0 0 0 1];
H=[1 0 0;0 1 0;0 0 1;1 1 0;0 1 1;1 1 1;1 0 1];
% h=[1 0 0 1 0 1 1;0 1 0 1 1 1 0;0 0 1 0 1 1 1];

%size of the image
[m,n]=size(imge);
vector=[];
Vector=[];          

  error=0;          
for a=1:m
    for b=1:n
%       bitd=[0 0 0 0 0 0 0 0];  
      no=imge(a,b);
      bit=dec2bin(no);
      j=0;
     bitd=0;
      bitd(1,1:8)=[0 0 0 0 0 0 0 0];  
      for f=1:length(bit)
          bitd(1,9-f)=bit(length(bit)+1-f);
            bg=bin2dec(bit(length(bit)+1-f));
            if bg==1
                bitd(1,9-f)=1;
            else
               bitd(1,9-f)=0; 
            end
                
      end
      
      v1=bitd(1,1)*G(1,1:7);
      v2=bitd(1,2)*G(2,1:7);
      v3=bitd(1,3)*G(3,1:7);
      v4=bitd(1,4)*G(4,1:7);
      v5=bitd(1,5)*G(1,1:7);
      v6=bitd(1,6)*G(2,1:7);
      v7=bitd(1,7)*G(3,1:7);
      v8=bitd(1,8)*G(4,1:7);
      
    dat1=xor((xor(v1,v2)),(xor(v3,v4)));
    dat2=xor((xor(v5,v6)),(xor(v7,v8)));
      
      V=[dat1 dat2];

% Vector=[Vector V];     
      r=V;
       
%     vector=[vector bitd];


    zero=0;
    one=0;





      zero=0;
one=0;
for c=1:length(r)
        if (r(c)==0)
            
           zero=zero+1;
            zerobit(zero)=c;
        else
            one=one+1;
            onebit(one)=c;
        end
    
end


        %getting no of bits to be flipped
ezero=floor(zero*prob);
eone=floor(one*prob);
    

%flipping 0's
for c=1:ezero
     zro=randi(zero);
    r(zerobit(zro))=1;    
end
%flipping 1's
for c=1:eone
    vne=randi(one);
%     disp('passed through one');
    r(onebit(vne))=0;    
    
end


u1=r(1,1)*H(1,1:end);
u2=r(1,2)*H(2,1:end);
u3=r(1,3)*H(3,1:end);
u4=r(1,4)*H(4,1:end);
u5=r(1,5)*H(5,1:end);
u6=r(1,6)*H(6,1:end);
u7=r(1,7)*H(7,1:end);
u8=r(1,8)*H(1,1:end);
u9=r(1,9)*H(2,1:end);
u10=r(1,10)*H(3,1:end);
u11=r(1,11)*H(4,1:end);
u12=r(1,12)*H(5,1:end);
u13=r(1,13)*H(6,1:end);
u14=r(1,14)*H(7,1:end);

    z1=xor((xor(u1,u2)),(xor(u3,u4)));
    z2=xor((xor(u5,u6)),u7);

syndrome1=xor(z1,z2);

z1=xor((xor(u8,u9)),(xor(u10,u11)));
    z2=xor((xor(u12,u13)),u14);
syndrome2=xor(z1,z2);
eror1=0;
eror2=0;
for c=1:7
 %      for  d=1:3
          
     if (H(c,1:3)==syndrome1(1:3))
        error=error+1;
         eror1=c;
     end  
        
      if (H(c,1:3)==syndrome2(1:3))
        error=error+1;
         eror2=c;
     end 
     
   
%       end
end

%     if (error~=0)
% 
%             if r(1,eror1)==1
%                 r(1,eror1)=0;
%             else
%                 r(1,eror1)=1;
%             end
%             
%              if r(1,eror2)==1
%                 r(1,eror2)=0;
%             else
%                 r(1,eror2)=1;
%             end
%             
%     end    
       
       
       

             

data1=r(1,4:7);
data2=r(1,11:14);
data=[data1 data2];
% converting into decimal
num=0;
        j=0;    
  for f=1:8
    
           dig=data(1,9-f);
            
            num=(dig*(2^(j)))+num;
            j=j+1;
            
                
      end

        matrix(a,b)=num;
            
    end
    
    
% for a=1:8
%     if (bitd(a)==0)
%             
%            zero=zero+1;
%            
%         else
%             one=one+1; 
%     
%     end
%     
% end
% 
%         
% %         bitd(:)
%         if (0==rem(one,2))
%             
%         else
%          error=error+1;
%        
%         end
       zero=0;
       one=0;
    
        
%        if (matrix(a,b)~=imge(a,b))
%            error=error+1;
%        end
%         imagesc(matrix);
%         colormap(gray);
end
    

figure
imagesc(matrix);
colormap(gray);
            