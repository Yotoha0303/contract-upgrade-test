// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IMyToken2 {

    function mint(address to,uint256 amount) external;
    
    function balanceOf(address account) external returns(uint256);
}