CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if[[-e -f ListExamples.java]]
then 
    echo "student-submission found"
else
    throw new RuntimeException("student-submission not found")
fi 

cd ..
mkdir test-environment
cp student-submission test-environment
cp TestListExamples.java test-environment
cd test-environment


javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 
if[[$? -neq 0]]
then 
    throw new RunTimeExcpetion("errors!");
fi

java -cp /:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore student-submission



