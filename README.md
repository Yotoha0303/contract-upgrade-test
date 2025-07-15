# 微演示合约

## 演示目的
- 合约模块化
- 可升级合约设计（UUPS Proxy）

## 合约说明
1、MyToken.sol
仅继承`ERC20`的合约

2、DividendLogic.sol
实现分红逻辑的合约

3、MyTokenUpgrade.sol
合约代理

## 个人理解

### 升级设计关键

1、最初合约实现“可升级设计”

2、通过部署代理，修改代理进行升级

3、以旧合约为基础，新增功能后被升级；

### 细节内容

1、用户访问的地址不改变，但是功能升级了

2、合约部署并没有改变需要部署新合约时的费用，只是在代理合约上修改了合约地址

3、代理合约存储数据，升级合约就是为了保证数据可以在新合约中可以被使用；注意新合约的存储方式，设计存储顺序、位置要严格



### 主流可升级合约模式对比总览

| 模式类型                                           | 是否标准化 | 安全性 | 成熟度 | 是否推荐             |
| -------------------------------------------------- | ---------- | ------ | ------ | -------------------- |
| Transparent Proxy（透明代理模式）                  | ✅ 是       | ⭐⭐⭐⭐   | ⭐⭐⭐⭐⭐  | ✅ 推荐（经典）       |
| UUPS Proxy（Upgradeable Universal Proxy Standard） | ✅ 是       | ⭐⭐⭐⭐   | ⭐⭐⭐⭐   | ✅ 推荐（现代）       |
| Beacon Proxy（Upgrade Beacon Proxy Pattern）       | ✅ 是       | ⭐⭐⭐    | ⭐⭐⭐    | 🟡 特殊场景适用       |
| Diamond Proxy (EIP-2535)                           | ✅ 是       | ⭐⭐⭐⭐   | ⭐⭐     | 🧠 高级，复杂工程用   |
| Delegate Proxy (无标准)                            | ❌ 否       | ⭐⭐     | ⭐      | ❌ 不推荐（容易出错） |



## UUPS Proxy结构示意

```
+-----------------+             +---------------------+             +-------------------------+
|  User / App     | — calls →   |   Proxy (UUPS)      | — delegate→ |   Logic (MyTokenV1)     |
| (调用逻辑合约)  |             | (固定地址 + 数据)   |             |   初始版本              |
+-----------------+             +---------------------+             +-------------------------+
                                                                      |
                                                                      ↓
                                                             Logic (MyTokenV2)
                                                             (继承 MyTokenV1，新功能)

```

参考网站
1、「开发标准」https://eips.ethereum.org/EIPS/eip-1967
2、「课程」https://www.wtf.academy/zh/course/solidity103/UUPS

操作细节
1、查看依赖版本
```
git submodule
```
2、移除子模块
示例：移除`openzeppelin-contracts-upgradeable`
```
git submodule deinit -f lib/openzeppelin-contracts-upgradeable
git rm -f lib/openzeppelin-contracts-upgradeable
rm -rf .git/modules/lib/openzeppelin-contracts-upgradeable
```
思路：
1）移除`submodule`中的依赖信息
2）删除在`lib`中，对应的依赖文件
3）删除`.git`中，模块的信息
4）直接移除在`gitmodules`中进行删除

3、清除缓存
```
forge clean
```

4、查看版本
示例：查看`lib/openzeppelin-contracts`文件中的版本信息
```
git -C lib/openzeppelin-contracts describe --tags
```

5、更新`foundry.toml`中的依赖信息(删除依赖时删除。安装时，根据不同依赖填入对应内容)
```
[dependencies]
openzeppelin-contracts = { git = "https://github.com/OpenZeppelin/openzeppelin-contracts", tag = "v4.9.3" }
```

6、按照依赖(按具体情况而定)
```
forge install OpenZeppelin/openzeppelin-contracts
forge install OpenZeppelin/openzeppelin-contracts-upgradeable
forge install OpenZeppelin/openzeppelin-foundry-upgradeable
```
