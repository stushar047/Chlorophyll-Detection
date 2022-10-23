%hsv
Ah=[avg_h(1:6),avg_h(8:30),avg_h(32:34),avg_h(36:36),avg_h(38:40)];
As=[avg_s(1:6),avg_s(8:30),avg_s(32:34),avg_s(36:36),avg_s(38:40)];
Av=[avg_v(1:6),avg_v(8:30),avg_v(32:34),avg_v(36:36),avg_v(38:40)];
%Lab
AL=[avg_L(1:6),avg_L(8:30),avg_L(32:34),avg_L(36:36),avg_L(38:40)];
Aa=[avg_a(1:6),avg_a(8:30),avg_a(32:34),avg_a(36:36),avg_a(38:40)];
Ab=[avg_b(1:6),avg_b(8:30),avg_b(32:34),avg_b(36:36),avg_b(38:40)];
%%ex
A1=[avg1(1:6),avg1(8:30),avg1(32:34),avg1(36:36),avg1(38:40)];
% A2=[avg2(1:6),avg2(8:30),avg2(32:34),avg2(36:36),avg2(38:40)];
%%
X=[ones(length(Ah),1),Av'];
Ch=[C(1:6),C(8:30),C(32:34),C(36:36),C(38:40)];
%Correlation
C_h=corr2(Ah,Ch);
C_s=corr2(As,Ch);
C_v=corr2(Av,Ch);
C_L=corr2(AL,Ch);
C_a=corr2(Aa,Ch);
C_b=corr2(Ab,Ch);
C_1=corr2(A1,Ch)
% figure(1)
% plot(Ch,Ah,'o','MarkerSize',10,'MarkerFaceColor',[1 .6 .6])
% ylabel('"H" value')
% xlabel('SPAD-502 Chlorophyll data')
% 
% figure(2)
% plot(Ch,As,'o','MarkerSize',10,'MarkerFaceColor',[1 .6 .6])
% ylabel('"S" value')
% xlabel('SPAD-502 Chlorophyll data')
% 
% figure(3)
% plot(Ch,Av,'o','MarkerSize',10,'MarkerFaceColor',[1 .6 .6])
% ylabel('"V" value')
% xlabel('SPAD-502 Chlorophyll data')
% 
% figure(4)
% plot(Ch,AL,'o','MarkerSize',10,'MarkerFaceColor',[1 .6 .6])
% ylabel('"L" value')
% xlabel('SPAD-502 Chlorophyll data')
% 
% figure(5)
% plot(Ch,Aa,'o','MarkerSize',10,'MarkerFaceColor',[1 .6 .6])
% ylabel('"a" value')
% xlabel('SPAD-502 Chlorophyll data')
% 
% figure(6)
% plot(Ch,Ab,'o','MarkerSize',10,'MarkerFaceColor',[1 .6 .6])
% ylabel('"b" value')
% xlabel('SPAD-502 Chlorophyll data')
% 
% figure(7)
% plot(Ch,A1,'o','MarkerSize',10,'MarkerFaceColor',[1 .6 .6])
% ylabel('"a-b" value')
% xlabel('SPAD-502 Chlorophyll data')
% C_2=corr2(A2,Ch)
% Errors
Y=Ch';%SPAD value
XT=transpose(X);
A=(XT*X);
K=inv((XT*X));
B=K*XT*Y;
M=X*B;%Measured value
E=Y-M;
Acc=1-(abs(M-Y)./Y);
V0=0;
N0=0;
V1=0;
N1=0;
V2=0;
N2=0;
V3=0;
N3=0;
V4=0;
N4=0;
for i=1:length(Ch)
if Ch(i)>=20 && Ch(i)<=30  
    V0=V0+Acc(i);
    N0=N0+1;
    
elseif Ch(i)>=30 && Ch(i)<=35
    V1=V1+Acc(i);
    N1=N1+1;
    
elseif Ch(i)>=35 && Ch(i)<=40
    V2=V2+Acc(i);
    N2=N2+1;
   
elseif Ch(i)>=40 && Ch(i)<=45
    V3=V3+Acc(i);
    N3=N3+1;
   
elseif Ch(i)>=45 && Ch(i)<=50
    V4=V4+Acc(i);
    N4=N4+1;
   
end
end
Acc_0=V0./N0
Acc_1=V1./N1
Acc_2=V2./N2
Acc_3=V3./N3
Acc_4=V4./N4
