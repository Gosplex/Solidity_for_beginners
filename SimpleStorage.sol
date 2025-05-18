// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;



contract SimpleStorage {
    
    uint256 myFavouriteNuumber;

    struct Person {
        string name;
        uint256 favouriteNumber;
    }

    Person[] public myFriends;

    mapping(string => uint256) public nameToFacouriteNumber;

    function store(uint256 _myFavouriteNumber) public {
        myFavouriteNuumber = _myFavouriteNumber;
        myFavouriteNuumber *= myFavouriteNuumber;
    }

    function retrieve() public view returns (uint256) {
       return myFavouriteNuumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        Person memory newPerson = Person(_name,_favouriteNumber); 
        myFriends.push(newPerson);
        nameToFacouriteNumber[_name] = _favouriteNumber;
    }
}

