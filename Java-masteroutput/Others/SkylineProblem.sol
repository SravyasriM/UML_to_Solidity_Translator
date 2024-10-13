pragma solidity 0.7.5;

//package Others


import "java/util/ArrayList.sol";

import "java/util/Iterator.sol";

import "java/util/Scanner.sol";

contract SkylineProblem
{
	

	int32 count;

	function run() public
	{
			Scanner sc;
			int32 num = int32(sc.nextInt());
			SkylineProblem.building = new Building[](num);
			for(int32 i = int32(0); i < num; i++;)
			{
					string memory input = string(sc.next());
					this.add(Integer.parseInt(data[uint256(0)]), Integer.parseInt(data[uint256(1)]), Integer.parseInt(data[uint256(2)]));
			}
			this.print(this.findSkyline(0, num - 1));
			sc.close();
	}

	function add(int32 left, int32 height, int32 right) public
	{
			;
	}

	function print(ArrayList skyline) public
	{
			Iterator it = Iterator(skyline.iterator());
			while(it.hasNext())
			{
					Skyline temp = Skyline(it.next());
					System.out.print(temp.coordinates + "," + temp.height);
					if(it.hasNext())
					{
							System.out.print(",");
					}

			}
	}

	function findSkyline(int32 start, int32 end) public returns(ArrayList)
	{
			if(start == end)
			{
					ArrayList list;
					return list;
			}
			int32 mid = int32((start + end) / 2);
			ArrayList sky1 = ArrayList(this.findSkyline(start, mid));
			ArrayList sky2 = ArrayList(this.findSkyline(mid + 1, end));
			return this.mergeSkyline(sky1, sky2);
	}

	function mergeSkyline(ArrayList sky1, ArrayList sky2) public returns(ArrayList)
	{
			int32 currentH1 = int32(0);
			ArrayList skyline;
			int32 maxH = int32(0);
			while(!sky1.isEmpty(); && !sky2.isEmpty();)
			{
					if(sky1.get(0).coordinates < sky2.get(0).coordinates)
					{
							int32 currentX = int32(sky1.get(0).coordinates);
							currentH1 = sky1.get(0).height;
							if(currentH1 < currentH2)
							{
									sky1.remove(0);
									if(maxH != currentH2)
							}
							else
							{
									maxH = currentH1;
									sky1.remove(0);
							}

					}
					else
					{
							int32 currentX = int32(sky2.get(0).coordinates);
							currentH2 = sky2.get(0).height;
							if(currentH2 < currentH1)
							{
									sky2.remove(0);
									if(maxH != currentH1)
							}
							else
							{
									maxH = currentH2;
									sky2.remove(0);
							}

					}


			}
			while(!sky1.isEmpty();)
			{
					skyline.add(sky1.get(0));
					sky1.remove(0);

			}
			while(!sky2.isEmpty();)
			{
					skyline.add(sky2.get(0));
					sky2.remove(0);

			}
			return skyline;
	}

}

library SkylineProblem_Library
{
	function main(string[] memory args) public
	{
			SkylineProblem skylineProblem;
			skylineProblem.run();
	}

}

