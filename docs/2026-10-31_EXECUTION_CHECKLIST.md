# 2026-10-31 Execution Checklist

> Objective: finish a reviewable project-planning and design-input baseline in one day. This is not a claim that the robot, firmware, or competition solution is complete, structurally certified, or safe for a person to ride.

## Definition of done

By the end of 2026-10-31, the team should have:
1. **Division II confirmed by the team** and a Division-II rule-applicability decision log; retain official registration/coach confirmation as evidence.
2. A rider/vehicle requirements sheet that preserves the current project requirement: minimum rider mass 35 kg and minimum rated passenger payload 40 kg, subject to engineering validation. These figures are requirements, not proof of capacity or permission to ride.
3. A measured vehicle/cart/prop input sheet, with missing values explicitly BLOCKED rather than guessed.
4. A reviewed system architecture and interface concept, with load paths, steering, braking, attachment/release, and unloading sequence identified.
5. A reproducible software test record and a firmware gap/safety checklist.
6. A named owner, tangible deliverable, and acceptance check for every open P0/P1 task.

Do not mark an item complete merely because a concept has been discussed. Do not carry a person on the prototype.

## Work plan

| Local time | Work package | Required output | Exit criterion |
|---|---|---|---|
| 09:00–09:30 | Kickoff and scope lock | Division II confirmation, team attendance, available tools/materials, decision log | Record the team's Division II confirmation and retain registration/coach evidence; rider safety scope stated |
| 09:30–10:30 | Rule and rider requirements | Division II rule checklist + rider requirement sheet | Record Division II unloading-device requirement; 35 kg rider / 40 kg rated payload remain requirements pending validation |
| 10:30–12:00 | Measurement session | Vehicle, cart, and three-item prop input sheet; photos | Critical dimensions/masses measured or explicitly BLOCKED |
| 13:00–14:30 | System/interface design | Load-path sketch, steering/brake concept, cart interface and unloading sequence | Interfaces and unresolved loads/clearances are visible and reviewable |
| 14:30–15:30 | Mechanical safety review | Doorway envelope, stability, axle/load, brake and structure calculation-input list | No unverified capacity or safety claim; no human ride test |
| 15:30–16:30 | Software baseline | Test output and firmware gap list | Python tests run reproducibly; firmware limitations remain explicit |
| 16:30–17:15 | Team assignment | Owner/deliverable/due-date/acceptance table | Every P0/P1 item has one accountable owner |
| 17:15–17:45 | Closeout | Updated progress log and next build/test plan | Blockers, decisions, evidence and next actions recorded |

Adjust times to the team's actual availability, but preserve the sequence and exit criteria.

## P0 — decisions and evidence

### 1. Division and rule applicability

- [x] Team has stated Division II; record official registration/coach evidence in the decision log.
- [ ] Review the 2026–2027 Problem 1 statement, Program Guide, and applicable General Clarifications for Division II.
- [ ] Treat the team-made unloading device as a Division II requirement: it must be separate from the vehicle; document the permitted team-operated/manual operation and exact unload sequence from the official wording.
- [ ] Confirm the shopping-list handoff sequence, including delivery to the vehicle operator before the vehicle crosses the starting line.
- [ ] Add applicable doorway, setup/cleanup, assistance, and cost-accounting requirements to the traceability table.

### 2. Rider and vehicle safety inputs

Current project requirement baseline (not a validated rating):
- Minimum rider mass requirement: **35 kg**.
- Minimum rated passenger payload requirement: **40 kg**.
- The final permitted rider mass and operating envelope must be set by engineering calculations, controlled validation, and applicable venue/regulatory requirements.

- [ ] Measure and record chassis overall length/width/height and ground clearance.
- [ ] Record frame material, section sizes, joint types, fasteners, and intended load paths.
- [ ] Identify seat, seat mounting, foot support, handholds/restraints if applicable, and rider ingress/egress hazards.
- [ ] Identify axle/wheel loads, center-of-gravity assumptions, tipping cases, dynamic/impact cases, and braking load cases requiring calculation.
- [ ] Record steering geometry, steering stops, wheel retention, tire/wheel ratings, brake type, and independent parking/holding behavior.
- [ ] Create a calculation-input sheet for frame bending, joint strength, axle/wheel capacity, stability, steering, and braking. Do not claim these pass until calculations and qualified review exist.
- [ ] Keep the vehicle unoccupied. No human ride, powered rider test, or demonstration until structural review, unoccupied subsystem tests, controlled ballast tests, brake/steering validation, and required approvals are complete.

### 3. Vehicle, cart, and three-item measurement sheet

| Object | Length (mm) | Width (mm) | Height (mm) | Mass (kg/g) | Notes / evidence / owner |
|---|---:|---:|---:|---:|---|
| Vehicle chassis | TBD | TBD | TBD | TBD | TBD |
| Actual shopping cart | TBD | TBD | TBD | TBD | TBD |
| Item A | TBD | TBD | TBD | TBD | TBD |
| Item B | TBD | TBD | TBD | TBD | TBD |
| Item C | TBD | TBD | TBD | TBD |

For each competition item, also record fragile status, required grip/support, and placement target.

Measurement protocol:
- Measure the actual component/prop or closest official/coach-provided replica.
- Record measuring tool, date, and person measuring.
- Photograph each item beside a ruler/tape; weigh on a scale where possible.
- If an actual prop is unavailable, mark **BLOCKED — awaiting official prop/replica**. Do not use guessed values to freeze gripper, basket, chute, actuator, frame, or cart-interface dimensions.

### 4. Cart/vehicle interface and unloading sequence

- [ ] Record actual cart model and measured overall envelope.
- [ ] Define attachment point, allowable play, retention method, and release action.
- [ ] Define fail-safe state if power is lost or release command is missed.
- [ ] Define how the cart brakes/parks during loading and unloading.
- [ ] Define cart return-to-designated-zone sequence after release.
- [ ] Verify the complete assembled solution can pass the required 28 × 78 in doorway in a real orientation; record measured clearance. Nominal vehicle width alone is not proof.
- [ ] For Division II, keep the team-made unloading device physically separate from and unconnected to the vehicle; validate that it unloads all three items into the checkout area using a permitted team-operated method.
- [ ] Produce a dimensioned interface sketch only after vehicle/cart/prop inputs are measured.

## P1 — software and validation

### Software baseline

- [ ] Run the existing Python substitution tests from the repository's documented test command.
- [ ] Save exact command, environment/version, date, and pass/fail output in the test log.
- [ ] Confirm tests cover: in-stock retention, same-category budget-compliant lowest-price substitute, deterministic tie-break, no candidate/manual assistance, invalid budget fail-safe, and missing required fields.
- [ ] Do not describe the substitution algorithm as inventory sensing, robot navigation, or end-to-end competition automation.

### Firmware gap/safety review

- [ ] Record current firmware build status (compiled / not compiled; board and toolchain versions).
- [ ] Verify motor outputs default to stopped on boot and on command timeout.
- [ ] Make ultrasonic emergency stop latch into a disarmed/fault state requiring deliberate reset.
- [ ] Implement limit-switch motion interlocks in the relevant direction; status display alone is not an interlock.
- [ ] Confirm encoder direction/counting strategy before using counts for closed-loop movement.
- [ ] Define command watchdog behavior and test it with motors unloaded before any powered vehicle test.
- [ ] Keep navigation, homing, return-to-zone, cart release, and full task state machine marked NOT IMPLEMENTED until implemented and tested.

## Team ownership table

| Work item | Accountable owner | Supporting members | Due | Evidence / acceptance |
|---|---|---|---|---|
| Division II rule checklist | TBD | TBD | 2026-10-31 | Division II applicability decision log + official-source cross-check |
| Rider/vehicle safety inputs | TBD | TBD | 2026-10-31 | Measured inputs + calculation plan |
| Vehicle/cart/prop measurements | TBD | TBD | 2026-10-31 | Measurement sheet + photos |
| Frame/steering/brake architecture | TBD | TBD | 2026-10-31 | Annotated system sketch + open calculations |
| Cart interface/unloading | TBD | TBD | 2026-10-31 | Interface sketch + rule mapping |
| Python test record | TBD | TBD | 2026-10-31 | Exact command + complete test output |
| Firmware safety gap list | TBD | TBD | 2026-10-31 | Checklist with status and evidence |
| Progress log and next sprint | TBD | TBD | 2026-10-31 | Updated project progress record |

Assign one accountable owner per row. “Everyone” is not an owner.

## Stop/go gates

- **GO to detailed mechanical design:** Division is known, rider/vehicle requirements are documented, critical chassis/cart/prop dimensions are measured, and load paths/clearances have been considered.
- **HOLD fabrication of load-bearing or rider-contact parts:** structural calculations, material/joint verification, stability, steering, and braking design have not been reviewed.
- **HOLD all human riding:** no person rides the prototype under any circumstance until qualified structural review, unoccupied subsystem tests, controlled ballast tests, steering/brake validation, and applicable approvals are complete.
- **GO to low-risk software bench tests:** motor outputs are physically disconnected or safely restrained and the test procedure is documented.
- **HOLD powered vehicle tests:** emergency stop, command timeout, direction limits, safe power-off, steering, and braking behavior have not been verified.

## End-of-day status template

| Deliverable | Status (DONE / BLOCKED / IN PROGRESS) | Evidence link/path | Blocker | Owner | Next action |
|---|---|---|---|---|---|
| Division II rule decision | IN PROGRESS | TBD | Verify official registration/coach evidence and current clarifications | TBD | Complete applicability cross-check |
| Rider/vehicle safety inputs | BLOCKED | TBD | TBD | TBD | TBD |
| Vehicle/cart/prop measurements | BLOCKED | TBD | TBD | TBD | TBD |
| Architecture/interface sketch | IN PROGRESS | TBD | TBD | TBD | TBD |
| Python test record | IN PROGRESS | TBD | TBD | TBD | TBD |
| Firmware safety checklist | IN PROGRESS | TBD | TBD | TBD | TBD |
| Team ownership | BLOCKED | TBD | TBD | TBD | TBD |

A blocked item is an honest result. Never change BLOCKED to DONE without evidence.
