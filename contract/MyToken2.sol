// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./MyToken.sol";
import "./DividendLogic.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

//MyToken(V2)
contract MyToken2 is MyToken, DividendLogic {
    // uint256 public x;

    // function initialize(
    //     // uint256 _newX,
    //     uint256 _oldX,
    //     uint256 initialSupply
    // ) public {
    //     MyToken.initialize(_oldX);
    //     _mint(msg.sender, initialSupply);
    //     // x = _newX;
    // }
    // function updateContractStatus(uint256 _x) public {
    //     MyToken.initialize(_x);
    // }

    function getVersion() public view returns(uint256){
        return "V2";
    }

    // constructor() {}
}
