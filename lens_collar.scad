// ============================================================
//  Lens Tripod Collar
//  Mirror lens (T2-mount, ~95–120 mm barrel)
//  Split rigid ring (PETG/PLA) + TPU inner liner
// ============================================================

// ============================================================
//  MEASUREMENTS — fill these in with your calipers
// ============================================================

// 1. Outer diameter of the lens barrel at the collar position.
//    Measure the widest point in that zone.
lens_od        = 105;   // [mm]  ← MEASURE

// 2. Available flat/cylindrical zone length along the optical axis.
//    The collar must fit entirely within a zone without buttons,
//    focus rings, or markings.
lens_grip_w    = 30;    // [mm]  ← MEASURE

// ============================================================
//  PRINT SETTINGS — adjust to match your slicer/printer
// ============================================================

// FDM holes print slightly undersized due to filament squish.
// 0.2 mm is typical for a well-calibrated printer.
// If bolts are too tight after printing, increase this value.
fdm_hole_comp  = 0.2;   // [mm] added to all drilled hole diameters

// TPU liner thickness.  2 mm gives good grip and protection
// without making the assembly too stiff to clamp.
// Print TPU at low speed (20–30 mm/s), 0% infill (solid walls only),
// 2–3 perimeters.
tpu_t          = 2.0;   // [mm] TPU liner wall thickness

// Fit between TPU liner outer face and rigid ring inner face.
// 0 = press fit (TPU compressed slightly, good grip).
// Increase to 0.2–0.3 if the liner is hard to seat.
tpu_fit_gap    = 0.0;   // [mm] radial clearance each side

// Anti-rotation key: a small rectangular rib on the ring bore wall at
// the 12 o'clock position (+Y).  Matching slot in the TPU liner OD.
// Prevents the top-half liner from spinning inside the ring when clamped.
liner_key_w    = 3.0;   // [mm] key width (tangential)
liner_key_h    = 2.0;   // [mm] key height (protrudes from bore wall into bore)

// ============================================================
//  RIGID RING PARAMETERS
//  Recommended materials: PETG (good strength + slight flex),
//  PLA+ (stiff, fine for indoor use), ASA (if used outdoors).
//  Avoid standard PLA for a tripod collar — it creeps under load.
// ============================================================

wall_t         = 8;     // [mm] ring wall thickness — keep ≥6 mm for strength
ring_chamfer   = 1.0;   // [mm] chamfer on outer Z-edges of ring (top & bottom)
                        //      reduces delamination risk and removes sharp corners

// Inner diameter of the rigid ring accounts for TPU liner.
// The rigid ring bores to fit the liner OD, not the bare lens.
rigid_id       = lens_od + 2 * (tpu_t + tpu_fit_gap);
ring_od        = rigid_id + 2 * wall_t;

// ============================================================
//  CLAMP FLANGES
// ============================================================

flange_w       = 14;    // [mm] flange tab width
flange_t       = 9;     // [mm] flange tab radial thickness
// M4 bolt: ISO clearance = 4.3 mm + fdm_hole_comp for FDM shrinkage
bolt_d         = 4.3 + fdm_hole_comp;
// M4 hex nut: across-flats 7.0 mm, trap adds 0.4 mm clearance + fdm_hole_comp
nut_trap_d     = 7.4 + fdm_hole_comp;
nut_trap_depth = 4.0;   // [mm] depth of nut trap (M4 nut is 3.2 mm thick)
nut_bridge_t   = 0.6;   // [mm] thin bridge over nut trap opening — keeps nut captive
                         //      during assembly.  Printed as a bridging layer; snap
                         //      through it with the nut when installing.
// M4 socket head cap screw: head ⌀ 7.0 mm, head height 4.0 mm.
// Counterbore sinks the head flush so it doesn't snag on a bag or hand.
cbore_d        = 7.2 + fdm_hole_comp;  // [mm] counterbore diameter
cbore_depth    = 4.3;                  // [mm] counterbore depth (head + 0.3 clearance)

// ============================================================
//  TRIPOD FOOT — Arca-Swiss dovetail rail
// ============================================================

foot_w         = 38;    // [mm] rail width at top (Arca-Swiss standard)
foot_h         = 12;    // [mm] total foot height below ring
// Foot length along the optical axis (Z).
// Defaults to lens_grip_w so the plate matches the collar width.
// Increase (e.g. 50–60 mm) for heavier lenses: a longer Arca-Swiss rail
// distributes the load and gives the clamp more grip surface.
// Must satisfy: foot_l > 2 * (as_lip_t + 2)
foot_l         = lens_grip_w;   // [mm] — change independently of lens_grip_w if needed
// 1/4"-20 UNC: nominal 6.35 mm + clearance + fdm_hole_comp
tripod_hole_d  = 6.6 + fdm_hole_comp;

// Dovetail chamfer: 45° cut on both lower longitudinal edges.
// 5 mm gives a dovetail bottom width of 38 - 2×5 = 28 mm,
// which works with all standard Arca-Swiss clamps.
as_chamfer     = 5.0;   // [mm] chamfer leg length (both legs equal → 45°)

// Safety lips: the chamfer is intentionally shorter than the foot.
// The unchamfered sections at each end keep the full foot_w width at the
// bottom edge and catch the clamp, preventing the plate sliding out.
as_lip_t       = 4.0;   // [mm] lip length at each end (chamfer-free zone)

// Reinforcement gussets at each Z-end of the foot.
// They fill the corner between the foot side face and the ring bottom,
// turning the sharp foot-ring junction into a braced triangle.
// Rule: gusset_d ≤ gusset_h keeps the hypotenuse ≥ 45° from horizontal
// so both gussets print without supports (flat-side-down orientation).
gusset_h       = 12;    // [mm] gusset height along the foot side (Y direction)
gusset_d       = 8;     // [mm] gusset depth beyond foot end  (Z direction)

// ============================================================
//  ALIGNMENT PINS — one per flange pair, top-half protrudes
// ============================================================

align_pin_d    = 3.0;                    // [mm] pin diameter
align_pin_l    = 3.5;                    // [mm] pin protrusion past split face
align_socket_d = 3.0 + fdm_hole_comp + 0.2;  // [mm] socket ID (loose slip fit)
align_socket_l = 4.0;                    // [mm] socket depth (deeper than pin)

// ============================================================
//  PART LABELS
//  "T" and "B" engraved on the flat print face (Y=0 plane) of
//  each half, in the ring wall cross-section on the +X side.
//  Readable when looking at the flat face from below the part.
// ============================================================

label_size   = 5.0;   // [mm] character height
label_depth  = 0.8;   // [mm] engraving depth (≈ 2 layer heights)

// ============================================================
//  ORIENTATION INDEX MARKS
//  Shallow slots on the ring OD at 90° intervals.
//  They serve as visual and tactile references when loosening
//  the bolts and rotating the collar to landscape/portrait.
// ============================================================

idx_w          = 2.0;   // [mm] slot width (tangential)
idx_depth      = 1.2;   // [mm] slot depth into ring OD (radial)
idx_l          = 8.0;   // [mm] slot length along optical axis

// ============================================================
//  FOCUS PULLER RING
//  A narrow split ring clamped over the focus ring zone of the
//  lens barrel.  A radial paddle on the top half (+Y) lets you
//  pull focus by hand.  Uses the same M4 hardware as the collar
//  — one bolt per flange pair, centred in Z.
//  Print rigid halves in PETG/PLA+, liner in TPU.
// ============================================================

// 3. OD of the barrel at the focus ring zone (often slightly different
//    from the main barrel diameter where the collar sits).
focus_od        = 98;   // [mm]  ← MEASURE

// 4. Usable axial width at the focus ring (flat, featureless zone).
focus_grip_w    = 10;   // [mm]  ← MEASURE

focus_tpu_t     = 1.5;  // [mm] TPU liner thickness
focus_tpu_gap   = 0.0;  // [mm] radial fit clearance between liner OD and ring ID
focus_wall_t    = 6;    // [mm] ring wall thickness

focus_flange_w  = 12;   // [mm] flange tab width (tangential)
focus_flange_t  = 8;    // [mm] flange tab radial thickness

// Pull tab (paddle) extending radially from the top (+Y) of the ring.
// Increase focus_tab_l for more torque / easier single-finger operation.
focus_tab_w     = 20;   // [mm] tab width (X direction, tangential)
focus_tab_l     = 30;   // [mm] tab length (Y direction, radial)

// Pull tab angle: 90 = top (+Y, default), 0 = right (+X), 270 = bottom (−Y).
// Determines which half the tab is generated on (top or bottom half of ring).
focus_tab_angle    = 90;    // [deg]

// Triangular gussets at the ±X root edges of the tab where it meets the ring OD.
// Adds material at the stress riser instead of removing it.
focus_root_chamfer = 4;     // [mm]

// Tactile grip bumps on both Z-faces of the tab (the faces the thumb/finger presses).
focus_grip_bump_d  = 2.0;   // [mm] bump diameter
focus_grip_bump_h  = 0.8;   // [mm] bump height above face
focus_grip_bump_sp = 4.0;   // [mm] centre-to-centre spacing

// Single engraved index line on the ring OD — reference for logging focus distances.
// Default 270° places it at the bottom (opposite the default tab at 90°).
focus_index_angle  = 270;   // [deg]

// Derived
focus_rigid_id  = focus_od + 2 * (focus_tpu_t + focus_tpu_gap);
focus_ring_od   = focus_rigid_id + 2 * focus_wall_t;

// ============================================================
//  RENDER GAP & RESOLUTION
// ============================================================

gap            = 0.3;   // [mm] visual gap between halves in preview
eps            = 0.01;  // [mm] epsilon overcut — prevents z-fighting in boolean ops
$fn            = $preview ? 32 : 120;

// ============================================================
//  PARAMETER GUARDS
//  These assert() calls abort the render with a clear message
//  instead of silently producing broken geometry.
// ============================================================

assert(foot_l > 2 * (as_lip_t + 2),
    str("foot_l (", foot_l, " mm) too short — needs > 2*(as_lip_t+2) = ",
        2*(as_lip_t+2), " mm so the chamfered rail section has non-zero length."));

assert(wall_t >= 4,
    str("wall_t (", wall_t, " mm) too thin — minimum 4 mm for structural integrity."));

assert(tpu_t >= 0.8,
    str("tpu_t (", tpu_t, " mm) too thin — minimum 0.8 mm (≈ 2 perimeters) for a printable TPU liner."));

assert(lens_grip_w > 2 * cbore_depth,
    str("lens_grip_w (", lens_grip_w, " mm) too narrow — bolt counterbores (",
        cbore_depth, " mm each side) would overlap at Z=0."));

assert(gusset_d <= gusset_h,
    str("gusset_d (", gusset_d, " mm) > gusset_h (", gusset_h,
        " mm) — hypotenuse angle would be <45°, requiring supports to print."));

assert(focus_grip_w > bolt_d + 2,
    str("focus_grip_w (", focus_grip_w, " mm) too narrow — needs > bolt_d + 2 = ",
        bolt_d + 2, " mm for material either side of the clamp bolt in Z."));

assert(focus_grip_w > 2 * cbore_depth,
    str("focus_grip_w (", focus_grip_w, " mm) too narrow — counterbores (",
        cbore_depth, " mm each side) would overlap at Z=0."));

assert(focus_root_chamfer < focus_tab_w / 2,
    str("focus_root_chamfer (", focus_root_chamfer, " mm) ≥ focus_tab_w/2 (",
        focus_tab_w / 2, " mm) — root gussets would overlap at tab centre."));

assert(focus_tab_l > 0,
    "focus_tab_l must be > 0 mm.");

assert(focus_tab_angle >= 0 && focus_tab_angle < 360,
    str("focus_tab_angle (", focus_tab_angle, "°) out of range — must be in [0, 360)."));

assert(nut_bridge_t >= 0.4,
    str("nut_bridge_t (", nut_bridge_t, " mm) too thin — minimum 0.4 mm (≈ 2 layers at 0.2 mm) for reliable bridging."));

// ============================================================
//  MODULES — RIGID RING
// ============================================================

module ring_body() {
    difference() {
        union() {
            // Hollow ring shell
            difference() {
                cylinder(d = ring_od,  h = lens_grip_w, center = true);
                cylinder(d = rigid_id, h = lens_grip_w + 1, center = true);
            }
            // Anti-rotation key: rib on bore wall at +Y (12 o'clock).
            // Added after hollowing so the ID subtraction cannot remove it.
            translate([0, rigid_id / 2 - liner_key_h / 2, 0])
                cube([liner_key_w, liner_key_h, lens_grip_w], center = true);
        }
        // Orientation index marks — one slot per 90° quadrant.
        // 0°=+X(right), 90°=+Y(top), 180°=−X(left), 270°=−Y(bottom/foot).
        for (a = [0, 90, 180, 270])
            rotate([0, 0, a])
                translate([ring_od / 2 - idx_depth / 2 + 0.5, 0, 0])
                    cube([idx_depth + 1, idx_w, idx_l], center = true);

        // Chamfers on the two outer Z-edges (top and bottom of ring OD).
        // Each is a right-triangle prism swept around the Z-axis.
        // sz=+1 → top edge, sz=−1 → bottom edge.
        for (sz = [-1, 1])
            rotate_extrude()
                polygon([
                    [ring_od / 2 - ring_chamfer, sz *  lens_grip_w / 2           ],
                    [ring_od / 2 + eps,         sz *  lens_grip_w / 2           ],
                    [ring_od / 2 + eps,         sz * (lens_grip_w / 2 - ring_chamfer)]
                ]);
    }
}

// One clamping flange tab extending in +X from the ring OD.
// use_counterbore=true → bolt through-hole + counterbore (top half);
// use_counterbore=false → bolt through-hole + hex nut trap (bottom half).
module flange_tab(use_counterbore = true) {
    tab_x   = ring_od / 2;
    tab_ext = flange_t;

    difference() {
        translate([tab_x, 0, 0])
            cube([tab_ext, flange_w, lens_grip_w], center = true);

        for (z = [-lens_grip_w / 4, lens_grip_w / 4]) {
            translate([tab_x + tab_ext / 2, 0, z]) {
                // Bolt clearance hole through full tab thickness
                rotate([0, 90, 0])
                    cylinder(d = bolt_d, h = tab_ext + 1, center = true);
                if (use_counterbore) {
                    // Counterbore from outer face — sinks M4 socket head flush
                    translate([tab_ext / 2 - cbore_depth / 2, 0, 0])
                        rotate([0, 90, 0])
                            cylinder(d = cbore_d, h = cbore_depth + eps,
                                     center = true);
                } else {
                    // Nut trap recessed from the outer face
                    translate([-tab_ext / 2 + nut_bridge_t + nut_trap_depth / 2, 0, 0])
                        rotate([0, 90, 0])
                            cylinder(d = nut_trap_d, h = nut_trap_depth,
                                     $fn = 6, center = true);
                }
            }
        }
    }
}

module tripod_foot() {
    foot_y_top    = -(ring_od / 2);          // top face — flush with ring OD
    foot_y_bot    = foot_y_top - foot_h;     // bottom (chamfered) face
    foot_center_y = foot_y_top - foot_h / 2;

    difference() {
        union() {
            translate([0, foot_center_y, 0])
                cube([foot_w, foot_h, foot_l], center = true);

            // Triangular gussets at each Z-end of the foot.
            // Each gusset is a right-triangle prism (extruded foot_w in X)
            // with one leg along the foot side (Y) and one along the optical
            // axis (Z).  The hypotenuse faces away from the collar; its angle
            // = arctan(gusset_h / gusset_d) ≈ 56° from horizontal, which
            // prints without supports in the flat-side-down orientation.
            // rotate([0,-90,0]) maps polygon local-X → world +Z and
            // local-Y → world +Y, so the triangle points outward correctly.
            for (sz = [-1, 1])
                translate([0, foot_y_top, sz * foot_l / 2])
                    rotate([0, -90, 0])
                        linear_extrude(foot_w, center = true)
                            polygon([[0,             0        ],
                                     [sz * gusset_d, 0        ],
                                     [0,            -gusset_h ]]);
        }

        // Arca-Swiss 45° chamfers — only on the middle section.
        // The chamfer stops as_lip_t short of each end, leaving unchamfered
        // end sections that act as safety lips (full foot_w at the bottom
        // edge, wider than the chamfered profile, catches the clamp).
        for (sx = [-1, 1])
            translate([sx * foot_w / 2, foot_y_bot, 0])
                rotate([0, 0, -sx * 45])
                    cube([as_chamfer * sqrt(2), as_chamfer * sqrt(2),
                          foot_l - 2 * as_lip_t], center = true);

        // 1/4"-20 through-hole along Y (perpendicular to rail surface)
        translate([0, foot_center_y, 0])
            rotate([90, 0, 0])
                cylinder(d = tripod_hole_d, h = foot_h + 1, center = true);
    }
}

// Attachment: ring splits at Y=0.
// Each half has one flange tab at +X and one at -X, both clipped to their side.
// Mating tabs are drawn together with M4 bolts (2 per side = 4 total):
//   top half (side=1)    → bolt through-holes + alignment pins
//   bottom half (side=-1) → hex nut traps + alignment sockets + tripod foot
module half_ring(side = 1) {
    clip   = ring_od + flange_t * 2 + 2;
    tab_cx = ring_od / 2 + flange_t / 2;   // X centre of each flange tab

    difference() {
        union() {
            // Ring body AND both flange tabs, clipped to this half only.
            // Clipping the flanges ensures each half has exactly its share
            // of the mating surface — no overlap when assembled.
            intersection() {
                union() {
                    ring_body();
                    flange_tab(use_counterbore = (side == 1));           // +X side
                    rotate([0, 0, 180])
                        flange_tab(use_counterbore = (side == 1));       // -X side
                }
                translate([0, side * clip / 4, 0])
                    cube([clip, clip / 2 - gap / 2, lens_grip_w + 1],
                         center = true);
            }

            // Tripod foot outside the intersection: the clip cube is sized for
            // the ring body and would truncate the foot and its safety lips.
            if (side == -1) tripod_foot();

            // Alignment pins on top half: protrude past the split face into
            // the bottom half's sockets.  Added outside the intersection so
            // they are not clipped away.
            if (side == 1)
                for (sx = [-1, 1])
                    translate([sx * tab_cx, 0, 0])
                        rotate([90, 0, 0])
                            cylinder(d = align_pin_d, h = align_pin_l, $fn = 24);
        }

        // Alignment sockets on bottom half (subtracted after clip)
        if (side == -1)
            for (sx = [-1, 1])
                translate([sx * tab_cx, 0, 0])
                    rotate([90, 0, 0])
                        cylinder(d = align_socket_d, h = align_socket_l, $fn = 24);

        // Part label engraved into the flat print face.
        // Positioned at the centre of the ring wall cross-section on the +X side.
        // rotate([-side*90,0,0]) sends the extrusion into the correct half:
        //   side= 1 → rotate([-90,0,0]) → extrudes in +Y (into top half)
        //   side=-1 → rotate([  90,0,0]) → extrudes in -Y (into bottom half)
        translate([rigid_id / 2 + wall_t / 2, 0, 0])
            rotate([-side * 90, 0, 0])
                linear_extrude(label_depth + eps)
                    text(side == 1 ? "T" : "B",
                         size   = label_size,
                         halign = "center",
                         valign = "center",
                         font   = "Liberation Sans:style=Bold");
    }
}

// ============================================================
//  MODULES — TPU LINER
//  Print in TPU (95A or softer).  Two half-rings matching the
//  rigid collar halves.  No flanges — the liner just sits inside.
//  The slight radial compression when the collar is clamped
//  holds the liner in place and grips the lens.
// ============================================================

module tpu_liner_body() {
    difference() {
        cylinder(d = rigid_id, h = lens_grip_w,     center = true);
        cylinder(d = lens_od,  h = lens_grip_w + 1, center = true);
        // Slot matching the ring's anti-rotation key at +Y.
        // 0.4 mm extra width and 0.2 mm extra depth give easy hand assembly
        // while still eliminating rotational play.
        translate([0, rigid_id / 2 - liner_key_h / 2, 0])
            cube([liner_key_w + 0.4, liner_key_h + 0.2,
                  lens_grip_w + 1], center = true);
    }
}

module half_tpu_liner(side = 1) {
    clip = rigid_id + 2;
    intersection() {
        tpu_liner_body();
        translate([0, side * clip / 4, 0])
            cube([clip, clip / 2 - gap / 2, lens_grip_w + 1], center = true);
    }
}

// ============================================================
//  MODULES — FOCUS PULLER RING
// ============================================================

// Hollow ring shell — no anti-rotation key or index marks needed.
module focus_ring_body() {
    difference() {
        cylinder(d = focus_ring_od, h = focus_grip_w, center = true);
        cylinder(d = focus_rigid_id, h = focus_grip_w + 1, center = true);
        // Single index line — narrow slot at focus_index_angle on the OD.
        // Align with a distance scale on the lens barrel for repeatable focus.
        rotate([0, 0, focus_index_angle])
            translate([focus_ring_od / 2 - idx_depth / 2 + 0.5, 0, 0])
                cube([idx_depth + 1, 1.0, focus_grip_w - 2 * ring_chamfer], center = true);
        for (sz = [-1, 1])
            rotate_extrude()
                polygon([
                    [focus_ring_od / 2 - ring_chamfer, sz *  focus_grip_w / 2           ],
                    [focus_ring_od / 2 + eps,         sz *  focus_grip_w / 2           ],
                    [focus_ring_od / 2 + eps,         sz * (focus_grip_w / 2 - ring_chamfer)]
                ]);
    }
}

// Single-bolt flange tab (bolt centred at Z=0, one per side).
// use_counterbore=true → counterbore (top half); false → nut trap (bottom half).
module focus_flange_tab(use_counterbore = true) {
    tab_x   = focus_ring_od / 2;
    tab_ext = focus_flange_t;
    difference() {
        translate([tab_x, 0, 0])
            cube([tab_ext, focus_flange_w, focus_grip_w], center = true);
        translate([tab_x + tab_ext / 2, 0, 0]) {
            rotate([0, 90, 0])
                cylinder(d = bolt_d, h = tab_ext + 1, center = true);
            if (use_counterbore) {
                translate([tab_ext / 2 - cbore_depth / 2, 0, 0])
                    rotate([0, 90, 0])
                        cylinder(d = cbore_d, h = cbore_depth + eps, center = true);
            } else {
                translate([-tab_ext / 2 + nut_bridge_t + nut_trap_depth / 2, 0, 0])
                    rotate([0, 90, 0])
                        cylinder(d = nut_trap_d, h = nut_trap_depth,
                                 $fn = 6, center = true);
            }
        }
    }
}

// Radial pull tab — added outside the clip intersection in half_focus_ring()
// so it is never truncated.  Includes root gussets and tactile grip bumps.
module focus_pull_tab() {
    tab_base_y = focus_ring_od / 2;
    union() {
        translate([0, tab_base_y + focus_tab_l / 2, 0])
            cube([focus_tab_w, focus_tab_l, focus_grip_w], center = true);

        // Triangular gussets at ±X root edges.
        // Right-triangle prism with legs focus_root_chamfer × focus_root_chamfer,
        // extruded full ring width in Z.  Adds material at the stress concentration
        // instead of removing it.
        for (sx = [-1, 1])
            translate([sx * focus_tab_w / 2, tab_base_y, 0])
                linear_extrude(focus_grip_w, center = true)
                    polygon([[0,                        0                    ],
                             [-sx * focus_root_chamfer, 0                   ],
                             [0,                        focus_root_chamfer  ]]);

        // Tactile bumps on both Z-faces — rows within the tab, inset one spacing
        // from each edge so bumps never overhang the tab boundary.
        for (bx = [-focus_tab_w/2 + focus_grip_bump_sp
                   : focus_grip_bump_sp
                   : focus_tab_w/2 - focus_grip_bump_sp + eps])
            for (by = [tab_base_y + focus_grip_bump_sp
                       : focus_grip_bump_sp
                       : tab_base_y + focus_tab_l - focus_grip_bump_sp + eps])
                for (sz = [-1, 1])
                    translate([bx, by, sz * (focus_grip_w / 2 + focus_grip_bump_h / 2)])
                        cylinder(d = focus_grip_bump_d, h = focus_grip_bump_h,
                                 center = true, $fn = 16);
    }
}

module half_focus_ring(side = 1) {
    clip   = focus_ring_od + focus_flange_t * 2 + 2;
    tab_cx = focus_ring_od / 2 + focus_flange_t / 2;

    difference() {
        union() {
            intersection() {
                union() {
                    focus_ring_body();
                    focus_flange_tab(use_counterbore = (side == 1));
                    rotate([0, 0, 180]) focus_flange_tab(use_counterbore = (side == 1));
                }
                translate([0, side * clip / 4, 0])
                    cube([clip, clip / 2 - gap / 2, focus_grip_w + 1], center = true);
            }
            // Tab belongs to the half whose Y-sign matches the tab direction.
            // sin() is unreliable at 0° and 180° due to floating-point (returns ~1e-16
            // instead of exactly 0), so use a small epsilon threshold.
            // rotate(...-90) because focus_pull_tab() points in +Y (= 90° from +X).
            if (side == (sin(focus_tab_angle) > 1e-9 ? 1 : -1))
                rotate([0, 0, focus_tab_angle - 90])
                    focus_pull_tab();
            if (side == 1)
                for (sx = [-1, 1])
                    translate([sx * tab_cx, 0, 0])
                        rotate([90, 0, 0])
                            cylinder(d = align_pin_d, h = align_pin_l, $fn = 24);
        }
        if (side == -1)
            for (sx = [-1, 1])
                translate([sx * tab_cx, 0, 0])
                    rotate([90, 0, 0])
                        cylinder(d = align_socket_d, h = align_socket_l, $fn = 24);

        // Part label engraved into the flat print face on the +X ring wall.
        translate([focus_rigid_id / 2 + focus_wall_t / 2, 0, 0])
            rotate([-side * 90, 0, 0])
                linear_extrude(label_depth + eps)
                    text(side == 1 ? "T" : "B",
                         size   = label_size,
                         halign = "center",
                         valign = "center",
                         font   = "Liberation Sans:style=Bold");
    }
}

// TPU liner — no anti-rotation key; clamp friction alone holds it.
module focus_tpu_body() {
    difference() {
        cylinder(d = focus_rigid_id, h = focus_grip_w,     center = true);
        cylinder(d = focus_od,       h = focus_grip_w + 1, center = true);
    }
}

module half_focus_tpu(side = 1) {
    clip = focus_rigid_id + 2;
    intersection() {
        focus_tpu_body();
        translate([0, side * clip / 4, 0])
            cube([clip, clip / 2 - gap / 2, focus_grip_w + 1], center = true);
    }
}

// ============================================================
//  RENDER
//  Comment out parts you don't need for individual STL export.
//  Print orientation: all parts flat side down, no supports needed.
// ============================================================

spacing = ring_od / 2 + 8;

// --- Rigid collar halves (PETG / PLA+ / ASA) ---
translate([0,  spacing, 0])  half_ring(side =  1);   // top half
translate([0, -spacing, 0])  half_ring(side = -1);   // bottom half + foot

// --- TPU liner halves ---
translate([ spacing * 1.6, 0, 0])  half_tpu_liner(side =  1);
translate([-spacing * 1.6, 0, 0])  half_tpu_liner(side = -1);

// --- Focus puller ring halves (PETG / PLA+) ---
focus_sp = focus_ring_od / 2 + 8;
translate([spacing * 3.5,  focus_sp, 0])  half_focus_ring(side =  1);
translate([spacing * 3.5, -focus_sp, 0])  half_focus_ring(side = -1);

// --- Focus ring TPU liner halves ---
translate([spacing * 5.0,  focus_sp, 0])  half_focus_tpu(side =  1);
translate([spacing * 5.0, -focus_sp, 0])  half_focus_tpu(side = -1);
