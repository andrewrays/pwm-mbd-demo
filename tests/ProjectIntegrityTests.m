classdef ProjectIntegrityTests < matlab.unittest.TestCase

    methods(Test)

        function testMainFoldersExistence(testCase)
            foldersList = {'data'; 'documents'; 'models'; 'resources'; ...
                'scripts'; 'tests'; 'utilities'; 'work'};

            existenceExpected = true(length(foldersList),1);

            existenceActual = cellfun(@(x) exist(x,'dir') == 7, foldersList);

            testCase.verifyEqual(existenceActual,existenceExpected);
        end

        function testSubfoldersExistence(testCase)
            foldersList = {'dictionaries'; 'experiments'; 'simulation'; ...
                'reports'; 'requirements'; 'cache'; 'codegen'};


            existenceExpected = true(length(foldersList),1);

            existenceActual = cellfun(@(x) exist(x,'dir') == 7, foldersList);

            testCase.verifyEqual(existenceActual,existenceExpected);
        end

        function testModelFolderContent(testCase)
            folderContentList = what('..\pwm-mbd-demo\models');

            contentNecessary = logical([0 1 1 1 1 1 1 0 1 1 1 1])';

            contentActual = structfun(@(x) isempty(x), folderContentList);

            testCase.verifyEqual(contentActual,contentNecessary);
        end
        
        function testScriptsFolderContent(testCase)
            folderContentList = what('..\pwm-mbd-demo\scripts');

            contentNecessary = logical([0 0 1 1 1 1 1 1 1 1 1 1])';

            contentActual = structfun(@(x) isempty(x), folderContentList);

            testCase.verifyEqual(contentActual,contentNecessary); 
        end
        
        function testUtilitiesFolderContent(testCase)
            folderContentList = what('..\pwm-mbd-demo\utilities');

            contentNecessary = logical([0 0 1 1 1 1 1 1 1 1 1 1])';

            contentActual = structfun(@(x) isempty(x), folderContentList);

            testCase.verifyEqual(contentActual,contentNecessary); 
        end

        function testDictionariesFolderContent(testCase)
            folderContentList = dir(fullfile('dictionaries', '*.*'));

            contentNecessary = cell(1,length(folderContentList)-2);

            for i = 3:length(folderContentList)
                contentNecessary{i-2} = folderContentList(i).name;
            end
            
            contentActual = all(cellfun(@(x) contains(x,'.sldd'), contentNecessary));

            testCase.verifyEqual(contentActual,true);
        end
    end

end