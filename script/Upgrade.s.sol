// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contract/MyToken2.sol";
import "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";

interface IUpgradeable {
    function upgradeTo(address newImplementation) external;
}

contract UpgradeToV2 is Script {
    address proxyAddress = 0x...; // 填写代理地址

    function run() external {
        vm.startBroadcast();

        MyToken2 newLogic = new MyToken2();
        console.log("New Logic Deployed:", address(newLogic));

        IUpgradeable(proxyAddress).upgradeTo(address(newLogic));
        console.log("Proxy upgraded.");

        vm.stopBroadcast();
    }
}
