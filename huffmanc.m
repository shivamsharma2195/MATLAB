p=input('enter the probabilities');
n=length(p);
symbols=[1:n];
[dict,avglen]=huffmandict(symbols,p);
temp=dict;
t=dict(:,2);
%for i=1:length(temp)
 %   temp(i,2)=num2str(temp(i,2));
%end
%disp('the huffman code dictionary is:');
%disp(temp)
%fprintf('enter the no between 1 to %d',n);
%sym=input(':');
%encode=huffmanenco(sym,dict);
encode=huffmanenco(1:n,dict);
disp('the encoded output');
disp(encode);
%bits=input('enter the bit stream');
%decode=huffmandeco(bits,dict);
%disp('the symbols are');
%disp(decode);
h=0;
z=0;
for k=1:n
    h=h+(p(k)*log2(1/p(k)));
end
fprintf('the average entropy is %d',h);
n=h/avglen;
fprintf('the efficiency is %d',n);
for r=1:n
    l(r)=length(t(r));
end
m=max(1);
s=min(1);
v=m-s;
fprintf('the variance is %d',v);
