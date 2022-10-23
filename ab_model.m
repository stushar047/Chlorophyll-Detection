clc;
% clear all;
close all;
Num=40;
C=[41.2 33.4 39.4 35.6 38.4 30.5 37.6 42.8 33.5 42.7 48.2 44.2 41 37.1 40.6 46.6 47.7 45 40.6 29 33.2 36.1 37.6 47 45.4 36.6 42.3 39.2 36.9 34.2 37.6 41.6 38.5 35.8 25.5 27.5 22.5 25.6 31 26.8];
%C=[41.2 33.4 39.4 35.6 38.4 30.5 37.6 42.8 33.5 42.7 48.2 44.2 41 37.1 40.6 46.6 47.7 45 40.6 29 33.2 36.1 37.6 47 45.4 36.6 42.3 39.2 36.9 34.2 37.6 41.6 38.5 35.8 25.5 27.5 22.5 25.6 31 26.8];
for i=1:Num
filename=sprintf('D%d.jpg',i);
a1=imread(filename);
a=rgb2hsv(a1);
A=rgb2lab(a1);

r=a1(:,:,1);
g=a1(:,:,2);
bb=a1(:,:,3);

h=a(:,:,1);
s=a(:,:,2);
v=a(:,:,3);

L=A(:,:,1);
a=A(:,:,2);
b=A(:,:,3);

avg_r(i)=mean(nonzeros(r));
avg_g(i)=mean(nonzeros(g));
avg_bb(i)=mean(nonzeros(bb));

avg_h(i)=mean(nonzeros(h));
avg_s(i)=mean(nonzeros(s));
avg_v(i)=mean(nonzeros(v));

avg_L(i)=mean(nonzeros(L));
avg_a(i)=mean(nonzeros(a));
avg_b(i)=mean(nonzeros(b));
% avg_rb=(avg_g)/(avg_r);
end
Ah=[avg_h(1:6),avg_h(8:30),avg_h(32:34),avg_h(36:36),avg_h(38:40)];
As=[avg_s(1:6),avg_s(8:30),avg_s(32:34),avg_s(36:36),avg_s(38:40)];
Av=[avg_v(1:6),avg_v(8:30),avg_v(32:34),avg_v(36:36),avg_v(38:40)];
AL=[avg_L(1:6),avg_L(8:30),avg_L(32:34),avg_L(36:36),avg_L(38:40)];
Aa=[avg_a(1:6),avg_a(8:30),avg_a(32:34),avg_a(36:36),avg_a(38:40)];
Ab=[avg_b(1:6),avg_b(8:30),avg_b(32:34),avg_b(36:36),avg_b(38:40)];
Ch=[C(1:6),C(8:30),C(32:34),C(36:36),C(38:40)];
% Eq_V=B(1)+B(2)*Ah+B(3)*Aa+ B(4)*Ab;
% Er=abs(Ch-Eq_V);
% plot(Er,'*')
% figure(1)
% subplot(1,2,1)
% plot(C,avg_r,'*')
% figure(1)
% plot(avg_h,C,'o')
% xlabel('Average h value of HSV Model')
% ylabel('Cholorophyll')
% ylim([15 55])
% figure(2)
% plot(avg_s,C,'o')
% xlabel('Average s value of HSV Model')
% ylabel('Cholorophyll')
% ylim([15 55])
% figure(3)
% plot(avg_v,C,'o')
% xlabel('Average v value of HSV Model')
% ylabel('Cholorophyll')
% ylim([15 55])
% figure(4)
% plot(avg_L,C,'o')
% xlabel('Average L value of Lab Model')
% ylabel('Cholorophyll')
% ylim([15 55])
% figure(5)
% plot(avg_a,C,'o')
% xlabel('Average a value of Lab Model')
% ylabel('Cholorophyll')
% ylim([15 55])
figure(6)
plot(avg_b,C,'o')
xlabel('Average b value of Lab Model')
ylabel('Cholorophyll')
ylim([15 55])
% subplot(1,2,2)
% plot(avg_b,C,'*')
% xlabel('Average b')
% ylabel('Cholorophyll')

