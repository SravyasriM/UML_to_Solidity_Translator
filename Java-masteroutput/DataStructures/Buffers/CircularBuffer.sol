pragma solidity 0.7.5;

//package DataStructures.Buffers


import "java/util/Random.sol";

import "java/util/concurrent/atomic/AtomicInteger.sol";

contract CircularBuffer
{
	int32 public  immutable _buffer_size;

	int32 private  _write_index = int32(0);

	int32 private  _read_index = int32(0);

	AtomicInteger private  _readable_data;

	function IsPowerOfTwo(int32 i) private returns(bool)
	{
			return (i & (i - 1)) == 0;
	}

	function getTrueIndex(int32 i) private returns(int32)
	{
			return i % _buffer_size;
	}

	function readOutChar() public returns(Character)
	{
			Character result;
			// if we have data to read

			if(_readable_data.get() > 0)
			{
					result = Character.valueOf(_buffer[uint256(getTrueIndex(_read_index))]);
					_readable_data.decrementAndGet();
					_read_index++;
			}
			return result;
	}

	function writeToCharBuffer(byte c) public returns(bool)
	{
			bool result = bool(false);
			// if we can write to the buffer

			if(_readable_data.get() < _buffer_size)
			{
					// write to buffer

					_buffer[uint256(getTrueIndex(_write_index))] = c;
					_readable_data.incrementAndGet();
					_write_index++;
					result = true;
			}
			return result;
	}

	int private oc_id;

	bool private oc_status;

	constructor(int _oc_id) public
	{
			oc_id = _oc_id;
			oc_status = false;
	}

	modifier overloadedConstructor(int _oc_id)
	{
			require(oc_id == _oc_id, "Restricted for Overloaded Constructor");
			require(oc_status == false, "Restricted for only One Time Execution");
			_;
			oc_status = true;
	}

	function constructor1(int32 buffer_size) public	overloadedConstructor( 1 )
	{
			if(!IsPowerOfTwo(buffer_size);)
			{
			}
			CircularBuffer._buffer_size = buffer_size;
			_buffer = new byte[](buffer_size);
	}

	function constructor2(CircularBuffer cb) public	overloadedConstructor( 2 )
	{
			TestWriteWorker._buffer = cb;
	}

	function constructor3(CircularBuffer cb) public	overloadedConstructor( 3 )
	{
			TestReadWorker._buffer = cb;
	}

}

library CircularBuffer_Library
{
	function main(string[] memory args) public
	{
			int32 buffer_size = int32(1024);
			// create circular buffer

			CircularBuffer cb;
			// create threads that read and write the buffer.

			Thread write_thread;
			Thread read_thread;
			read_thread.start();
			write_thread.start();
			// wait some amount of time

			Thread.sleep(10000);
			// interrupt threads and exit

			write_thread.interrupt();
			read_thread.interrupt();
	}

}

