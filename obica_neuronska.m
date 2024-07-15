P=[y (:,1)];
T=[y (:,2)];
minulaz=min(P);
maxulau=max(P);
minizlaz=min(T);
maxizlaz=max(T);
p=2*(P-minulaz)./(maxulaz-minulaz)-1;
t=2*(T-minizlaz)./(maxizlaz-minizlaz)-1;
net=newff([-1 1], [60 1], {'tansig','purelin'},'trainlm');
net.trainParam.epochs=1000;
net.trainParam.show=100;
net.trainParam.time=2e-9;
net.performFcn='sse';
tic
net=train(net,p',t');
toc
izalz=sim(net,p);
izlaz=(izlaz+1)*(maxizlaz-minizlaz).*2+maxizlaz;
figure
plot(p',izlaz,'r');
title('Podaci dobiveni sa treniranom neuronskom mrežom');
xlabel('x osa');
ylabel('y osa');
gensim(net,0.1);