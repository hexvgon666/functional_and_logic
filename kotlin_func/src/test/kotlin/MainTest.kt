import org.junit.jupiter.api.Assertions.*

internal class MainTest {

    @org.junit.jupiter.api.Test
    fun max3() {
        val main = Main()
        val expected = 10
        assertEquals(expected, main.max3(3,10,5))
    }

    @org.junit.jupiter.api.Test
    fun factup() {
        val main = Main()
        val expected = 5040
        assertEquals(expected, main.factup(7))
    }

    @org.junit.jupiter.api.Test
    fun factdown() {
        val main = Main()
        val expected = 720
        assertEquals(expected, main.factdown(6))
    }

    @org.junit.jupiter.api.Test
    fun sumcd() {
        val main = Main()
        val expected = 18
        assertEquals(expected, main.sumcd(99))
    }

    @org.junit.jupiter.api.Test
    fun sumc() {
        val main = Main()
        val expected = 33
        assertEquals(expected, main.sumcd(9996))
    }

    @org.junit.jupiter.api.Test
    fun mulc() {
        val main = Main()
        val expected = 81
        assertEquals(expected, main.mulc(99))
    }

    @org.junit.jupiter.api.Test
    fun calc() {
        val main = Main()
        val expected = 10
        assertEquals(expected, main.calc(true)(1234))
    }

    @org.junit.jupiter.api.Test
    fun sumd() {
        val main = Main()
        val expected = 10
        assertEquals(expected, main.sumd(1234))
    }

    @org.junit.jupiter.api.Test
    fun muld() {
        val main = Main()
        val expected = 126
        assertEquals(expected, main.muld(367))
    }

    @org.junit.jupiter.api.Test
    fun maxd() {
        val main = Main()
        val expected = 7
        assertEquals(expected, main.maxd(123745))
    }

    @org.junit.jupiter.api.Test
    fun mind() {
        val main = Main()
        val expected = 2
        assertEquals(expected, main.mind(923745))
    }
}