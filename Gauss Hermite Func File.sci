function Hrx=H(n, var)
 if modulo(n,2)==0 then
 M=n/2;
 else
 M=(n-1)/2;
 end
 T=zeros(1,M+1)
 for m=0:M
 s=n-2*m
 T(s+1)=(-1)^m*gamma(n+1)*(2^(n-2*m))/(gamma(m+1)*gamma(n-2*m+1))//disp(T)
 end
 Hrx=poly(T,var,"c")//c is "coefficient"
endfunction
funcprot(0)
Hrx=H(n, var)
