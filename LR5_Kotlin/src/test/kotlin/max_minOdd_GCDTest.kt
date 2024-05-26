import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*

internal class max_minOdd_GCDTest {

    @Test
    fun max() {
        val main = max_minOdd_GCD()
        val expected = 8
        assertEquals(expected, main.max(87651234))
    }

    @Test
    fun minOdd() {
        val main = max_minOdd_GCD()
        val expected = 5
        assertEquals(expected, main.minOdd(987656789))
    }

    @Test
    fun GCD() {
        val main = max_minOdd_GCD()
        val expected = 5
        assertEquals(expected, main.GCD(25, 10))
    }
}