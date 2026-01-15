function inet = galvNet(E, pA, pB)
% Net current for galvanic couple

[iaA, icA] = polCurves(E, pA);
[iaB, icB] = polCurves(E, pB);

inet = iaA + icA + iaB + icB;

end
