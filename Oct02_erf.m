%% 開始
close all
clearvars
tic

%% ガウス関数（Gaussian function）
x = -100:0.01:10000;
y_gaussian = exp(-x.^2);
figure(1)
plot(x,y_gaussian);
xlim([-5,5])

%%
x = -100:0.01:10000;
y_origin = x .* exp(-x.^2);
figure(4)
plot(x,y_origin)
xlim([-5,5])

%% 誤差関数erf
% x = 0:0.1:100;
% y_erf = erf(x);
% 
% y_erf_fake = sqrt((1-exp(-x.^2)));
% 
% syms k x
% y_erf_another = symsum((2/sqrt(pi))*((-1)^k/((2*k+1)*factorial(k)))*x^(2*k+1), k, [0 Inf]);
% 
% x = 0:0.1:100;
% figure(2)
% plot(x,y_erf,x,y_erf_another);
% ylim([-2,2]);
% xlim([0,5])
% grid on
% grid minor

%% 相補誤差関数erfc
y_erfc = erfc(x);
figure(3)
plot(x,y_erfc);
ylim([-5,5]);

%% 正規分布
y_normpdf = normpdf(x,0,1);
figure(10)
plot(x,y_normpdf);

%% Chi二乗分布
y_chi = chi2pdf(x,64);
figure(11)
plot(x,y_chi);
xlim([-1,10000]);
E = mean(y_chi);
disp(E);

%% 終了
toc