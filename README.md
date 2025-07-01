# 🔐 StorageFactory Solidity Project

This Solidity project demonstrates key concepts in smart contract development, including the factory pattern, inheritance, and method overriding.

It includes three contracts:

- `SimpleStorage`: A base contract that stores a number and associates people with their favorite numbers.
- `StorageFactory`: A factory contract capable of deploying and interacting with multiple instances of `SimpleStorage` or its derived contracts.
- `AddFiveStorage`: A contract that inherits from `SimpleStorage` and overrides one of its core functions.

---

## 📦 Contracts Overview

### 1. `SimpleStorage.sol`

A basic storage contract that allows storing and retrieving a favorite number, as well as storing a list of people with their names and favorite numbers.

#### Key Components:
- `uint256 myFavoriteNumber`: Stores the current favorite number.
- `struct Person`: Represents a person with a `name` and their `favoriteNumber`.
- `Person[] public listOfPeople`: A dynamic array of `Person` structs.
- `mapping(string => uint256) public nameToFavoriteNumber`: Maps a name to a favorite number.

#### Functions:
- `store(uint256 _favoriteNumber)`: Stores the given number.
- `retrieve()`: Returns the stored favorite number.
- `addPerson(uint256 _favoriteNumber, string memory _name)`: Adds a person and maps their name to their number.

---

### 2. `StorageFactory.sol`

A contract that acts as a factory to deploy new instances of `SimpleStorage` and interact with them via indexed access.

#### State:
- `SimpleStorage[] public listOfSimpleStorageContracs`: Stores deployed instances.

#### Functions:
- `createSimpleStorageContract()`: Deploys a new `SimpleStorage` instance and stores it in the array.
- `sfStore(uint256 index, uint256 value)`: Calls `store(value)` on the instance at the specified index.
- `sfGet(uint256 index)`: Calls `retrieve()` on the instance at the specified index and returns the result.

> You can use this contract to manage and interact with multiple storage contracts from a single point.

---

### 3. `AddFiveStorage.sol`

A child contract that inherits from `SimpleStorage` and overrides the `store()` function to add `+5` to the value before saving it.

#### Overridden Function:
```solidity
function store(uint256 _newNumber) public override {
    myFavoriteNumber = _newNumber + 5;
}
