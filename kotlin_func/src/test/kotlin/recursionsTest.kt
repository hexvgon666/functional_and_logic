import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class recursionsTest {

    @Test
    fun max() {
        val main = recursions()
        val expected = 9
        assertEquals(expected, main.max(998987109))
    }

    @Test
    fun minOdd() {
        val main = recursions()
        val expected = 5
        assertEquals(expected, main.minOdd(8406579))
    }

    @Test
    fun gcd() {
        val main = recursions()
        val expected = 3
        assertEquals(expected, main.gcd(9, 6))
    }

    @Test
    fun maxTail() {
        val main = recursions()
        val expected = 9
        assertEquals(expected, main.maxTail(31069345, 0))
    }

    @Test
    fun minOddTail() {
        val main = recursions()
        val expected = 1
        assertEquals(expected, main.minOddTail(76542014, 40213))
    }

    @Test
    fun gcdTail() {
        val main = recursions()
        val expected = 4
        assertEquals(expected, main.gcdTail(16, 8, 4))
    }
}