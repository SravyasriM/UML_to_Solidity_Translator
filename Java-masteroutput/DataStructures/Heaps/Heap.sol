pragma solidity 0.7.5;

//package DataStructures.Heaps


/**
 * Interface common to heap data structures.<br>
 *
 * <p>Heaps are tree-like data structures that allow storing elements in a specific way. Each node
 * corresponds to an element and has one parent node (except for the root) and at most two children
 * nodes. Every element contains a key, and those keys indicate how the tree shall be built. For
 * instance, for a min-heap, the key of a node shall be greater than or equal to its parent's and
 * lower than or equal to its children's (the opposite rule applies to a max-heap).
 *
 * <p>All heap-related operations (inserting or deleting an element, extracting the min or max) are
 * performed in O(log n) time.
 *
 * @author Nicolas Renard
 */

interface Heap
{
	/**
 * @return the top element in the heap, the one with lowest key for min-heap or with the highest
 *     key for max-heap
 * @throws EmptyHeapException if heap is empty
 */

	function getElement() virtual external returns(HeapElement);

	/**
 * Inserts an element in the heap. Adds it to then end and toggle it until it finds its right
 * position.
 *
 * @param element an instance of the HeapElement class.
 */

	function insertElement(HeapElement element) virtual external;

	/**
 * Delete an element in the heap.
 *
 * @param elementIndex int containing the position in the heap of the element to be deleted.
 */

	function deleteElement(int32 elementIndex) virtual external;

}

