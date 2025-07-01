// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    uint256 myFavoriteNumber; // gets initialized to 0

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array, there's no max numbers of elements
    Person[] public listOfPeople;

    mapping (string => uint256) public nameToFavoriteNumber;


    function store(uint256 _favoriteNumber) public virtual {
       myFavoriteNumber = _favoriteNumber;
    }

    function retrieve () public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        listOfPeople.push(Person (_favoriteNumber, _name));

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}