function T = elementTransform(nodes,elements,e)

theta = elementtheta(nodes,elements,e);
t = transform(theta);

T = zeros(4,6);

T(1,1:2) = t(2,1:2);
T(3,4:5) = t(2,1:2);
T(2,3) = 1;
T(4,6) = 1;

return;