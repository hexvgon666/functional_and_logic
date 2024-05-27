import java.util.*

class TreeNode<T : Comparable<T>>(
    var value: T,
    var left: TreeNode<T>? = null,
    var right: TreeNode<T>? = null
)

// функция сортировки строк в качестве аргумента

fun <T : Comparable<T>> buildTree(list: List<T>, comparator: Comparator<T>? = null): TreeNode<T>? {
    if (list.isEmpty()) return null

    val mid = list.size / 2
    val root = TreeNode(list[mid])
    root.left = buildTree(list.subList(0, mid), comparator)
    root.right = buildTree(list.subList(mid + 1, list.size), comparator)
    return root
}

//fun <T : Comparable<T>> buildTree(list: List<T>): TreeNode<T>? {
//    if (list.isEmpty()) return null
//
//    val mid = list.size / 2
//    val root = TreeNode(list[mid])
//    root.left = buildTree(list.subList(0, mid))
//    root.right = buildTree(list.subList(mid + 1, list.size))
//    return root
//}

fun <T : Comparable<T>> inorderTraversal(root: TreeNode<T>?): List<T> {
    val result = mutableListOf<T>()
    inorderTraversalHelper(root, result)
    return result
}

private fun <T : Comparable<T>> inorderTraversalHelper(
    node: TreeNode<T>?,
    result: MutableList<T>
) {
    node ?: return
    inorderTraversalHelper(node.left, result)
    result.add(node.value)
    inorderTraversalHelper(node.right, result)
}

//fun main() {
//    val strings = listOf("apple juice", "banana sok", "cherry mery cris", "date", "elderberry")
//    val tree = buildTree(strings.sortedBy { it.split(" ").size })
//    println(inorderTraversal(tree))
//}

fun main() {
    val strings = listOf("apple juice", "banana sok", "cherry mery cris", "date", "elderberry")
    val tree = buildTree(strings, compareBy{ it.split(" ").size })
    println(inorderTraversal(tree))
}



