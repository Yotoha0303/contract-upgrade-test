// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

//合约V1版本
contract MyToken is ERC20Upgradeable, OwnableUpgradeable,UUPSUpgradeable {
    // uint256 public x;

    // function initialize(uint256 _x) public onlyInitializing {
    //     x = _x;
    // }

    //暂时不改变
    function initializeSupply(uint256 initialSupply) public {
        _mint(msg.sender, initialSupply);
    }

    //可能需要修改
    constructor(
        
    ) ERC20("MyToken", "MTK") Ownable(msg.sender) {
        
        
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }

    // 用于控制升级权限（这里限制为合约拥有者）
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
