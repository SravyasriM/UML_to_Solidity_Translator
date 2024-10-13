pragma solidity 0.7.5;

//package Others


import "java/util/ArrayList.sol";

import "java/util/Random.sol";

import "java/util/concurrent/ThreadLocalRandom.sol";

/**
 * @author dimgrichr
 */

contract CRCAlgorithm
{
	int32 private  correctMess;

	int32 private  wrongMess;

	int32 private  wrongMessCaught;

	int32 private  wrongMessNotCaught;

	int32 private  messSize;

	int64 private  ber;

	bool private  messageChanged;

	ArrayList private  message;

	ArrayList private  dividedMessage;

	ArrayList private  p;

	Random private  randomGenerator;

	/**
 * Returns the counter wrongMess
 *
 * @return wrongMess, the number of Wrong Messages
 */

	function getWrongMess() public returns(int32)
	{
			return wrongMess;
	}

	/**
 * Returns the counter wrongMessCaught
 *
 * @return wrongMessCaught, the number of wrong messages, which are caught by the CRC algoriithm
 */

	function getWrongMessCaught() public returns(int32)
	{
			return wrongMessCaught;
	}

	/**
 * Returns the counter wrongMessNotCaught
 *
 * @return wrongMessNotCaught, the number of wrong messages, which are not caught by the CRC
 *     algorithm
 */

	function getWrongMessNotCaught() public returns(int32)
	{
			return wrongMessNotCaught;
	}

	/**
 * Returns the counter correctMess
 *
 * @return correctMess, the number of the Correct Messages
 */

	function getCorrectMess() public returns(int32)
	{
			return correctMess;
	}

	/**
 * Resets some of the object's values, used on the main function, so that it can be re-used, in
 * order not to waste too much memory and time, by creating new objects.
 */

	function refactor() public
	{
			messageChanged = false;
			;
			;
	}

	/**
 * Random messages, consisted of 0's and 1's, are generated, so that they can later be transmitted
 */

	function generateRandomMess() public
	{
			for(int32 i = int32(0); i < messSize; i++;)
			{
					int32 x = int32(ThreadLocalRandom.current().nextInt(0, 2));
					message.add(x);
			}
	}

	/**
 * The most significant part of the CRC algorithm. The message is divided by P, so the
 * dividedMessage ArrayList<Integer> is created. If check == true, the dividedMessaage is
 * examined, in order to see if it contains any 1's. If it does, the message is considered to be
 * wrong by the receiver,so the variable wrongMessCaught changes. If it does not, it is accepted,
 * so one of the variables correctMess, wrongMessNotCaught, changes. If check == false, the
 * diviided Message is added at the end of the ArrayList<integer> message.
 *
 * @param check the variable used to determine, if the message is going to be checked from the
 *     receiver if true, it is checked otherwise, it is not
 */

	function divideMessageWithP(bool check) public
	{
			ArrayList x;
			ArrayList k = ArrayList(ArrayList(message.clone()));
			if(!check;)
			{
					for(int32 i = int32(0); i < p.size() - 1; i++;)
					{
							k.add(0);
					}
			}
			while(!k.isEmpty();)
			{
					while(x.size() < p.size() && !k.isEmpty();)
					{
							x.add(k.get(0));
							k.remove(0);

					}
					if(x.size() == p.size())
					{
							for(int32 i = int32(0); i < p.size(); i++;)
							{
									if(x.get(i) == p.get(i))
									{
											x.set(i, 0);
									}
									else
									{
											x.set(i, 1);
									}

							}
							for(int32 i = int32(0); i < x.size() && x.get(i) != 1; i++;)
							{
									x.remove(0);
							}
					}

			}
			dividedMessage = ArrayList(x.clone());
			if(!check;)
			{
					for(uint256 iterator_var = uint256(0); iterator_var < dividedMessage.length; iterator_var++;)
					{
							int32 z = int32(dividedMessage[uint256(iterator_var)]);
							message.add(z);
					}
			}
			else
			{
					if(dividedMessage.contains(1) && messageChanged)
					{
							wrongMessCaught++;
					}
					else
					{
						if(!dividedMessage.contains(1); && messageChanged)
						{
								wrongMessNotCaught++;
						}
						else
						{
							if(!messageChanged;)
							{
									correctMess++;
							}						}
					}

			}

	}

	/**
 * Once the message is transmitted, some of it's elements, is possible to change from 1 to 0, or
 * from 0 to 1, because of the Bit Error Rate (ber). For every element of the message, a random
 * double number is created. If that number is smaller than ber, then the spesific element
 * changes. On the other hand, if it's bigger than ber, it does not. Based on these changes. the
 * boolean variable messageChanged, gets the value: true, or false.
 */

	function changeMess() public
	{
			for(uint256 iterator_var = uint256(0); iterator_var < message.length; iterator_var++;)
			{
					int32 y = int32(message[uint256(iterator_var)]);
					int64 x = int64(randomGenerator.nextDouble()); //Converted from DOUBLE TYPE of Java
					while(x < 0 || x > 1)
					{
							x = randomGenerator.nextDouble();

					}
					if(x < ber)
					{
							messageChanged = true;
							if(y == 1)
							{
									message.set(message.indexOf(y), 0);
							}
							else
							{
									message.set(message.indexOf(y), 1);
							}

					}
			}
			if(messageChanged)
			{
					wrongMess++;
			}
	}

	/**
 * The algorithm's main constructor. The most significant variables, used in the algorithm, are
 * set in their initial values.
 *
 * @param str The binary number P, in a string form, which is used by the CRC algorithm
 * @param size The size of every transmitted message
 * @param ber The Bit Error Rate
 */

	constructor(string str, int32 size, int64 ber) public
	{
			messageChanged = false;
			;
			messSize = size;
			;
			;
			for(int32 i = int32(0); i < str.length(); i++;)
			{
					p.add(Character.getNumericValue(str.charAt(i)));
			}
			;
			correctMess = 0;
			wrongMess = 0;
			wrongMessCaught = 0;
			wrongMessNotCaught = 0;
			CRCAlgorithm.ber = ber;
	}

}

library CRCAlgorithm_Library
{
}

