// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// import "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";


contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorage;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorage.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        listOfSimpleStorage[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listOfSimpleStorage[_simpleStorageIndex].retrieve();
    }
}