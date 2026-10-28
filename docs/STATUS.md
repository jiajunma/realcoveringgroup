# 状态记录

日期：2026-10-28（Asia/Singapore）。

## 当前结论

**项目规则、路线图、定义规格及参考文献地图已建立；初始 Lean 工程与首批基础代码已通过真实 CI。**

成功验证的代码提交：[`5e7870570685747da884877e4925e87152119870`](https://github.com/jiajunma/realcoveringgroup/commit/5e7870570685747da884877e4925e87152119870)。

CI：[run 40639556428](https://github.com/jiajunma/realcoveringgroup/actions/runs/40639556428)，job `122654258612`。结果为 `success`，完整日志已读取；`lake build`、`Tests/Smoke.lean` 和项目占位证明扫描均通过。最后一个检查于 2026-10-28 05:44 UTC 完成。

本状态更新及随后仅修改文档的提交，不改变上述已经编译的 Lean 源码。

## 已完成的文档与工程

- `AGENTS.md`：固定“群 → 表示 → KLV”的顺序、证明质量与协作同步规则。
- `ROADMAP.md`：分阶段依赖、每阶段的验收条件、最终 character multiplicity 与 lifting 目标。
- `docs/DEFINITIONS.md`：分层数学定义规格、接口依赖、尚待核对的规范；不是全部概念已经完成的 Lean API。
- `docs/REFERENCES.md`：文献版本、主定理地图、各阶段的参考来源及审计限制。
- `README.md`：项目入口、构建指令和里程碑。
- Lean 4.24.0 / mathlib `f897ebcf72cd16f89ab4577d0c826cd14afaafc7` 与传递依赖已锁定。
- CI 从官方 GitHub release 安装 Lean，校验 SHA256；执行构建、类型/公理依赖检查和源码占位扫描。

## 已定义及已证明的源码

| 文件 | 已验证的内容 | 仍不包含什么 |
|---|---|---|
| `Groups/Matrix.lean` | `DEFINED`：实际 GL、SL 矩阵群的 mathlib 别名；det 同态；GL 的定义表示 | 未证明完整实约化 Lie 群结构，未构造非线性覆盖 |
| `Groups/DoubleCover.lean` | `DEFINED`：实际群上的代数中心二重扩张、子群逆像、代数 splitting；`PROVED`：核元素投影、纤维判别、deck involution 与无不动点 | 不等于拓扑或 Lie 群覆盖；不是覆盖存在定理 |
| `Representations/Genuine.lean` | `DEFINED`：genuine 与下降；`PROVED`：核固定向量为零、非零 genuine 表示不能下降 | 不是连续表示、Harish–Chandra 模或标准模的完整实现 |
| `Tests/Smoke.lean` | 类型检查与下述五个声明的 `#print axioms`，均成功 | 不是 KLV 算法测试 |

路径前三项相对于 `RealCoveringGroup/`。

这五个已审计声明的实际输出：

| 声明（命名空间 `RealCoveringGroup.AlgebraicDoubleCover`） | 公理依赖 |
|---|---|
| `same_fibre_iff` | `propext` |
| `deck_involutive` | `propext` |
| `deck_ne` | `propext` |
| `genuine_fixed_eq_zero` | `propext`, `Classical.choice`, `Quot.sound` |
| `genuine_not_descends` | `propext`, `Classical.choice`, `Quot.sound` |

没有 `sorryAx`、项目数学公理或 `Lean.ofReduceBool` 出现在这五个声明的依赖输出中。扫描范围为当前 `RealCoveringGroup/**/*.lean`。这不应被描述为尚未实现的全部理论的公理审计。

## 构建记录

成功运行：

```text
lean --version                 Lean 4.24.0
lake exe cache get             success
lake build                     success
lake env lean Tests/Smoke.lean  success
project placeholder scan       success
```

为保留可审计历史，先前失败也列在这里：

1. run `40638040099`：初始项目缺少 `lake-manifest.json`，尚未进入编译。已添加与固定 mathlib 对应的依赖清单。
2. run `40638173733` 的两次尝试：Lean 下载服务器 TLS 连接错误，尚未进入编译。CI 改用官方 GitHub 发布包并校验 SHA256，没有关闭 TLS 校验或更换数学依赖版本。
3. run `40639332188`：矩阵群文件编译通过；`deck_involutive` 的关联律改写需要先展开函数应用。已用显式 `change` 修正，数学陈述未变。
4. run `40639556428`：全部当前项目文件与检查通过。

官方 Lean Linux 发布包 SHA256：`b14f5e5159219dd1a1956c3b806813319f5e94ccd5bdfd56f54520609a5bb5ec`。此值来自官方 GitHub release asset 元数据，并在成功 CI 中实际校验。

本地容器没有 `lean` / `lake`，且本地 DNS 无法解析 github.com；验证是在仓库 GitHub Actions 的真实 Lean 环境中完成，不是本地运行。`REFERENCES.md` 记录了初期审查过的 lean-action；当前工作流已改为直接校验安装官方发布包。

## 里程碑

M0（工程与初始基础验证）：完成。

M1–M7：未完成。尤其尚未完成实际非线性 Lie 群覆盖实例、Harish–Chandra 类的完整实现、连续/光滑表示到 HC 模的构造、标准模与分类、参数穷尽、KLV 引擎、Theorems 9.9–9.10、对偶或 Kazhdan–Patterson lifting。

## 下一数学任务

在已验证的代数二重扩张上加入拓扑覆盖结构，构造第一个实际非平凡 Lie 群覆盖实例，并证明其与基群、紧子群和 Lie 代数的关系。随后构造连续表示、光滑 K-finite 向量和 HC compatibility。rank-one 是基础接口的检验，不是项目终点。
