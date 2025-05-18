// SPDX-License-Identifier: MIT
pragma solidity  0.8.19;


contract SimpleStorage {
    uint256 myFavouriteNumber;

    // uint256[] listOfFavouriteNumbers;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfFriends;



    // Person public person = Person({favouriteNumber: 7, name: "Puchhu"});

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
        myFavouriteNumber *= myFavouriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavouriteNumber;
    }

    function addPerson(string memory name, uint256 _favouriteNuumber) public {
        Person memory newPerson = Person(_favouriteNuumber, name);
        listOfFriends.push(newPerson);
    }
}