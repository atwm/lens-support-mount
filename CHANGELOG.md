# Changelog

All notable changes to this project are documented here.

---

## 2026-05-12

### Fixed
- Renamed `bolt_holes` parameter to `use_counterbore` in `flange_tab` and `focus_flange_tab` — the old name implied both branches skipped bolt holes, which was incorrect; both always drill a through-hole and the parameter only controls counterbore vs nut trap.
- Fixed `focus_tab_angle` placement at 0° and 180°: `sin()` returns a floating-point value near zero at these angles rather than exactly 0, causing the pull tab to appear on the wrong half. Threshold changed from `>= 0` to `> 1e-9`.
- Clarified `foot_l` comment, which incorrectly stated the value was already independent of `lens_grip_w` when it was set equal to it.
- Added missing parameter guards for the focus-puller ring: `focus_grip_w` vs counterbore depth, `focus_root_chamfer` vs tab half-width, `focus_tab_l > 0`, `focus_tab_angle` in [0, 360), and `nut_bridge_t >= 0.4 mm`.
- Added "T" / "B" part labels to focus-ring halves (`half_focus_ring`), matching the existing labels on collar halves.
- Replaced all magic `0.01` epsilon literals with a named constant `eps = 0.01`.
- Changed `$fn = 120` to `$fn = $preview ? 32 : 120` so F5 preview renders quickly while F6 export retains full resolution.

---

## 2026-05-12

### Added
- Initial parametric design: split rigid collar with Arca-Swiss tripod foot, TPU inner liner with anti-rotation key, alignment pins, orientation index marks, and part labels.
- Focus-puller ring: split ring with radial pull tab, tactile grip bumps, root gussets, and single index line.
- Parameter guards with descriptive `assert()` messages for all critical dimensions.
- Print-orientation comments; all parts designed to print flat-side-down without supports.
