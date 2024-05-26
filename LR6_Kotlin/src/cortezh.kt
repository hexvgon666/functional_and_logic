import java.util.Scanner

class cortezh{
    //Задание 2. Реализовать функцию, которая для данного списка указывает, сколько элементов из
    //него могут быть квадратом какого-то из элементов списка.
    fun countSquares(num: List<Int>): Int {
        val square = num.map { Math.sqrt(it.toDouble()) }
        return countSquares2(num, square, 0)
    }

    fun countSquares2(num: List<Int>, square: List<Double>, index: Int): Int {
        if (index == num.size) {
            return 0
        }
        return if (square[index].toInt() * square[index].toInt() == num[index]) {
            1 + countSquares2(num, square, index + 1)
        } else {
            countSquares2(num, square, index + 1)
        }
    }
    //Задание 2. Реализовать функцию, которая по трем спискам составляет список, состоящий из
    //кортежей длины 3, где каждый кортеж (ai,bi,ci) с номером I получен следующим образом:
    //Ai – I по убыванию элемент первого списка
    //Bi – I по возрастанию суммы цифр элемент второго списка
    //Сi - I по убыванию количества делителей элемент третьего списка
    //Все элементы одного списка различны.
    //Если в списках B или C два элемента имеют одинаковый коэффициент, большим считается
    //элемент, больший по абсолютной величине.

    fun cortezhList(list1: List<Int>, list2: List<Int>, list3: List<Int>): List<Triple<Int, Int, Int>> {
        val sortedList1 = list1.sorted().reversed()
        val sortedList2 = qust(list2)
        val sortedList3 = count(list3).reversed()

        return sortedList1.mapIndexed { index, a ->
            Triple(a, sortedList2[index], sortedList3[index])
        }
    }

    fun sumOfDigits(num: Int): Int {
        return num.toString().sumOf { it.digitToInt() }
    }

    fun qust(list: List<Int>): List<Int> {
        return list.sortedBy{qust2(it)}
    }
    fun qust2(num: Int): Int{
        return if (num < 10) {
            num
        } else {
            num % 10 + sumOfDigits(num / 10)
        }
    }

    fun count(list: List<Int>): List<Int> {
        return list.sortedBy{count2(it)}
    }
    fun count2(num: Int, count: Int = 2, z: Int = 0): Int {
        return if (count > num / 2) {
            z + if (num % count == 0) 1 else 0
        } else {
            count2(num, count + 1, z + if (num % count == 0) 1 else 0)
        }
    }



    fun main() {

        val scanner = Scanner(System.`in`)
        println("Введите элементы 1 списка:")
        val list1 = scanner.nextLine().split(" ").map { it.toInt() }
        println("Введите элементы 2 списка:")
        val list2 = scanner.nextLine().split(" ").map { it.toInt() }
        println("Введите элементы 3 списка:")
        val list3 = scanner.nextLine().split(" ").map { it.toInt() }
        //val a = scanner.nextInt()
        //val b = scanner.nextInt()
        println(cortezhList(list1, list2, list3))

    }
}
fun main() = cortezh().main()