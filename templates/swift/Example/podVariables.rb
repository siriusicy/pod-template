def git_source; return 'https://github.com/CocoaPods/Specs.git'; end
##
def gitlab_url; return 'http://gitlab.yunwei.love9w.com/ios/'; end
def github_url; return 'https://github.com/siriusicy/'; end



def remotePod(name)
   pod name, :git => github_url+"#{name}.git",:branch=>'dev'
end

def _localPod(name)
   pod name, :path => "../../#{name}"
end
