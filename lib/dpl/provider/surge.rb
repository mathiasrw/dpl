module DPL
  class Provider
    class Surge < Provider
      npm_g 'surge'

      def project
        File.expand_path("./" + (options[:project] || '') )
      end

      def domain
        options[:domain] || ''
      end

      def check_auth
	#if ! context.env['SURGE_TOKEN'] then raise Error, "Please add SURGE_TOKEN in Travis settings (get your token with 'surge token')"
        #if ! context.env['SURGE_LOGIN'] then raise Error, "Please add SURGE_LOGIN in Travis settings (its your email)"
      end

      def check_app
      	#if ! File.directory?(project) then raise Error, "Please set a valid project folder path in .travis.yml under deploy: project: myPath"
      	#if domain.empty? && ! File.exist?("#{project}/CNAME") then raise Error, "Please set domain in .travis.yml under deploy: project: myDomain (or in a CNAME file in the repo project folder)" 
      end

      def needs_key?
        false
      end

      def push_app
      	context.shell "echo a " + ENV['HOME']
      	context.shell "cd .."
      	context.shell "echo b " + ENV['HOME']
        #context.shell "surge #{project} #{domain}"
      end
    end
  end
end
