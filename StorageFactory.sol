// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracs;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracs.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex,uint256 _newSimpleStorageNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracs[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber); 
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracs[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}