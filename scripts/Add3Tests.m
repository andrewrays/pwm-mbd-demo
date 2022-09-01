classdef Add3Tests < matlab.unittest.TestCase

    methods(Test)
        
        function testSimpleSum(testCase)
            answerExpected = 8;

            answerActual = add3(1,3,4);

            testCase.verifyEqual(answerActual,answerExpected);
        end
    end

end