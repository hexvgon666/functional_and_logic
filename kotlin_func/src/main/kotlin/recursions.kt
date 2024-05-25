import java.lang.System.`in`
import java.util.*

class recursions {

    //Найти максимальную цифру числа. Рекурсия вверх.
    fun max(x: Int): Int = if (x < 10) x else {if(x%10 > max(x/10)) x%10 else max(x/10)}

    //Найти минимальную нечетную цифру числа. Рекурсия вверх.
    fun minOdd(x: Int): Int = if(x < 10) {if (x%2 != 0) x else 9} else {if ((x%10 < minOdd(x/10)) && ((x%10)%2 != 0)) x%10 else minOdd(x/10)}

    //Найти НОД двух чисел. Рекурсия вверх.
    fun gcd(x: Int, y: Int): Int = if (y == 0) x else gcd(y, x % y)



    //Найти максимальную цифру числа. Хвостовая рекурсия.
    tailrec fun maxTail(x: Int , y: Int): Int = if (x < 10) {if (x > y) x else y} else {if(x%10 > y) maxTail(x/10, x%10) else maxTail(x/10, y)}

    //Найти минимальную нечетную цифру числа. Хвостовая рекурсия.
    tailrec fun minOddTail(x: Int, y: Int):  Int = if(x < 10) {if ((x%2 != 0) && (x < y)) x else y} else {if ((x%10 < y) && ((x%10)%2 != 0)) minOddTail(x/10, x%10) else minOddTail(x/10, y)}

    //Найти НОД двух чисел. Хвостовая рекурсия.
    tailrec fun gcdTail(x: Int, y: Int, z: Int): Int = if (z == 1) 1  else { if ((x%z == 0) && (y%z == 0)) z else gcdTail(x, y, z - 1) }



    fun main() {
        val scanner = Scanner(System.`in`)
        val x: Int = scanner.nextInt()
        val y: Int = scanner.nextInt()
        println(gcdTail(x, y, y))
    }
}

fun main() = recursions().main()