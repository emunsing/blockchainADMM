pragma solidity ^0.4.4;

contract AggSimple{

	int256 public x;
	int256 public z;
	int256 public y;
	

	uint8 public rho;

	int256 public A;
	int256 public B;
	int256 public c;

	function AggSimple(){
		x = 0;
		y = 0;
		z = 0;

		rho = 2;
		A = 1;
		B = 1;
		c = 4 * 1e9;
	}

	function updateY(){
		y = y + rho * (A * x + B * z - c);
		return;
	}

	function setX(int256 _x){
		x = _x;
		return;
	}

	function setZ(int256 _z){
		z = _z;
		return;
	}

	function setY(int256 _y){
		y = _y;
		return;
	}

	// FOR AGGREGATOR-BASED CHECKS OF CORRECT ITERATION:

    address[] public whitelist;    //Array of addresses in the whitelist
    mapping (address => bool) public waiting;
    // mapping (address => Estimate) public allEstimates;


    function stillWaiting () returns (bool) {
        for (uint8 i=0; i<whitelist.length; i++){
            if ( waiting[ whitelist[i] ] ){ return true; }
        }
        return false;
    }

    function resetWaiting () returns(bool){
        // Reset the flag for each address        
        for(uint8 i=0; i<whitelist.length; i++){
            waiting[whitelist[i]] = true;
        }
//        waiting[whitelist[0]] = true;
//        waiting[whitelist[1]] = true;
        return true;
    }



}