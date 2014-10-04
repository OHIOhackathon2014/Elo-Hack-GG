package hack



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChampionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Champion.list(params), model:[championInstanceCount: Champion.count()]
    }

    def show(Champion championInstance) {
        respond championInstance
    }

    def create() {
        respond new Champion(params)
    }

    @Transactional
    def save(Champion championInstance) {
        if (championInstance == null) {
            notFound()
            return
        }

        if (championInstance.hasErrors()) {
            respond championInstance.errors, view:'create'
            return
        }

        championInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'champion.label', default: 'Champion'), championInstance.id])
                redirect championInstance
            }
            '*' { respond championInstance, [status: CREATED] }
        }
    }

    def edit(Champion championInstance) {
        respond championInstance
    }

    @Transactional
    def update(Champion championInstance) {
        if (championInstance == null) {
            notFound()
            return
        }

        if (championInstance.hasErrors()) {
            respond championInstance.errors, view:'edit'
            return
        }

        championInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Champion.label', default: 'Champion'), championInstance.id])
                redirect championInstance
            }
            '*'{ respond championInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Champion championInstance) {

        if (championInstance == null) {
            notFound()
            return
        }

        championInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Champion.label', default: 'Champion'), championInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'champion.label', default: 'Champion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
