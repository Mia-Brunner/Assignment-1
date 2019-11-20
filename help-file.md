## Help File

#### Steps to install application

1. `git clone https://github.com/MiaBru/Assignment-1.git`

2. Access shell file build.sh
```
#!/bin/sh

# make a distribution directory
mkdir -p dist

# copy Ruby files to the distribution directory
cp ./My_health_app.rb ./dists

# install required gems
gem install tty-spinner
gem install tty-prompt
gem install tty-font
gem install pastel 
```
3.  On Terminal run the following command `chmod +x ./build.sh` on master file to execute permissions 
3. Then run the script `./build.sh` to automatically download required files 

#### Testing
`ruby testing.rb`



