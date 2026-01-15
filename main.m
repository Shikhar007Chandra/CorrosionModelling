clc; clear; close all;

E = linspace(-1,1,1500);

% Base parameters
p.i0a = 1e-6;
p.i0c = 1e-8;
p.Eeq_a = -0.5;
p.ba = 0.05;
p.bc = 0.10;

%% -------- pH EFFECT --------
pHlist = [1 4 7 10];

figure; hold on;
for k = 1:numel(pHlist)
    p.Eeq_c = 0 - 0.059*pHlist(k);
    [ia, ic] = polCurves(E,p);
    semilogy(E, abs(ic), 'LineWidth',1.4);
end
xlabel('Potential (V)');
ylabel('Current density (A/cm^2)');
title('pH effect on cathodic reaction');
legend('pH 1','pH 4','pH 7','pH 10');
grid on;

%% -------- DIFFUSION LIMIT --------
p.Eeq_c = -0.2;
p.ilim = 1e-4;

[ia, ic] = polCurves(E,p);
inet = ia + ic;

[~,id] = min(abs(inet));
Ec = E(id); icr = ia(id);

figure;
semilogy(E,abs(ia),'r',E,abs(ic),'b','LineWidth',1.5); hold on;
plot(Ec,icr,'ko','MarkerFaceColor','k');
xlabel('Potential (V)');
ylabel('Current density (A/cm^2)');
title('Diffusion-limited corrosion');
legend('Anodic','Cathodic','Corrosion point');
grid on;

%% -------- GALVANIC CORROSION --------
pA = p; pB = p;

pA.Eeq_a = -0.6;   % active metal
pB.Eeq_a = -0.3;   % noble metal

inetG = galvNet(E,pA,pB);
[~,ig] = min(abs(inetG));
Eg = E(ig);

disp(['Galvanic potential = ',num2str(Eg),' V']);
