// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contract/MyToken2.sol";
import {IMyToken} from "../contract/interfaces/IMyToken.sol";
// import "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";
import "../lib/openzeppelin-contracts/contracts/proxy/utils/UUPSUpgradeable.sol";

interface IUpgradeable {
    function upgradeTo(address newImplementation) external;
}

contract UpgradeToV2 is Script {
    // address proxyAddress = 0x...; // 填写代理地址

    // function run() external {
    //     vm.startBroadcast();

    //     MyToken2 newLogic = new MyToken2();
    //     console.log("New Logic Deployed:", address(newLogic));

    //     IUpgradeable(proxyAddress).upgradeTo(address(newLogic));
    //     console.log("Proxy upgraded.");

    //     vm.stopBroadcast();
    // }
    function run() external {
        address proxyAddr = vm.envAddress("PROXY_ADDRESS");

        vm.startBroadcast();

        // 1. 部署新的逻辑合约（V2）
        MyToken2 newLogic = new MyToken2();
        console2.log("New Logic (V2) deployed:", address(newLogic));

        // 2. 调用代理合约的 upgradeTo()
        // 注意：你需要使用代理地址来调用逻辑合约中的 upgradeTo
        IMyToken(proxyAddr).upgradeTo(address(newLogic));

        vm.stopBroadcast();
    }
}
