// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract SimpleStorage {
    uint256 myfavouriteNumber;

    // uint256[] listOfFavouriteNumbers;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // Person public person = Person({favouriteNumber: 7, name: "John"});

    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavouriteNumber;


    function store(uint256 _favouriteNumber) public virtual  {
        myfavouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myfavouriteNumber;
    }

    function addPeople(string memory _name, uint256 _favouriteNumber) public {
        Person memory newPerson = Person(_favouriteNumber, _name);
        listOfPeople.push(newPerson);
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}