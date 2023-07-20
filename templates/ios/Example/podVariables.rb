def git_source; return 'https://github.com/CocoaPods/Specs.git'; end
def private_source; return 'https://jihulab.com/yaya-ios/yayaspec.git'; end
def aliyun_source; return 'https://github.com/aliyun/aliyun-specs.git' end
def local; return 'local'; end
def remote; return 'remote'; end
def gitee; return 'https://jihulab.com/yaya-ios/'; end

def remotePod(name)
   pod name, :git => gitee+"#{name}.git",:branch=>'dev'
end

def _localPod(name)
   pod name, :path => "../../#{name}"
end
