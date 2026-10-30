# 航天未来科技组 · OMER 太空补给服务

> 2026–2027 Odyssey of the Mind Problem 1 — 项目设计与制作仓库。

所有设计状态以可复核证据为准；文档/代码存在不等于实物验收通过。

## 一次性交付入口

1. **[完整系统设计包](docs/MASTER_DESIGN_PACKAGE_2026-27.md)** — 单一架构、功能边界、机械接口、制作路径。
2. **[统一制作与采购总表](docs/MASTER_BUILD_AND_PURCHASE_PLAN_2026-27.md)** — 采购ID、数量、规格、优先级与验收条件。
3. **[完整故事剧本与七人详细分工](docs/STORY_AND_SEVEN_MEMBER_ROLES_2026-27.md)** — 七幕剧情、完整台词、七人职责、交接表和8分钟排练节奏。
4. **[尺寸登记与制作草图](docs/DIMENSION_REGISTER_AND_DRAWINGS_2026-27.md)** — 到货测量表、卸载器概念图和牵引接口要求。
5. **[独立卸载器参数化概念CAD](cad/independent_unloader_concept.scad)** — OpenSCAD布局模型；非认证制造图。
6. **[电气与固件接口规范](docs/ELECTRICAL_AND_FIRMWARE_SPEC_2026-27.md)** — 电源域、急停、GPIO约束和任务状态机。
7. **[综合测试计划与比赛执行手册](docs/TEST_AND_COMPETITION_RUNBOOK_2026-27.md)** — G0–G9关卡、测试记录和8分钟排练方案。
8. **[成本登记模板](docs/COST_LEDGER_2026-27.csv)** — 逐项记录实际成本与官方估值。
9. [项目进度台账](docs/PROJECT_PROGRESS.md)
10. [规则追踪表](docs/RULE_TRACEABILITY_2026-27.md)
11. [设计冻结前完整审查](docs/PREBUILD_AUDIT_2026-10-31.md)
12. [购物车与道具选型](docs/CART_AND_PROP_SELECTION.md)
13. [Division II 独立卸载装置概念基线](docs/DIVISION_II_UNLOADER_CONCEPT.md)

## 工程与软件资料

- [ESP32-S3 引脚分配与接线安全](docs/ESP32S3_PINMAP.md)
- [ESP32-S3 固件入口与 bring-up](firmware/esp32_s3/README.md)
- [旧版详细采购 BOM（仅参考；冲突项以主控文件为准）](docs/COMPONENTS_BOM.md)
- [旧版拼装说明书 v0.1（已被新设计包取代）](docs/BUILD_MANUAL_2026-27_v0.1.md)
- [理论技术报告](docs/THEORETICAL_TECHNICAL_REPORT_2026-27.md)
- [验收清单](docs/ACCEPTANCE.md)
- [风险登记](docs/RISKS.md)

## 当前统一决策

- 组别基线：Division II；正式报名/教练确认文件待归档。
- 购物车：60L紧凑型金属网篮超市购物车，中国大陆淘宝/天猫采购优先。Sakugi 80L布篮wagon候选已撤销。
- 道具：空PET瓶、76mm泡沫球、红色带盖替代盒；蓝色盒作为缺货请求物品。
- 独立卸货器：队伍制作、独立落地、手动操作、与车辆无连接。
- 主控：ESP32-S3 N16R8候选；现有固件不是完整自主任务系统。
- 导航目标：3只超声波（前/左前/右前）+双相轮编码器，近场反应式避障与自动转弯；不含地图/视觉识别。
- 机械臂目标：车载3执行器（肩/肘/夹爪），统一软垫夹爪抓取瓶/泡沫球/红盒；仅在车辆停稳、驱动禁用后动作。
- Division II独立卸货器仍为独立落地、人工操作、与车辆无连接；车载机械臂不替代卸货器。
- 预算：项目资料追踪US$165上限；完整成本未闭合，必须按当季Program Guide/Cost Form计价。

## 安全与验证边界

- 乘坐车辆没有制造级总装CAD、结构强度、稳定性、转向、制动或乘员安全验证。
- 不得真人乘坐或动力载人测试，直到结构审查、空载测试、受控配重测试、转向/制动验证和适用审批完成。
- ESP32-S3 GPIO为3.3V；HC-SR04 Echo等5V信号必须先适配。
- 硬件急停必须物理切断电机驱动能量。
- 没有测试日志、照片/视频或构建记录的项目一律标记“未测”。
- `3组/` 目录为只读保护区，不得编辑、移动、重命名或删除。

官方资料：[Problem 1](https://odysseyofthemind.com/problem-1/) · [General Clarifications](https://odysseyofthemind.com/read-clarifications/) · [Program Guide](https://odysseyofthemind.com/program-guide/)
