pragma solidity 0.7.5;

//package DataStructures.Heaps


/**
 * Class for heap elements.<br>
 *
 * <p>A heap element contains two attributes: a key which will be used to build the tree (int or
 * double, either primitive type or object) and any kind of IMMUTABLE object the user sees fit to
 * carry any information he/she likes. Be aware that the use of a mutable object might jeopardize
 * the integrity of this information.
 *
 * @author Nicolas Renard
 */

contract HeapElement
{
	int64 private  immutable key;

	Object private  immutable additionalInfo;

	/**
 * @return the object containing the additional info provided by the user.
 */

	function getInfo() public returns(Object)
	{
			return additionalInfo;
	}

	/**
 * @return the key value of the element
 */

	function getKey() public returns(int64)
	{
			return key;
	}

	function toString() public returns(String)
	{
			return "Key: " + key + " - " + additionalInfo.toString();
	}

	/**
 * @param otherHeapElement
 * @return true if the keys on both elements are identical and the additional info objects are
 *     identical.
 */

	function equals(Object o) public returns(bool)
	{
			if(o != none)
			{
					if(!();)
					{
						return false;					}
					HeapElement otherHeapElement = HeapElement(HeapElement(o));
					return (HeapElement.key == otherHeapElement.key) && (HeapElement.additionalInfo.equals(otherHeapElement.additionalInfo));
			}
			return false;
	}

	function hashCode() public returns(int32)
	{
			int32 result = int32(0);
			result = 31 * result + int32(key);
			result = 31 * result + (additionalInfo != none ? additionalInfo.hashCode() : 0);
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

	/**
 * @param key : a number of primitive type 'double'
 * @param info : any kind of IMMUTABLE object. May be null, since the purpose is only to carry
 *     additional information of use for the user
 */

	function constructor1(int64 key, Object info) public	overloadedConstructor( 1 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = info;
	}

	/**
 * @param key : a number of primitive type 'int'
 * @param info : any kind of IMMUTABLE object. May be null, since the purpose is only to carry
 *     additional information of use for the user
 */

	function constructor2(int32 key, Object info) public	overloadedConstructor( 2 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = info;
	}

	/**
 * @param key : a number of object type 'Integer'
 * @param info : any kind of IMMUTABLE object. May be null, since the purpose is only to carry
 *     additional information of use for the user
 */

	function constructor3(Integer key, Object info) public	overloadedConstructor( 3 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = info;
	}

	/**
 * @param key : a number of object type 'Double'
 * @param info : any kind of IMMUTABLE object. May be null, since the purpose is only to carry
 *     additional information of use for the user
 */

	function constructor4(Double key, Object info) public	overloadedConstructor( 4 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = info;
	}

	/**
 * @param key : a number of primitive type 'double'
 */

	function constructor5(int64 key) public	overloadedConstructor( 5 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = none;
	}

	/**
 * @param key : a number of primitive type 'int'
 */

	function constructor6(int32 key) public	overloadedConstructor( 6 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = none;
	}

	/**
 * @param key : a number of object type 'Integer'
 */

	function constructor7(Integer key) public	overloadedConstructor( 7 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = none;
	}

	/**
 * @param key : a number of object type 'Double'
 */

	function constructor8(Double key) public	overloadedConstructor( 8 )
	{
			HeapElement.key = key;
			HeapElement.additionalInfo = none;
	}

}

library HeapElement_Library
{
}

