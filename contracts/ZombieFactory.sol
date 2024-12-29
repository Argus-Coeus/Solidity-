// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ZombieFactory {


   //Event
   event NewZombie(uint zombieId,string  name, uint dna);


    //State variable
    uint dnaDigits = 16;
    //State variable for Math Operations
    uint dnaModulus = 10 ** dnaDigits;

    //Struct 
    struct Zombie {
        string  name;
        uint dna;
    }

    //Arrays
    Zombie[] public  zombies;

    //Function Declaration
    function _createZombie(string memory _name, uint _dna) private   {
        zombies.push(Zombie(_name,_dna));
        //Fire Event
        uint id = zombies.length - 1;
        emit  NewZombie(id, _name, _dna);

}


    function _generateRandomDna(string memory _str) private view returns (uint){

        //Keccak256 and Typecasting
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name)public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name,randDna);
    }

}