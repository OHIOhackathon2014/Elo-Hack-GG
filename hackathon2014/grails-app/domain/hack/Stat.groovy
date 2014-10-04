package hack

class Stat {

	Integer attackrange
	
	Integer mpperlevel

    static constraints = {
    }
	
	
	// Champions have stats
	static belongsTo = [champion: Champion]
}
