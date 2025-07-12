// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
// import "@openzeppelin/contracts-upgradeable/contracts/token/ERC20/ERC20Upgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

//合约V1版本
contract MyToken is ERC20, Ownable, Initializable {
    uint256 public x;

    function initialize(uint256 _x,uint256 initialSupply) public onlyInitializing {
        _mint(msg.sender, initialSupply);
        x = _x;
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
}
