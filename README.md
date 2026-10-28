# Real Covering Groups in Lean

马家骏（Jia-Jun Ma）的实约化群及其非线性覆盖表示论形式化项目。

主文献：Renard–Trapa, *Kazhdan–Lusztig algorithms for nonlinear groups and applications to Kazhdan–Patterson lifting*（2005）。

## 主线

> **先把群定义出来，表示搞出来，KLV 做出来。**

目标从实际矩阵/Lie 群和非平凡覆盖出发，构造实际表示、Harish–Chandra 模、标准模和参数，最终证明 KLV 输出确实等于这些表示的 character / composition multiplicity matrices；之后完成对偶与 Kazhdan–Patterson lifting。

有限组合算法、rank-one 测试、矩阵证书都服务于这条主线，不能取代实际群和表示。

## 文档入口

| 文件 | 内容 |
|---|---|
| [AGENTS.md](AGENTS.md) | 项目约束、证明标准、协作同步、禁止空定义和隐藏假设 |
| [ROADMAP.md](ROADMAP.md) | 群 → 表示 → 参数 → KLV → 正确性 → lifting 的阶段依赖与验收 |
| [docs/DEFINITIONS.md](docs/DEFINITIONS.md) | 逐对象的数学定义规格、依赖、实现位置及待核对约定 |
| [docs/REFERENCES.md](docs/REFERENCES.md) | 主文献版本、定理地图、每个工作包的参考资料 |
| [docs/STATUS.md](docs/STATUS.md) | 实际源码、构建结果、已完成部分和未清偿义务 |

路线图和定义规格不是已经完成的 Lean API。尤其是 `AlgebraicDoubleCover` 只描述代数扩张，不是非线性 Lie 群覆盖的构造定理。

## 当前代码

```text
RealCoveringGroup.lean
RealCoveringGroup/
  Groups/
    Matrix.lean          # 实际 GL/SL 与 GL 的定义表示
    DoubleCover.lean     # 代数中心二重扩张及核/纤维引理
  Representations/
    Genuine.lean         # genuine 性质与下降
Tests/
  Smoke.lean             # 类型与 proof-dependency 检查
```

上述代码已在提交 `5e7870570685747da884877e4925e87152119870` 通过 [Lean CI](https://github.com/jiajunma/realcoveringgroup/actions/runs/40639556428)，包括 `lake build`、smoke checks 和占位证明扫描。五个初始定理的实际公理依赖已记入 STATUS。

完整拓扑覆盖实例、Harish–Chandra 模、标准模和 KLV 尚未完成。

## 构建

固定 Lean 4.24.0 与 mathlib 提交 `f897ebcf72cd16f89ab4577d0c826cd14afaafc7`。传递依赖也由 `lake-manifest.json` 固定。

安装兼容的 elan 后：

```bash
lake exe cache get
lake build
lake env lean Tests/Smoke.lean
```

通常不需要 `lake update`；改变依赖时才显式更新并审查 lockfile。CI 通过校验过的官方 Lean 发布包运行相同构建和检查。工作流被触发不等于已通过；每次升级的状态以具体提交的成功记录为准。

## 里程碑

- [x] 仓库规则、总路线图、定义登记表、参考文献地图。
- [x] M0：初始 Lean 工程及 smoke checks 验证完成（记录见 STATUS）。
- [ ] M1：实际非平凡 Lie 群覆盖及其结构。
- [ ] M2：实际表示和 Harish–Chandra 模范畴。
- [ ] M3：标准模、Langlands 分类与 K0 基。
- [ ] M4：参数穷尽、cross/Cayley、block 与长度。
- [ ] M5：KLV 算法的存在、终止与正确性。
- [ ] M6：RT05 Theorems 9.9–9.10 的表示论解释。
- [ ] M7：对偶、lifting 和 GL(4,R) 应用。

所有数学里程碑都要求说明适用范围、完成真实证明并审计假设；不能以抄表、`sorry` 或假设最终定理代替。
