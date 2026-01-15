function [ia, ic] = polCurves(E, p)
% Polarization curves

ia = p.i0a .* exp((E - p.Eeq_a) ./ p.ba);

ic_act = -p.i0c .* exp((p.Eeq_c - E) ./ p.bc);

% Diffusion-limited cathodic current
if isfield(p,'ilim')
    ic = max(ic_act, -p.ilim);
else
    ic = ic_act;
end

end
