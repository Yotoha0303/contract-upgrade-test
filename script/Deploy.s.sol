// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contract/MyToken.sol";
// import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract Deploy is Script {
    function run() external {
        //  vm.startBroadcast();

        // // 1. 部署逻辑合约
        // MyToken logic = new MyToken();

        // // 2. 初始化数据
        // bytes memory data = abi.encodeWithSignature("initialize()");

        // // 3. 部署代理合约
        // ERC1967Proxy proxy = new ERC1967Proxy(address(logic), data);

        // console.log("Proxy deployed at:", address(proxy));
        // console.log("Logic deployed at:", address(logic));

        // vm.stopBroadcast();

        // 本地测试账户
        address owner = vm.addr(vm.envUint("DEPLOYER_PRIVATE_KEY"));


        vm.startBroadcast();

        // 1. 部署逻辑合约（V1）
        MyToken implementationV1 = new MyToken();

        // 2. 编码初始化数据（通过 ABI 调用 initialize）
        bytes memory data = abi.encodeWithSignature(
            "initialize(uint256)",
            1000000 ether
        );

        // 3. 部署 ERC1967 代理合约
        ERC1967Proxy proxy = new ERC1967Proxy(address(implementationV1), data);

        console2.log("Logic V1:", address(implementationV1));
        console2.log("Proxy:", address(proxy));

        vm.stopBroadcast();
    }
}
