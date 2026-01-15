# Electrochemical Corrosion Modeling (Tafel Plot)

## Overview
This project models uniform electrochemical corrosion using mixed potential
theory. Anodic metal dissolution and cathodic reduction reactions are described
using polarization kinetics, and the corrosion potential (Ecorr) and corrosion
current density (icorr) are determined numerically.

The model is extended to study:
- Effect of pH on cathodic reactions
- Oxygen diffusion–limited corrosion
- Galvanic corrosion between dissimilar metals

The simulations are implemented in MATLAB and are suitable for educational
and research-oriented corrosion analysis.

---

## Physical Background
Electrochemical corrosion occurs when a metal is exposed to an electrolyte.
Metal dissolution (anodic reaction) and reduction reactions (cathodic reaction)
occur simultaneously. The corrosion potential is established when the anodic
and cathodic current densities are equal in magnitude.

---

## Governing Equations

### Anodic reaction (metal dissolution)
i_a = i0_a * exp((E - Eeq_a) / beta_a)

### Cathodic reaction (reduction)
i_c = -i0_c * exp((Eeq_c - E) / beta_c)

The corrosion condition is:
i_a + i_c = 0

---

## Model Extensions

### pH Dependence
The equilibrium potential of the cathodic reaction is modified using the
Nernst equation:
Eeq_c = E0 - 0.059 * pH

### Diffusion-Limited Oxygen Reduction
At high cathodic overpotentials, oxygen reduction becomes diffusion limited.
The cathodic current is capped by a limiting current density (i_lim).

### Galvanic Corrosion
Two dissimilar metals electrically coupled in the same electrolyte share a
common potential. The more active metal corrodes at an accelerated rate.

---

## Numerical Method
- Polarization curves are computed over a range of potentials
- The mixed potential is found by minimizing the net current
- Semi-log Evans diagrams are generated for analysis

---

## Results

### Effect of pH on Cathodic Reaction
The cathodic polarization curve shifts with pH due to changes in equilibrium
potential as predicted by the Nernst equation.

![pH effect on cathodic reaction](figures/pH_effect.png)

### Diffusion-Limited Corrosion
At high cathodic overpotentials, oxygen reduction becomes diffusion controlled,
leading to a limiting current density.

![Diffusion-limited corrosion](figures/diffusion_limit.png)

---

## Notes
This project emphasizes physical understanding, clean numerical modeling,
and reproducible results over black-box simulation.
