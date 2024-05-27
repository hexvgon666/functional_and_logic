import java.time.LocalDate
import java.util.regex.Pattern
import java.util.TreeSet

class Document(
    var series: String,
    var number: String,
    var issueDate: LocalDate
) : Comparable<Document> {
    companion object {
        private val SERIES_PATTERN = Pattern.compile("^[A-Z]{2}$")
        private val NUMBER_PATTERN = Pattern.compile("^[0-9]{6}$")
    }

    init {
        require(SERIES_PATTERN.matcher(series).matches()) { "Invalid series format" }
        require(NUMBER_PATTERN.matcher(number).matches()) { "Invalid number format" }
    }

    override fun toString(): String {
        return "Document(series='$series', number='$number', issueDate=$issueDate)"
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as Document

        if (series != other.series) return false
        if (number != other.number) return false

        return true
    }

    override fun hashCode(): Int {
        var result = series.hashCode()
        result = 31 * result + number.hashCode()
        return result
    }

    override fun compareTo(other: Document): Int {
        return compareValues(this.issueDate, other.issueDate)
    }

    fun compareBySeriesAndNumber(other: Document): Int {
        val seriesComparison = this.series.compareTo(other.series)
        return if (seriesComparison != 0) {
            seriesComparison
        } else {
            this.number.compareTo(other.number)
        }
    }
}

fun main() {
    val doc1 = Document("AB", "123456", LocalDate.of(2022, 1, 1))
    val doc2 = Document("CD", "789012", LocalDate.of(2021, 12, 31))
    val doc3 = Document("AB", "123456", LocalDate.of(2022, 2, 1))

    println(doc1) // Output: Document(series='AB', number='123456', issueDate=2022-01-01)
    println(doc2) // Output: Document(series='CD', number='789012', issueDate=2021-12-31)
    println(doc3) // Output: Document(series='AB', number='123456', issueDate=2022-02-01)

    println(doc1 == doc3) // Output: true
    println(doc1 == doc2) // Output: false

    val documents = listOf(doc1, doc2, doc3)
    documents.sortedBy { it }.forEach { println(it) }
    // Output:
    // Document(series='CD', number='789012', issueDate=2021-12-31)
    // Document(series='AB', number='123456', issueDate=2022-01-01)
    // Document(series='AB', number='123456', issueDate=2022-02-01)

    documents.sortedWith(Comparator.comparing(Document::series).thenComparing(Document::number))

    // Output:
    // Document(series='AB', number='123456', issueDate=2022-01-01)
    // Document(series='AB', number='123456', issueDate=2022-02-01)
    // Document(series='CD', number='789012', issueDate=2021-12-31)

    val hashSet = HashSet(documents)
    println(hashSet.contains(doc1)) // Output: true
    println(hashSet.contains(Document("AB", "123456", LocalDate.of(2022, 1, 1)))) // Output: true
    println(hashSet.contains(Document("EF", "654321", LocalDate.of(2022, 1, 1)))) // Output: false

    val treeSet = TreeSet(documents)
    println(treeSet.contains(doc1)) // Output: true
    println(treeSet.contains(Document("AB", "123456", LocalDate.of(2022, 1, 1)))) // Output: true
    println(treeSet.contains(Document("EF", "654321", LocalDate.of(2022, 1, 1)))) // Output: false
}
