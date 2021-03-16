#Variables
set FILE_NAME=SkorpioTemperatureTest
set BASE_DIR=Build_Onefile\
set OUT_DIR=%BASE_DIR%%FILE_NAME%
set TEMP_DIR=%BASE_DIR%Tmp

#Create executable
pyinstaller  --onefile Main.py --name %FILE_NAME% --distpath %OUT_DIR% --workpath %TEMP_DIR% 

#Copy configfile into build directory
copy Config_TC.xml %OUT_DIR%
copy Config_TS.xml %OUT_DIR%

#Delect .spec file
del %FILE_NAME%.spec