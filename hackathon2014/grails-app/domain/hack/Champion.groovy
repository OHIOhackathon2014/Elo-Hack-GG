package hack

class Champion {

	Integer champid
	
	String title
	
	static hasMany = [stats: Stat]
	
	
    static constraints = {
    }
}
