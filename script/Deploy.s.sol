// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "forge-std/Script.sol";
import "../contract/MyToken.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract Deploy is Script{

    function run() external{
         vm.startBroadcast();

        // 1. 部署逻辑合约
        MyToken logic = new MyToken();

        // 2. 初始化数据
        bytes memory data = abi.encodeWithSignature("initialize()");

        // 3. 部署代理合约
        ERC1967Proxy proxy = new ERC1967Proxy(address(logic), data);

        console.log("Proxy deployed at:", address(proxy));
        console.log("Logic deployed at:", address(logic));

        vm.stopBroadcast();
    }
}