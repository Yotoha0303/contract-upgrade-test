// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./MyToken.sol";
import "./DividendLogic.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

//MyToken(V2)
contract MyToken2 is MyToken, DividendLogic, Initializable {
    uint256 public x;

    function initialize(
        uint256 _newX,
        uint256 _oldX,
        uint256 initialSupply
    ) public initializer {
        MyToken.initialize(_oldX);
        _mint(msg.sender, initialSupply);
        x = _newX;
    }

    constructor() {}
}
