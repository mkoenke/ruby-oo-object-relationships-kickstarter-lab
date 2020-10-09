class Backer
    attr_accessor :name

    def initialize(name)
        @name = name
    end 

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    # def backed_projects
    #     ProjectBacker.all.map do |project_backed|
    #         if  project.backer == self
    #             project_backed.project.compact!
    #         end
    #     end
    # end

    def backed_projects
        projects.collect  {|bp| bp.project}
    end

    private

    def projects 
        ProjectBacker.all.select {|bp| bp.backer == self}
    end
    
end 