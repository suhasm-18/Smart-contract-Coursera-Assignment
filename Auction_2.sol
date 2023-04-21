pragma solidity ^0.4.17;
contract Auction {

    // Data
    //Structure to hold details of the item
    struct Item {
        uint itemId; // id of the item
        uint[] itemTokens;  //tokens bid in favor of the item

    }

   //Structure to hold the details of a persons
    struct Person {
        uint remainingTokens; // tokens remaining with bidder
        uint personId; // it serves as tokenId as well
        address addr;//address of the bidder
    }

    mapping(address => Person) tokenDetails; //address to person
    Person [4] bidders;//Array containing 4 person objects

    Item [3] public items;//Array containing 3 item objects
    address[3] public winners;//Array for address of winners
    address public beneficiary;//owner of the smart contract

    uint bidderCount=0;//counter
    
     //functions

    function Auction() public payable{    //constructor

        //Part 1 Task 1. Initialize beneficiary with address of smart contract’s owner
        //Hint. In the constructor,"msg.sender" is the address of the owner.
        // ** Start code here. 1 line approximately. **/
        beneficiary = msg.sender;
          //** End code here. **/
        uint[] memory emptyArray;
        items[0] = Item({itemId:0,itemTokens:emptyArray});

        //Part 1 Task 2. Initialize two items with at index 1 and 2.
        // ** Start code here. 2 lines approximately. **/
        items[1] = Item({itemId:1, itemTokens: emptyArray});
        items[2] = Item({itemId:2, itemTokens: emptyArray});
        //** End code here**/
    }
    
     function register() public payable{


        bidders[bidderCount].personId = bidderCount;

        //Part 1 Task 3. Initialize the address of the bidder
        /*Hint. Here the bidders[bidderCount].addr should be initialized with address of the registrant.*/

        // ** Start code here. 1 line approximately. **/
        bidders[bidderCount].addr = msg.sender;
        //** End code here. **

        bidders[bidderCount].remainingTokens = 5; // only 5 tokens
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++;
    }
