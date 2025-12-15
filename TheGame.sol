// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version Solidity
pragma solidity 0.8.24;


// Contrato
contract TheGame {

 
  // Arguments
    uint8 private secretNumber; 
    bool public gameFinished; 
    address public winner; 
    uint8 public totalAttempts;


  // Mapping
  mapping(address => uint8) public attempts; 


  // Events
  event GuessMade(address player, uint8 number);
  event GameWon (address winner);


  // Constructor
  constructor(uint8 _secretNumber){
    secretNumber = _secretNumber;
    gameFinished = false;
  }


  // Fuctions 
  function guess(uint8 _number) public {
    if (gameFinished == true) {
        revert("Game already finished");
    }
    attempts[msg.sender] = attempts[msg.sender] +1;
    totalAttempts = totalAttempts +1;

    emit GuessMade(msg.sender, _number);

    if (_number == secretNumber) {
        gameFinished = true;
        winner = msg.sender;
        emit GameWon(msg.sender);
     }}
}