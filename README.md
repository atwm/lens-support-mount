# Lens Tripod Collar

Parametric OpenSCAD design for a 3D-printable split tripod collar for mirror lenses with a T2 mount (~95–120 mm barrel diameter). Includes a matching focus-puller ring.

## Parts

Six printable bodies are laid out in the default render:

| Part | Material | Qty |
|------|----------|-----|
| Rigid collar — top half (T) | PETG / PLA+ / ASA | 1 |
| Rigid collar — bottom half + Arca-Swiss foot (B) | PETG / PLA+ / ASA | 1 |
| TPU liner — top half | TPU 95A | 1 |
| TPU liner — bottom half | TPU 95A | 1 |
| Focus-puller ring — top half (T) | PETG / PLA+ | 1 |
| Focus-puller ring — bottom half (B) | PETG / PLA+ | 1 |
| Focus-puller ring TPU liner — top half | TPU 95A | 1 |
| Focus-puller ring TPU liner — bottom half | TPU 95A | 1 |

## Hardware (per collar + focus ring)

- 4 × M4 socket head cap screws (length to suit flange depth)
- 4 × M4 hex nuts
- 4 × alignment pins (3 mm diameter dowel, ~7 mm long)
- 1 × 1/4"-20 UNC bolt for tripod mount

## Getting Started

1. Open `lens_collar.scad` in [OpenSCAD](https://openscad.org/) (≥ 2021.01 recommended).
2. Measure your lens barrel with calipers and fill in the four parameters marked `← MEASURE`:

```
lens_od       — outer diameter at the collar position
lens_grip_w   — available axial zone width for the collar
focus_od      — outer diameter at the focus ring zone
focus_grip_w  — available axial zone width for the focus ring
```

3. Adjust print-compensation values (`fdm_hole_comp`, `tpu_t`, `tpu_fit_gap`) to match your printer.
4. Press **F6** to render, then export each half as a separate STL via **File → Export**.

## Print Settings

**Rigid halves (PETG / PLA+ / ASA)**
- Layer height: 0.2 mm
- Infill: 40 %+ (gyroid or honeycomb recommended)
- Perimeters: 4
- No supports required — all overhangs ≤ 45°

**TPU liners (95A or softer)**
- Speed: 20–30 mm/s
- Infill: 0 % (solid walls only)
- Perimeters: 2–3
- No supports required

## Assembly

1. Insert M4 nuts into the nut-trap pockets on the **B** halves (snap through the thin bridge layer with the nut).
2. Seat the TPU liner halves inside the rigid ring halves.
3. Place the collar around the lens barrel, aligning the anti-rotation key (rib at 12 o'clock) with the matching slot in the top liner half.
4. Bring the two halves together; the alignment pins self-locate the split faces.
5. Thread M4 bolts through the top-half counterbores and snug them up evenly.

## Arca-Swiss Foot

The bottom half carries a built-in Arca-Swiss dovetail rail (38 mm standard width). Safety lips at each end prevent the plate from sliding out of the clamp. Mate with any standard Arca-Swiss / RRS-compatible quick-release clamp.

## License

[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
