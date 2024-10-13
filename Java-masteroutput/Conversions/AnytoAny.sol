pragma solidity 0.7.5;

//package Conversions


import "java/util/Scanner.sol";

contract AnytoAny
{
}

library AnytoAny_Library
{
	function main(string[] memory args) public
	{
			Scanner scn;
			int32 sn = int32(scn.nextInt());
			int32 sb = int32(scn.nextInt());
			int32 db = int32(scn.nextInt());
			int32 m = int32(1);
			while(sn != 0)
			{
					dec = dec + (sn % 10) * m;
					m *= sb;
					sn /= 10;

			}
			m = 1;
			while(dec != 0)
			{
					dn = dn + (dec % db) * m;
					m *= 10;
					dec /= db;

			}
			System.out.println(dn);
			scn.close();
	}

}

//Optional.empty


//Optional.empty


//Optional.empty


