ObjectiveFunction = @simple_objective;
X0 = [0.5 0.5]; % ≥ı ºµ„
options = saoptimset('PlotFcns',{@saplotbestx,@saplotbestf,@saplotx,@saplotf});
[x,fval,exitFlag,output] = simulannealbnd(ObjectiveFunction,X0,[],[],options)