import java.lang.System.`in`
import java.util.*

class max_minOdd_GCD{

    //Найти максимальную цифру числа.
    fun max(x: Int): Int {
        var max = 0
        var y = x
        while (y != 0) {
            val predMax = y % 10
            if (predMax > max) {
                max = predMax
            }
            y /= 10
        }
        return max
    }

    //Найти минимальную нечетную цифру числа.
    fun minOdd(x: Int): Int {
        var min = 10
        var y = x
        while (y != 0) {
            val predMin = y % 10
            if ((predMin < min) && (predMin%2 != 0)) {
                min = predMin
            }
            y /= 10
        }
        return min
    }

    //Найти НОД двух чисел.
    fun GCD(x: Int, y: Int): Int {
        var gcd = 1
        var f = if(x > y) y
                else x
        var i = 1
        while (i != f) {
            if ( (x%i == 0) && (y%i == 0) && (i > gcd)) {
                gcd = i
            }
            i++
        }
        return gcd
    }


    fun main() {
        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        val y: Int = scanner.nextInt()
        println(GCD(x, y))
    }
}

fun main() = max_minOdd_GCD().main()