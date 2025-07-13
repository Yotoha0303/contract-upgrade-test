// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./MyToken.sol";
import "./DividendLogic.sol";

//MyToken(V2)
contract MyToken2 is MyToken, DividendLogic {
    //  function getVersion() public pure virtual  override  returns(string memory){
    //     return "V2";
    // }
}
