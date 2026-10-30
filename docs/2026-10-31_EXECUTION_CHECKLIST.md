# 2026-10-31 Execution Checklist

> Objective: finish a reviewable project-planning baseline in one day. This is not a claim that the robot, firmware, or competition solution is complete or validated.

## Definition of done

By the end of 2026-10-31, the team should have:
1. A confirmed competition Division and a rule-applicability decision log.
2. A measured prop data sheet for all three required items, or a clearly assigned measurement owner and a blocked status for each missing measurement.
3. A selected cart/vehicle interface concept with a dimensioned interface sketch and explicit unresolved measurements.
4. A reproducible software test record for the substitution algorithm and a firmware gap/safety checklist.
5. A named owner, tangible deliverable, and acceptance check for every open P0/P1 task.

Do not mark an item complete merely because a concept has been discussed.

## Work plan

| Local time | Work package | Required output | Exit criterion |
|---|---|---|---|
| 09:00–09:30 | Kickoff and scope lock | Division, team attendance, available tools/materials, decision log | Division is confirmed from the team's registration/coach |
| 09:30–10:30 | Rule traceability | Division-specific rule checklist | Every applicable requirement links to a rule/clarification and a planned test |
| 10:30–12:00 | Prop measurement | Three-item measurement sheet, photos, measurement owner for gaps | Dimensions and mass are measured, not guessed; unknowns remain BLOCKED |
| 13:00–14:30 | Cart/vehicle interface | Interface sketch and interface control table | Connection, release, braking, clearance, and return-to-zone sequence are defined |
| 14:30–15:30 | Mechanical risk review | Doorway envelope check, stability/load questions, independent unloading review | No unverified dimension is called final; unsafe assumptions are logged |
| 15:30–16:30 | Software baseline | Test output and firmware gap list | Existing Python tests run reproducibly; firmware limitations remain explicit |
| 16:30–17:15 | Team assignment | Owner/deliverable/due-date/acceptance table | Every P0/P1 item has one accountable owner |
| 17:15–17:45 | Closeout | Updated progress log and next build/test plan | Blockers, decisions, and next actions are recorded |

Adjust times to the team's actual availability, but preserve the sequence and exit criteria.

## P0 — decisions and evidence

### 1. Division and rule applicability

- [ ] Confirm Division from official team registration/coach.
- [ ] Review the 2026–2027 Problem 1 statement, Program Guide, and applicable General Clarifications.
- [ ] Record which unloading-device requirements apply to this Division; do not transfer requirements between Divisions without checking.
- [ ] Confirm the shopping-list handoff sequence, including delivery to the vehicle operator before the vehicle crosses the starting line.
- [ ] Add the applicable doorway, setup/cleanup, assistance, and cost-accounting requirements to the traceability table.

### 2. Three-item prop measurement sheet

Create one row per required item:

| Item | Length (mm) | Width (mm) | Height (mm) | Mass (g) | Fragile? | Required grip/support | Placement target | Evidence / owner |
|---|---:|---:|---:|---:|---|---|---|---|
| Item A | TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |
| Item B | TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |
| Item C | TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |

Measurement protocol:
- Measure the actual competition prop or the closest official/coach-provided replica.
- Record the measuring tool, date, and person measuring.
- Photograph each item beside a ruler/tape and on a scale where possible.
- If an actual prop is unavailable, mark the row **BLOCKED — awaiting official prop/replica**. Do not use guessed values to freeze gripper, basket, chute, or actuator dimensions.

### 3. Cart/vehicle interface control

- [ ] Record the actual cart model and measured overall envelope.
- [ ] Define the attachment point, allowable play, retention method, and release action.
- [ ] Define a fail-safe state if power is lost or a release command is missed.
- [ ] Define how the cart brakes/parks during loading and unloading.
- [ ] Define the cart return-to-designated-zone sequence after release.
- [ ] Verify the complete assembled solution can pass the required 28 × 78 in doorway in a real orientation; record measured clearance. Do not treat nominal vehicle width alone as proof.
- [ ] Keep the independent unloading device physically independent where the applicable Division/problem requirement calls for it.
- [ ] Produce a dimensioned interface sketch only after the cart and props are measured.

## P1 — software and validation

### Software baseline

- [ ] Run the existing Python substitution tests from the repository's documented test command.
- [ ] Save the exact command, environment/version, date, and pass/fail output in the test log.
- [ ] Confirm the tests cover: in-stock retention, same-category budget-compliant lowest-price substitute, deterministic tie-break, no candidate/manual assistance, invalid budget fail-safe, and missing required fields.
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
| Division and rule checklist | TBD | TBD | 2026-10-31 | Signed/recorded rule decision log |
| Prop measurements | TBD | TBD | 2026-10-31 | Measurement sheet + photos |
| Cart/vehicle interface | TBD | TBD | 2026-10-31 | Dimensioned sketch + interface checks |
| Independent unloading concept | TBD | TBD | 2026-10-31 | Sequence sketch + applicable rule mapping |
| Python test record | TBD | TBD | 2026-10-31 | Exact command + complete test output |
| Firmware safety gap list | TBD | TBD | 2026-10-31 | Checklist with status and evidence |
| Progress log and next sprint | TBD | TBD | 2026-10-31 | Updated project progress record |

Assign one accountable owner per row. “Everyone” is not an owner.

## Stop/go gates

- **GO to detailed mechanical design:** Division is known, prop dimensions/masses are measured, cart dimensions are measured, and interface loads/clearances have been considered.
- **HOLD detailed fabrication:** any critical prop/cart dimension is still guessed, doorway passage is unmeasured, or attachment/release behavior is undefined.
- **GO to low-risk software bench tests:** motor outputs are physically disconnected or safely restrained and test procedure is documented.
- **HOLD powered vehicle tests:** emergency stop, command timeout, direction limits, and safe power-off behavior have not been verified.

## End-of-day status template

| Deliverable | Status (DONE / BLOCKED / IN PROGRESS) | Evidence link/path | Blocker | Owner | Next action |
|---|---|---|---|---|---|
| Division/rule decision | BLOCKED | TBD | TBD | TBD | TBD |
| Prop measurement sheet | BLOCKED | TBD | TBD | TBD | TBD |
| Cart interface | BLOCKED | TBD | TBD | TBD | TBD |
| Python test record | IN PROGRESS | TBD | TBD | TBD | TBD |
| Firmware safety checklist | IN PROGRESS | TBD | TBD | TBD | TBD |
| Team ownership | BLOCKED | TBD | TBD | TBD | TBD |

A blocked item is an honest result. Never change BLOCKED to DONE without evidence.
