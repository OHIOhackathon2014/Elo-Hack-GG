package hack

class Stat {

	Integer attackrange
	
	Integer mpperlevel

    static constraints = {
    }
	
	static belongsTo = [champion: Champion]
}
