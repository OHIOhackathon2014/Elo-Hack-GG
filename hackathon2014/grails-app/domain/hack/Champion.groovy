package hack

class Champion {

	Integer champid
	
	String name
	
	static hasMany = [stats: Stat]
	
	static mapping = {
		id generator: 'increment'	
	}
	
    static constraints = {
    }
}
