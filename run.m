tic;
nodes = [0 0; 10 0];
elements = [1 2];
Ee = ones(size(elements,1),1)*210e9;
Ae = ones(size(elements,1),1)*1e-4;
Ie = ones(size(elements,1),1)*8.3333e-10;
BCn = [1 1 1 1];
Fn = [size(nodes,1) 0 -1e2 0];

m = 1;
[nodes,elements,Ae,Ee,Ie] = ...
    meshRefinement(nodes,elements,Ae,Ee,Ie,m);

[u,R] = solve(nodes,elements,Ae,Ee,Ie,Fn,BCn);

plotmesh(nodes,elements,Ae,Ee,Ie,u)
toc;