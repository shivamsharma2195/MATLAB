clear all
clc
n=input('no of symbols : ');
m=n;
c=zeros(100,100);
for i=1:n
    p(i)=input('length : ');    
    c(i,1:p(i))= input('codeword : ');
end
L=0;
J=0;
for i=1:(n)
    for j=1:(n)
        while J>0
            for i=1:n
                for j=1:m                
                    if i~=j 
                        if p(i)< p(j)
                            if c(i,1:p(i)) == c((j),1:p(i))
                                c(n+1,1:(p(j)-p(i)))= c((j),p(i)+1:p(j));
                                p(n+1)=p(j)-p(i);
                                n=n+1;
                                J=0;                         
                            end
                        end
                    end
                end
            end
        end
        if L==0
            for i=1:n 
                for j=1:n            
                    if i~=j 
                        if p(i)< p(j)
                            if c(i,1:p(i)) == c((j),1:p(i))
                                c(n+1,1:(p(j)-p(i)))= c((j),p(i)+1:p(j));
                                p(n+1)=p(j)-p(i);
                                n=n+1;
                                L=L+1;
                                J=J+1;                                
                            end
                        end
                    end
                end
            end
         end
    end
end
k=0;
for i=1:m
    for j=m+1:n
        if p(i)==p(j)
            if (c(i,1:p(i))==c(j,1:p(j)))
                k=k+1;
            end
        end
    end
end
o=0;
if k==0
    for i=1:(m)
        for j=1:(m)
            if i~=j
                if p(i)== p(j)
                    if c(i,1:p(i)) == c((j),1:p(i))
                        o=o+1;
                    end
                end
            end
        end
    end
end
if k~=0
    disp('Given code is not uniquely identification code');
end
if o~=0
    disp('Given code is not uniquely identification code');
else if k==0 & o==0
    disp('Given code is uniquely identification code');
    end
end
if L==0
    disp('Given code is instantaneous code');
end