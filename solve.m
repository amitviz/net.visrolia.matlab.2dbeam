function [u,R] = solve(nodes,elements,Ae,Ee,Ie,Fn,BCn)

K = globalK(nodes,elements,Ae,Ee,Ie);
  
F = globalF(nodes,Fn);
   
[Kb,Fb] = applyBC(nodes,K,F,BCn);

u = Kb\Fb;
R = K*u;

return;