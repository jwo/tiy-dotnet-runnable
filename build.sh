# Single runnable files
if [ -f /tmp/code ]; then
  mv /tmp/code /app/Program.cs
fi

# Multiple files
if ls -d /tmp/*.cs > /dev/null 2>&1    
then
  mv /tmp/*.cs /app
fi

# we pipe the output of dotnet run into sed
# sed will delete anything up to and including the Time elapsed
# The normal output would look like the following with no perceivable way to
#   disable it
#
#Project app (.NETCoreApp,Version=v1.0) will be compiled because expected outputs are missing
#Compiling app for .NETCoreApp,Version=v1.0
#Compilation succeeded.
#    0 Warning(s)
#    0 Error(s)
#Time elapsed 00:00:02.4995823
#Hello World!%       
#
# It could also have a compilation error, in which case it will look like the
# following: 
#/usr/share/dotnet/dotnet compile-csc @/app/obj/Debug/netcoreapp1.0/dotnet-compile.rsp returned Exit Code 1
#/app/Program.cs(10,2): error CS1513: } expected
#Project app (.NETCoreApp,Version=v1.0) will be compiled because expected outputs are missing
#Compiling app for .NETCoreApp,Version=v1.0
#Compilation failed.
#    0 Warning(s)
#    1 Error(s)
#Time elapsed 00:00:01.9012759
#
# So... we'll delete from /Project app/ to /Time elapsed/

cd /app && dotnet run | sed '/Project app/,/Time elapsed/d'
