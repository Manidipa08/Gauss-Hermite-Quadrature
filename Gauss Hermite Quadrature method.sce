//Date : 22/04/2022
//Aim : To solve integrals using Gauss Hermite method
clc
clear
a=-10
//a=input("Enter the lower limit a - ")
b=10
//b=input("Enter the upper limit b - ")
n=input("Enter the value of n - ")
var="x"
exec('C:\Users\MANIDIPA BANERJEE\Desktop\MP III Scilab SEM - IV\Gauss Hermite Func File.sci',-1)
disp("The hermite polynomial formed = ",Hrx)
r=roots(Hrx)
disp("The roots of the hermite polynomial = ",r)
//matrix A
A=zeros(n,n)
for i=1:n
    for j=1:n
        if i==1
          A(i,j)=1;
        else
          A(i,j)=r(j).^(i-1)
        end
    end
end
disp("Matrix A - ",A)
//defining B
B=zeros(n,1)
for i=1:n
    if modulo(i,2)==0//even rhs will be zero
      B(i,1)=0;
    else
      B(i,1)=gamma(i/2)//for odd values
    end
end
disp("Matrix B - ",B)
//for the weights
W=inv(A)*B
disp("The calculated weights are W = ",W)
deff('y=f(x)','y=exp(-x^2).*x.*sin(x)')
I=0
for i=1:n
    I=I+W(i)*r(i).*sin(r(i))
end
disp("Integration using Gauss quadrature method (legendre) = ",I)
//using inbuilt command
I_inbuilt=integrate('f(x)','x',a,b)
disp("Integration using inbuilt command =",I_inbuilt)

