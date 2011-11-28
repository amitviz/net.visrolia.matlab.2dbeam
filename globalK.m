function Kg = globalK(nodes,elements,Ae,Ee,Ie)

Kg = eye(size(nodes,1)*3);

for el = 1:size(elements,1)
    L = elementL(nodes,elements,el);
    kel =  elementK(Ae(el),Ee(el),L,Ie(el));    % 4x4 local element stiffness
    
    T = elementTransform(nodes,elements,el);
    
    ke = T'*kel*T;                              % 6x6 global element stiffness
    if all(all(ke == ke'))
        fprintf('Element %2i stiffness matrix is not symmetric\n',el);
    end

    % Scatter
    DOFe = kron((3*(elements(el,:)-1)),ones(1,3)) + kron(ones(1,2),1:3);
    Kg(DOFe,DOFe) = Kg(DOFe,DOFe) + ke;
    
end


return;