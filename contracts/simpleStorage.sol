//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    //unit 256 bit variable called storedData
    uint storedData;

    //Set function for modifying the storedData variable
    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return  storedData;
    }
}