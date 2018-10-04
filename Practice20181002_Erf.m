%% 開始
close all
clearvars
tic

%% ガウス関数（Gaussian function）
x = -5:0.01:5;
y_gaussian = exp(-x.^2);
figure(1)
plot(x,y_gaussian,'LineWidth',2);
grid on
grid minor
title('Gaussian Function','FontSize',20)

%% 標準正規分布（Normal Distribution）
x = -10:0.01:10;
y_normpdf = normpdf(x,2,3);
figure(2)
plot(x,y_normpdf,'LineWidth',2);
grid on
grid minor
title('Normal Distribution','FontSize',20)

%% 誤差関数erf
x = 0:0.1:100;
y_erf = erf(x);

y_erf_fake = sqrt((1-exp(-x.^2)));

syms k x
y_erf_another = symsum((2/sqrt(pi))*((-1)^k/((2*k+1)*factorial(k)))*x^(2*k+1), k, [0 Inf]);

x = 0:0.1:100;
figure(3)
plot(x,y_erf,x,y_erf_fake,'LineWidth',2);
ylim([-2,2]);
xlim([0,5]);
ax = gca;
ax.FontSize = 15;
legend('erf','Fake');
grid on
grid minor

disp(y_erf_another);

%% 相補誤差関数erfc
x = -10:0.1:10;
y_erf = erf(x);
y_erfc = erfc(x);
figure(5)
plot(x,y_erf,x,y_erfc,'LineWidth',2);
ax = gca;
ax.FontSize = 15;
legend('erf','erfc');
ylim([-5,5]);
grid on
grid minor

%% Chi二乗分布
x = -10:0.1:500;
y_chi_1 = chi2pdf(x,1);
y_chi_2 = chi2pdf(x,2);
y_chi_4 = chi2pdf(x,4);
y_chi_32 = chi2pdf(x,32);
y_chi_64 = chi2pdf(x,64);
figure(6)
plot(x,y_chi_1,x,y_chi_2,x,y_chi_4,x,y_chi_32,x,y_chi_64,'LineWidth',2);
ax = gca;
ax.FontSize = 15;
legend('k=1','k=2','k=4','k=32','k=64')
xlim([-5,100]);
grid on
grid minor
title('Chi-Square Distribution','FontSize',20)

%% 終了
toc
