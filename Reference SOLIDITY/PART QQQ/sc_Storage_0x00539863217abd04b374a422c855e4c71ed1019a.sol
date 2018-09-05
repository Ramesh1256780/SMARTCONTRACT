/**********************************************************************
*These solidity codes have been obtained from Etherscan for extracting
*the smartcontract related info.
*The data will be used by MATRIX AI team as the reference basis for
*MATRIX model analysis,extraction of contract semantics,
*as well as AI based data analysis, etc.
**********************************************************************/
pragma solidity ^0.4.18;

contract Storage {
  address public owner;
  uint256 public storedAmount;

  function Storage() public {
    owner = msg.sender;
  }

  modifier onlyOwner{
    require(msg.sender == owner);
    _;
  }

  function()
  public
  payable {
    storeEth();
  }

  function storeEth()
  public
  payable {
    storedAmount += msg.value;
  }

  function getEth()
  public
  onlyOwner{
    storedAmount = 0;
    owner.transfer(this.balance);
  }

  function sendEthTo(address to)
  public
  onlyOwner{
    storedAmount = 0;
    to.transfer(this.balance);
  }
}